X2001Census <- read.csv.ffdf(NULL, "2011.Combined.Dataset.Coded.csv")

# remove ward,Percentage_family, households columns from dataframe
mydata <- X2001Census[setdiff(colnames(X2001Census), c("Ward"))]

f <- cbind(AGE_INDEX,INCOME_INDEX,EDUCATION_INDEX,PERCENTAGE_WHITE,PERCENTAGE_FAMILY,HOUSEHOLDS)~1

## models with different number of groups without covariates:
set.seed(01012)
lc1<-poLCA(f, data=mydata, nclass=1, na.rm = FALSE, nrep=30, maxiter=3000) #Loglinear independence model.
lc2<-poLCA(f, data=mydata, nclass=2, na.rm = FALSE, nrep=30, maxiter=3000)
lc3<-poLCA(f, data=mydata, nclass=3, na.rm = FALSE, nrep=30, maxiter=3000)
lc4<-poLCA(f, data=mydata, nclass=4, na.rm = FALSE, nrep=30, maxiter=3000) 
lc5<-poLCA(f, data=mydata, nclass=5, na.rm = FALSE, nrep=30, maxiter=3000)
lc6<-poLCA(f, data=mydata, nclass=6, na.rm = FALSE, nrep=30, maxiter=3000)

# generate dataframe with fit-values

results <- data.frame(Modell=c("Model 1"),
                      log_likelihood=lc1$llik,
                      df = lc1$resid.df,
                      BIC=lc1$bic,
                      ABIC=  (-2*lc1$llik) + ((log((lc1$N + 2)/24)) * lc1$npar),
                      CAIC = (-2*lc1$llik) + lc1$npar * (1 + log(lc1$N)), 
                      likelihood_ratio=lc1$Gsq)
results$Modell<-as.integer(results$Modell)
results[1,1]<-c("Model 1")
results[2,1]<-c("Model 2")
results[3,1]<-c("Model 3")
results[4,1]<-c("Model 4")
results[5,1]<-c("Model 5")
results[6,1]<-c("Model 6")

results[2,2]<-lc2$llik
results[3,2]<-lc3$llik
results[4,2]<-lc4$llik
results[5,2]<-lc5$llik
results[6,2]<-lc6$llik

results[2,3]<-lc2$resid.df
results[3,3]<-lc3$resid.df
results[4,3]<-lc4$resid.df
results[5,3]<-lc5$resid.df
results[6,3]<-lc6$resid.df

results[2,4]<-lc2$bic
results[3,4]<-lc3$bic
results[4,4]<-lc4$bic
results[5,4]<-lc5$bic
results[6,4]<-lc6$bic

results[2,5]<-(-2*lc2$llik) + ((log((lc2$N + 2)/24)) * lc2$npar) #abic
results[3,5]<-(-2*lc3$llik) + ((log((lc3$N + 2)/24)) * lc3$npar)
results[4,5]<-(-2*lc4$llik) + ((log((lc4$N + 2)/24)) * lc4$npar)
results[5,5]<-(-2*lc5$llik) + ((log((lc5$N + 2)/24)) * lc5$npar)
results[6,5]<-(-2*lc6$llik) + ((log((lc6$N + 2)/24)) * lc6$npar)

results[2,6]<- (-2*lc2$llik) + lc2$npar * (1 + log(lc2$N)) #caic
results[3,6]<- (-2*lc3$llik) + lc3$npar * (1 + log(lc3$N))
results[4,6]<- (-2*lc4$llik) + lc4$npar * (1 + log(lc4$N))
results[5,6]<- (-2*lc5$llik) + lc5$npar * (1 + log(lc5$N))
results[6,6]<- (-2*lc6$llik) + lc6$npar * (1 + log(lc6$N))

results[2,7]<-lc2$Gsq
results[3,7]<-lc3$Gsq
results[4,7]<-lc4$Gsq
results[5,7]<-lc5$Gsq
results[6,7]<-lc6$Gsq

poLCA.entropy.fix <- function (lc)
{
  K.j <- sapply(lc$probs, ncol)
  fullcell <- expand.grid(sapply(K.j, seq, from = 1))
  P.c <- poLCA.predcell(lc, fullcell)
  return(-sum(P.c * log(P.c), na.rm = TRUE))
}

results[1,8]<-c("-")
results[2,8]<-round(poLCA.entropy.fix(lc2),3)
results[3,8]<-round(poLCA.entropy.fix(lc3),3)
results[4,8]<-round(poLCA.entropy.fix(lc4),3)
results[5,8]<-round(poLCA.entropy.fix(lc5),3)
results[6,8]<-round(poLCA.entropy.fix(lc6),3)
                    
# combining results to a dataframe
colnames(results)<-c("Model","log-likelihood","resid. df","BIC","aBIC","cAIC","likelihood-ratio","Absolute Entropy")
lca_results<-results
lca_results

plot(lc2)
plot(lc3)
plot(lc4)
plot(lc5)
plot(lc6)