library("depmixS4")
library(seqHMM)
set.seed(1)
df <-  as.vector(t(LCA_best_model_2011$predclass))
df <- as.data.frame(df)
colnames(df) <- c("v1")
df <- log(df)
HMM <- depmix(v1 ~ 1,
              data = df,
              nstates = 3,
              family = multinomial("identity"))
model <- fit(HMM, verbose = FALSE)

post_probs <- posterior(model)
plot(post_probs$state, type='s', main='True Classes', xlab='', ylab='Class')
opar = par(oma = c(0,0,0,0)) # Large right margin for plot
matplot(post_probs[,-1], type='l', main='Class Posterior Probabilities', ylab='Probability')
legend(x='bottomright', c('Class 1','Class 2', 'Class 3'), fill=1:3,bty="N",cex=0.8, y.intersp = 2)
par(opar)

summary(post_probs)
