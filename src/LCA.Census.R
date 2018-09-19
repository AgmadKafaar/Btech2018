# Install ff to read datasets from disk instead of memory
#install.packages("ff")

# Install poLCA to run Latent Class Analysis on polytomous variables
#install.packages("poLCA")

# Load ff and poLCA into workspace
library("ff")
library("poLCA")

fftempdir = "~/GitHub/Btech2018/data/Tempff"

# Chunk load 2001 census data into dataframe from csv file
X2001Census <- read.csv.ffdf(NULL, "~/GitHub/Btech2018/data/Worksheet/2001.Combined.Dataset.Coded.Dummy.csv")

# remove ward column from dataframe
X2001Census_sub <- X2001Census[setdiff(colnames(X2001Census), c("Ward"))]

func <- cbind(AGE_INDEX,INCOME_INDEX,EDUCATION_INDEX,PERCENTAGE_WHITE,PERCENTAGE_FAMILY,HOUSEHOLDS)~1

max_II <- -100000
min_bic <- 100000

for(i in 2:10){
  lca <- poLCA(func, X2001Census_sub, nclass=i, maxiter=3000, 
               tol=1e-5, na.rm=FALSE,  
               nrep=10, verbose=TRUE, calc.se=TRUE)
  if(lca$bic < min_bic){
    min_bic <- lca$bic
    LCA_best_model<-lca
  }
}    	
LCA_best_model
