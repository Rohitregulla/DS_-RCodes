phone_data <- read.csv(file.choose("/Users/rohitregulla/Downloads/ DS/Assigiments/phonedata.txt"))
# phone_data1 <- readLines(file.choose()) # if we use readLines functions more lines will be reduced
View(phonedata)
str(phonedata)
# converting everything into character format 
phonedata[] <- lapply(phonedata,as.character)
View(phonedata)
# Creating a custom fucntion to collapse all the items in a transaction into 
# a single sentence 
paste_fun <- function(i){
  return (paste(as.character(i),collapse=" "))
}

# Applying the custom function
phonedata["new_col"] <- apply(phonedata,1,paste_fun)
View(phonedata)

install.packages("tm")
# tm package is used to do text manipulation and forming DTM and TDM matrices
library(tm)
x <- Corpus(VectorSource(phonedata$new_col)) # Selecting the new column which
# contains all items of a transaction in a single sentence
x <- tm_map(x,stripWhitespace)
# Creating a TDM matrix
dtm0 <- t(TermDocumentMatrix(x))
# Converting TDM matrix to data frame
dtm0_df <- data.frame(as.matrix(dtm0))
View(dtm0_df)

# Association Rules 
install.packages("arules")
install.packages("arulesViz")
library(arules)
library(arulesViz)
# Item Frequecy plot
windows()
# count of each item from all the transactions 
barplot(sapply(dtm0_df,sum),col=1:10)
# Applying apriori algorithm to get relevant rules
rules <- apriori(as.matrix(dtm0_df),parameter = list(support=0.002,confidence=0.5,minlen=2))
inspect(rules)
plot(rules)

# Sorting rules by confidence 
rules_conf <- sort(rules,by="confidence")
inspect(rules_conf)
# Sorint rules by lift ratio
rules_lift <- sort(rules,by="lift")
inspect(rules_lift)

# Visualizing rules in scatter plot
?plot

plot(rules,method = "graph")
plot(rules,method = "graph")

