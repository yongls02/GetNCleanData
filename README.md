## You should create one R script called run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject

1. Data are loaded from activity_labels.txt, features.txt, X_train.txt,
   Y_train.txt, subject_train.txt
2. Update column hader of X_train
3. Subset data with Mean & Std word in column name
4. replace Y_train lst column with thea activity label
5. Name the column "activity"
6. Name the column of subject_train as "subject"
7. Column combine subject_train, Y_train and X_train.
8. Repeat 1-7 for test data.
9. Row combine train and test data
10.Use aggregate function to get the tinyset and write as text file.



