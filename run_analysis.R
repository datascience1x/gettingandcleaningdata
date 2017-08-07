setwd('C:/Users/Ren/Desktop/Data Science Course JHU/Course 3 - Getting and Cleaning Data/Assignment/UCI HAR Dataset')
install.packages("reshape2")
library("reshape2")

# read data into data frames
subject_train <- read.table('train/subject_train.txt')
subject_test <- read.table('test/subject_test.txt')
X_train <- read.table('train/X_train.txt')
X_test <- read.table('test/X_test.txt')
y_train <- read.table('train/y_train.txt')
y_test <- read.table('test/y_test.txt')

activity_labels <- read.table('activity_labels.txt')
features <- read.table('features.txt') 

## STEP 1: Merges the training and the test sets to create one data set
dataSet <- rbind(X_train,X_test)

## STEP 2: Extracts only the measurements on the mean and standard
## deviation for each measurement. This will create a vector of only mean
## and standard dev
MeanStdOnly <- grep("mean()|std()", features[, 2]) 
dataSet <- dataSet[,MeanStdOnly]

## STEP 4: Appropriately labels the data set with descriptive
## activity names.

# Create vector of "Clean" feature names by getting rid of "()" apply to the dataSet to rename labels.
CleanFeatureNames <- sapply(features[, 2], function(x) {gsub("[()]", "",x)})
names(dataSet) <- CleanFeatureNames[MeanStdOnly]

## STEP 3: Uses descriptive activity names to name the activities
## in the data set.

act_group <- factor(dataSet$activity)
levels(act_group) <- activity_labels[,2]
dataSet$activity <- act_group

## STEP 5: Creates a second, independent tidy data set with the
## average of each variable for each activity and each subject.

# melt data to tall skinny data and cast means. Finally write the tidy data to the working directory as "tidy.csv"
baseData <- melt(dataSet,(id.vars=c("subject","activity")))
secondDataSet <- dcast(baseData, subject + activity ~ variable, mean)
names(secondDataSet)[-c(1:2)] <- paste("[Mean of]" , names(secondDataSet)[-c(1:2)] )
write.csv(secondDataSet, "tidy.csv", row.names=FALSE)
