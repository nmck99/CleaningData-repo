setwd("C:/Users/ncm/Documents/R")
####load dplyr
library(dplyr)
####read X_train.txt this contains training summary data in 561 columns
x_train<-read.table("data/X_train.txt")
####read features.txt this contains the headings for the 561 columns
features<-read.table("data/features.txt")
####name columns of  "a" and "b" Column "b" contains description of variable
colnames(features)<- c("a","b")
#### select columns names with "mean()" or "std()"
selectedcolnames1<-filter(features, grepl("mean()",b))
selectedcolnames2<-filter(features, grepl("std()",b))
###bind the vectors containing variable names including mean() or std()
selectedcolnames3<-rbind(selectedcolnames1,selectedcolnames2)
####arrange in numerical order to match numbers of X-train
selectedcolnames4<-arrange(selectedcolnames3,a)
####create variable selnums with numbers of columns to be selected
selnums<-selectedcolnames4$a
selnames<-as.character(selectedcolnames4$b)
###### select columns with mean() or std()
data<-select(x_train,selnums)
####load test data and select desired columns
x_test<-read.table("data/X_test.txt")
data2<-select(x_test,selnums)
data3<-rbind(data,data2)
####name columns of data3 with wanted variable names
names(data3)<-selnames
###add subject numbers
subject_train<-read.table("data/subject_train.txt")
subject_test<-read.table("data/subject_test.txt")
subject<-rbind(subject_train,subject_test)
names(subject)<-c("subject")
####add activities
y_train<-read.table("data/y_train.txt")
y_train[y_train=="1"] <- "walking"
y_train[y_train=="2"] <- "walking upstairs"
y_train[y_train=="3"] <- "walking downstairs"
y_train[y_train=="4"] <- "sitting"
y_train[y_train=="5"] <- "standing"
y_train[y_train=="6"] <- "laying"
names(y_train)<-c("activity")
y_test<-read.table("data/y_test.txt")
y_test[y_test=="1"] <- "walking"
y_test[y_test=="2"] <- "walking upstairs"
y_test[y_test=="3"] <- "walking downstairs"
y_test[y_test=="4"] <- "sitting"
y_test[y_test=="5"] <- "standing"
y_test[y_test=="6"] <- "laying"
names(y_test)<-c("activity")
###create activity data frame
activity<-rbind(y_train,y_test)
####bind subject and activities to data3
data4<-cbind(activity,data3)
data5<-cbind(subject,data4)
####group by activity then by subject and then find mean
data6<-data5 %>% group_by(activity,subject) %>% summarise_each(funs(mean))
write.table(data6, file = "data6.txt", row.name=FALSE)
