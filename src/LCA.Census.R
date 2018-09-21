# Install ff to read datasets from disk instead of memory
#install.packages("ff")

# Install poLCA to run Latent Class Analysis on polytomous variables
#install.packages("poLCA")

# Load ff and poLCA into workspace
library("ff")
library("poLCA")

fftempdir = "~/GitHub/Btech2018/data/Tempff"

# Chunk load 2001 census data into dataframe from csv file
X2001Census <- read.csv.ffdf(NULL, "2001.Combined.Dataset.Coded.csv")

# remove ward column from dataframe
X2001Census_sub <- X2001Census[setdiff(colnames(X2001Census), c("Ward","PERCENTAGE_FAMILY","HOUSEHOLDS"))]

func <- cbind(AGE_INDEX,INCOME_INDEX,EDUCATION_INDEX,PERCENTAGE_WHITE)~1

max_II <- -100000
min_bic <- 100000

for(i in 2:4){
  lca <- poLCA(func, X2001Census_sub, nclass=i, maxiter=10000, 
               tol=1e-3, na.rm=FALSE,  
               nrep=5000, verbose=TRUE, calc.se=TRUE)
  if(lca$bic < min_bic){
    min_bic <- lca$bic
    LCA_best_model<-lca
  }
}    	
LCA_best_model

X2011Census <- read.csv.ffdf(NULL, "2011.Combined.Dataset.Coded.csv")

# remove ward column from dataframe
X2011Census_sub <- X2011Census[setdiff(colnames(X2011Census), c("Ward","PERCENTAGE_FAMILY","HOUSEHOLDS"))]

max_II <- -100000
min_bic <- 100000

for(i in 2:4){
  lca <- poLCA(func, X2011Census_sub, nclass=i, maxiter=10000, 
               tol=1e-3, na.rm=FALSE,  
               nrep=5000, verbose=TRUE, calc.se=TRUE)
  if(lca$bic < min_bic){
    min_bic <- lca$bic
    LCA_best_model_2011<-lca
  }
}    	
LCA_best_model_2011


