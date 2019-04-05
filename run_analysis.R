#Eli Regen
#Getting and Cleaning Data
#April 2019
library(data.table)
library(dplyr)

#Set the working directory
setwd("~/Desktop/data_sci/Hopk_coursera/G&Cdata/UCI HAR alldata")

#Read in all relevant files
activity_test <- read.table("y_test.txt", header = FALSE)
activity_train <- read.table("y_train.txt", header = FALSE)
features_test <- read.table("X_test.txt", header = FALSE)
features_train <- read.table("X_train.txt", header = FALSE)
subject_test <- read.table("subject_test.txt", header = FALSE)
subject_train <- read.table("subject_train.txt", header = FALSE)
activity_labels <- read.table("activity_labels.txt", header = FALSE)
features_labels <- read.table("features.txt", header = FALSE)

#Merge dataframes
features_data <- rbind(features_test, features_train)
subject_data <- rbind(subject_test, subject_train)
activity_data <- rbind(activity_test, ActivityTrain)

#Rename colums in activity_data & activity_labels dataframes
names(activity_data) <- "ActivityN"
names(activity_labels) <- c("ActivityN", "Activity")

#Get factor of activity names
Activity <- left_join(activity_data, activity_labels, "ActivityN")[, 2]

#Rename subject_data columns
names(subject_data) <- "Subject"
#Rename features_data columns using columns from features_labels
names(features_data) <- features_labels$V2

#concatenate all relavent variables into one table
alldata <- cbind(subject_data, Activity, features_data)

#Extractg the mean and std deviaiton 
subfeatures_labels <- features_labels$V2[grep("mean\\(\\)|std\\(\\)", 
                                              features_labels$V2)]
dataNames <- c("Subject", "Activity", as.character(subfeatures_labels))
alldata <- subset(alldata, select=dataNames)

#Replace column names with more descriptive activity names
names(alldata)<-gsub("^t", "time", names(alldata))
names(alldata)<-gsub("^f", "frequency", names(alldata))
names(alldata)<-gsub("Acc", "Accelerometer", names(alldata))
names(alldata)<-gsub("Gyro", "Gyroscope", names(alldata))
names(alldata)<-gsub("Mag", "Magnitude", names(alldata))
names(alldata)<-gsub("BodyBody", "Body", names(alldata))

#Create tidy datatable with the averages we want
new_table<-aggregate(. ~Subject + Activity, alldata, mean)
new_table<-new_table[order(new_table$Subject,new_table$Activity),]

#Finally write it all out to a .txt file
write.table(new_table, file = "tidydata.txt",row.name=FALSE)