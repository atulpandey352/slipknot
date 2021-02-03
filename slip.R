download.file("https://bit.ly/3kXTdox",destfile = "file.csv")
library(ggplot2)
library(factoextra)
library(NbClust)
summary(c_file)
#we  will be using kmeans 
c_file<-iris
c_file<-read.csv("file.csv")
head(c_file)
c_file<-c_file[,3:4]
c_file<- c_file[complete.cases(c_file),]
#finsing optimal number for clustering
#elbow method which uses the within cluster sums of squares)
fviz_nbclust(c_file[,1:4], kmeans, method = "wss")  +labs(subtitle = "Elbow method")
 

#hence number of centres should be four


model<-kmeans(c_file[,1:4],3,nstart = 30)
plot(c_file,col = model$cluster)
table(model$cluster,c_file$Species)
