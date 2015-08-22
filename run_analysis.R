## You should create one R script called run_analysis.R that does the following. 
## 1. Merges the training and the test sets to create one data set.
## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
## 3. Uses descriptive activity names to name the activities in the data set
## 4. Appropriately labels the data set with descriptive variable names. 
## 5. From the data set in step 4, creates a second, independent tidy data set 
##    with the average of each variable for each activity and each subject

setwd("C:/MOOC/GetNCleanData/getdata_projectfiles_UCI_HAR_Dataset/UCI_HAR_Dataset")

## activity legend eg 1=walk, etc
activityLabels <- read.table("activity_labels.txt")

## X features
features <- read.table("features.txt")

## read training data
xtrain <- read.table("./train/X_train.txt", header=FALSE, sep="")
names(xtrain) <- features[,2]
# get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
# subset the desired columns
xtrain <- xtrain[, mean_and_std_features]
## ytrain = train type (walk, sit, etc)
ytrain <- read.table("./train/Y_train.txt", header=FALSE, sep="")
# update values with correct activity names
ytrain[, 1] <- activityLabels[ytrain[, 1], 2]
# correct column name
names(ytrain) <- "activity"
## subjecttrain = trainer number
subjecttrain <- read.table("./train/subject_train.txt", header=FALSE, sep="")
names(subjecttrain) <- "subject"
## combine the 3 files
train <- cbind(subjecttrain,ytrain,xtrain)


## read test data
xtest <- read.table("./test/X_test.txt", header=FALSE, sep="")
names(xtest) <- features[,2]
# get only columns with mean() or std() in their names
mean_and_std_features <- grep("-(mean|std)\\(\\)", features[, 2])
# subset the desired columns
xtest <- xtest[, mean_and_std_features]
## ytest = train type (walk, sit, etc)
ytest <- read.table("./test/Y_test.txt", header=FALSE, sep="")
# update values with correct activity names
ytest[, 1] <- activityLabels[ytest[, 1], 2]
## correct column name
names(ytest) <- "activity"
## subjecttest = trainer number
subjecttest <- read.table("./test/subject_test.txt", header=FALSE, sep="")
names(subjecttest) <- "subject"
## combine the 3 files
test <- cbind(subjecttest,ytest,xtest)


## combine train and test file
combine <- rbind(train, test)

## create the tiny dataset
tinydataset <- aggregate(combine[,3:65], by = combine[,1:2], FUN=mean, simplify = TRUE, drop = TRUE)

write.table(tinydataset, "tinydataset.txt", row.name=FALSE)
