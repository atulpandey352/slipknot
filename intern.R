library(caret)
library(Metrics)

download.file("https://bit.ly/w-data",destfile="file.csv")
int<-read.csv("file.csv")
head(int)

#partitioning data
intrain<-createDataPartition(y=int$Scores,p=0.8,list=FALSE)
training<-int[intrain,]
testing<-int[-intrain,]

#making our model
model<-lm(Scores~Hours,data = training)

 
#plotting our model 
plot(training$Hours,training$Scores)
abline(model)

#testing our model
model_result<-predict(model,Hours<-data.frame(Hours=testing$Hours))
print(data.frame(testing$Scores, model_result))

#error calculation
error<-mae(testing$Scores, model_result)
print(c("error is",error))
