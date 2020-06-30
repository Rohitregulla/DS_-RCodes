universities<-read.csv("/Users/rohitregulla/Downloads/PCA.csv"
universities1<-scale(universities[,2:7])
pca<-princomp(universities1,scores = TRUE)

summary(pca)
pca$scores

#pca$loadings

plot(pca$scores[,1:2],col="Blue",cex = 0.2)
text(pca$scores[,1:2], labels=c(1:25), cex= .7)
