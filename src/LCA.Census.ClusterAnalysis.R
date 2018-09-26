census <- read.csv("2001.Combined.Dataset.Coded.csv")

#do some cluster analysis
#compute distance between first 20 observations
distance <-dist(census[1:20,-1])

# get matrix of distance
distance <- data.matrix(distance)
#get dimensions of distance object
dim<- ncol(distance)

#create a heatmap
#first 20 observations as axis
image(1:dim, 1:dim, distance, axes = FALSE, xlab="", ylab="")
axis(1, 1:dim, census[1:20,1], cex.axis = 0.5, las=3)
axis(2, 1:dim, census[1:20,1], cex.axis = 0.5, las=1)
#add distance vals to heatmap
text(expand.grid(1:dim, 1:dim), sprintf("%0.1f", distance), cex=0.6)