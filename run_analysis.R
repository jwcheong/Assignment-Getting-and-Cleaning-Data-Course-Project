## Load relevant R libraries
library(dplyr)

## Download and Extract files onto local directory
fileurl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip"
temp <- tempfile()
download.file(fileurl, temp, method = "curl")
unzip(temp)
unlink(temp)

## Import Training and Test Sets into R
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")
X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")


## Merge the training and test sets into one data set
mergedata <- rbind(X_test,X_train)


## Appropriately labels the data set with descriptive variable names.
features <- read.table("./UCI HAR Dataset/features.txt") 
features <- as.vector(features$V2)
colnames(mergedata) <- features


## Extract only the measurements on the mean and standard deviation
mergedata <- mergedata[,grepl("mean|std", features)]


## Use descriptive activity names to name the activities in the data set
activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")
y_merge <- rbind(y_test,y_train) %>% 
        merge(activity_labels, by.x = "V1", by.y = "V1" ) %>% 
        select(V2) %>% rename(Activity = V2)
mergedata <- cbind(y_merge, mergedata)


## Identify subjects
subject_merge <- rbind(subject_test,subject_train) %>% rename(Subject = V1)
mergedata <- cbind(subject_merge, mergedata)

## Average of each variable for each activity and each subject
summarydata <- mergedata %>% group_by(Subject, Activity) %>% 
        summarize_each(funs(mean))



