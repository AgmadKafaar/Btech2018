library("factoextra")
library("FactoMineR")
#load initial dataset
census <- read.csv("2001.Combined.Dataset.Coded.csv")

#remove ward from dataframe
census$Ward <- NULL

#perform PCA to identify which columns explain the highest variance
#perform PCA and set scale to true
pca <- prcomp(census, scale. = TRUE)

# mean 
pca$center

# standard deviation
pca$scale

# Get standard deviation of each principal component
std_dev <- pca$sdev

#compute variance
pr_var <- std_dev^2

#We aim to find the components which explain the maximum variance. 
#This is because, we want to retain as much information as possible using these components. 
#So, higher is the explained variance, higher will be the information contained in those components.
#To compute the proportion of variance explained by each component, 
#we simply divide the variance by sum of total variance.
prop_varex <- pr_var/sum(pr_var)

# [1] 5.804571e-01 2.164009e-01 1.401605e-01 4.445093e-02 1.853056e-02 2.879168e-34
# PC1 - 58% variance
# PC2 - 21% variance
# PC3 - 14% variance
# PC4 - 4% variance
# PC5 - 1% variance
# PC6 - 0.000000000000....2% variance

#To decide which principle components to use in modeling, we'll use a scree plot.
#visualise scree plot
#Scree plot shows that PC1-4 explains ~90% of variance.
#Using PCA we've reduced to 6 to 4
fviz_eig(pca, addlabels = TRUE)

# to confirm scree, we'll plot a cumulative variance plot - will give clear picture of components to use
#This plot shows that PC1-4 results in ~90% variance in the dataset.
plot(cumsum(prop_varex), xlab = "Principal Component",
     ylab = "Cumulative Proportion of Variance Explained",
     type = "b")

#cos 2 plot
fviz_cos2(pca, choice = "var")

fviz_pca_var(pca, col.var = "cos2",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"), 
             repel = TRUE)

fviz_pca_var(pca, col.var = "contrib",
             gradient.cols = c("#00AFBB", "#E7B800", "#FC4E07"),repel = TRUE)

library("corrplot")
var <- get_pca_var(pca)
# create correlation matrix of census dataset
census.cor <- cor(census)
corrplot(census.cor, is.corr=FALSE)

#quality of the representation for variables
corrplot(var$cos2, is.corr = FALSE)
#Contributions of the variables to the principal components
corrplot(var$contrib, is.corr=FALSE)

fviz_contrib(pca, choice = "var", axes = 1)
fviz_contrib(pca, choice = "var", axes = 2)

# Create a grouping variable using kmeans
# Create 3 groups of variables (centers = 3)
set.seed(123)
res.km <- kmeans(var$coord, centers = 3, nstart = 25)
grp <- as.factor(res.km$cluster)
# Color variables by groups
fviz_pca_var(pca, col.var = grp, 
             palette = c("#0073C2FF", "#EFC000FF", "#868686FF"),
             legend.title = "Cluster", repel = TRUE)

fviz_cos2(pca, choice = "ind") + coord_flip()