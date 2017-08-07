Code Book

This code book outlines the process used to complete the Getting and Cleaning Data Peer Reviewed Assignment. It describes the data used and process used to create a tidy data set. 

Files used and explanation of each:

subject_test : subject IDs for test
subject_train : subject IDs for train

X_test : values of variables in test
X_train : values of variables in train
y_test : activity ID in test
y_train : activity ID in train

activity_labels : Description of activity IDs in y_test and y_train
features : description(label) of each variables in X_test and X_train
dataSet : bind of X_train and X_test

Steps used to process and tidy data:
1. All data files above were read and column headers were appropriately added. 
2. The traing and test sets were combined into a single data set called 'dataSet'.
3. All columns not containing the exact text "mean()" or "std()" were pulled into 'dataSet'
4. descriptive activity names were used to name the activities in the data set using 'activity_labels'
5. A tidy data set was created, which contained the mean for each feature for each subject and activity. 
6. The output of the tidy data set was writed to .csv file.

