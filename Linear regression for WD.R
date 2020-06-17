#Load data
WD<-read.csv("/Users/rohitregulla/Downloads/WC_AT.csv")

# Visualization
boxplot(WD$AT,col="red")
boxplot(WD$Waist,col="red")

#Regression equation
#Syntax  model<-lm(y~x,data=data set name)
#column names
colnames(WD)
#Model building
newmodel<- lm(AT~Waist,data =WD)
summary(newmodel)
#Preparing new data frame with new data
new_AT=data.frame(Waist=c(40,75,200,55))
#Predict for the new data
sun1=predict(model,new_AT)
#Print predicted value
sun1

#Predict for daily variable from the historical data
pred<-predict(model)
#Print predicted values
pred



