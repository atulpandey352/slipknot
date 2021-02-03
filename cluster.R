download.file("https://bit.ly/3kXTdox",destfile = "file.csv")
library(ggplot2)
library(factoextra)
library(NbClust)


#we  will be using kmeans CLUSTERING
c_file<-read.csv("file.csv")
head(c_file)
summary(c_file)
c_file<-c_file[,1:4]





#removing na values and plot 
ggplot(iris,aes(x = Sepal.Length, y = Sepal.Width, col= Species)) + geom_point()
c_file<- c_file[complete.cases(c_file),]

#finDing optimal number of centres clustering
#elbow method which uses the within cluster sums of squares
fviz_nbclust(c_file[,1:4], kmeans, method = "wss")  +labs(subtitle = "Elbow method")
#hence number of centres should be three



#clustering
model<-kmeans(c_file[,1:4],3,nstart = 30)
plot(c_file,col = model$cluster)
table(model$cluster,c_file$Species)

#error calculation
(model$betweenss/model$totss)*100