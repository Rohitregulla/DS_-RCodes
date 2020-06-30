wine<-read.csv("/Users/rohitregulla/Downloads/wine.csv")

wine1<-scale(wine[,2:13])
pca<-princomp(wine1,scores = TRUE)

summary(pca)
pca$scores

#pca$loadings

plot(pca$scores[,1:9],col="Blue",cex = 0.2)
text(pca$scores[,1:9], labels=c(1:25), cex= .7)
