## Coursera Getting and Cleaning Data Course Project done on a windows 10 pc.
## By Okundaye Osasumwen Gabriel
## DESCRIPTION
##This R script,run_analysis.R, would do the following:
# 1. Merges the training and the test sets to create one data set.
# 2. Extracts only the measurements on the mean and standard deviation for each measurement.
# 3. Uses descriptive activity names to name the activities in the data set
# 4. Appropriately labels the data set with descriptive variable names.
# 5. From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
#LICENCE to use datasets
#[1] Davide Anguita, Alessandro Ghio, Luca Oneto, Xavier Parra and Jorge L. Reyes-Ortiz. Human Activity Recognition on Smartphones using a Multiclass Hardware-Friendly Support Vector Machine. International Workshop of Ambient Assisted Living (IWAAL 2012). Vitoria-Gasteiz, Spain. Dec 2012
############################################################################################################

# Clear the Global Environment and load required packages
rm(list=ls())
require(data.table)
require(dplyr)
require(reshape2)


filename <- "getdata_projectfiles_UCI HAR Dataset.zip"

## Download and unzip the dataset, then set appropriate working directory
if ((!file.exists("UCI HAR Dataset") | !grepl("UCI HAR Dataset$", getwd())) & (!file.exists(filename                    ))){c(
        fileURL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip",
        download.file(fileURL, filename) # date() = "Mon Sep 05 13:34:36 2016"
   )
}  



if (file.exists("UCI HAR Dataset") & !grepl("UCI HAR Dataset$", getwd())) { 
        ##set working directory to the location where the UCI HAR Dataset was unzipped
        setwd("./UCI HAR Dataset/")
}

if (!file.exists("UCI HAR Dataset") & !grepl("UCI HAR Dataset$", getwd())) {
        unzip(filename)
        ##set working directory to the location where the UCI HAR Dataset was unzipped
        setwd("./UCI HAR Dataset/")
}


## 1. Merges the training and the test sets to create one data set.
#training_set
X_train <- read.table(file = "./train/X_train.txt")
colnames(X_train) <- (read.table(file = "./features.txt"))$V2  

y_train <- read.table(file = "./train/y_train.txt")
colnames(y_train) <-"ActivityId" #Activity label

subject_train <- read.table(file = "./train/subject_train.txt")
colnames(subject_train) <-"subject"

set_identifier_train <- matrix((data=rep("training",NROW(X_train))), ncol=1)
colnames(set_identifier_train) <- "Set"

# Merging subject_train, y_train,X_train in one training set
training_set= cbind(set_identifier_train,subject_train, y_train,X_train)
#View(training_set)

#test set
X_test <- read.table(file = "./test/X_test.txt")
colnames(X_test) <- (read.table(file = "./features.txt"))$V2

y_test <- read.table(file = "./test/y_test.txt")
colnames(y_test) <-"ActivityId" #Activity label

subject_test <- read.table(file = "./test/subject_test.txt")
colnames(subject_test) <-"subject"

set_identifier_test <- matrix((data=rep("test",NROW(X_test))), ncol=1)
colnames(set_identifier_test) <- "Set"

# Merging subject_test, y_test,X_test in one test set
test_set= cbind(set_identifier_test,subject_test, y_test,X_test)
#View(y_test)


# Finally, merges the training and the test sets to create one data set.
training_test_set <- rbind(training_set,test_set)

#View(trainin_test_set)



## 2. Extracts only the measurements on the mean and standard deviation for each measurement. 
measurement_names <- colnames(training_test_set[4 : 564]) #measurements starts from column 4 and end in last column 564.

# Create a logical vector (mean_std) that contains TRUE for measurements on the mean and standard deviation
# Measurements with only mean() or std() are the need variables to be extracted
mean_std <-  grepl("(.*)[Mm]ean\\(\\)|(.*)[Ss]td\\(\\)",measurement_names) 
#sum(mean_std) # To check correct no of columns selected with either mean or std in them

#Finally, extraction of the measurements on the mean and standard deviation
Extracted_mean_std <- training_test_set[, c(colnames(training_test_set[1:3]), measurement_names[mean_std])]

## 3. Uses descriptive activity names to name the activities in the data set
colnames(Extracted_mean_std)[3] <-  "activity"
# Convert subjects & activities into factors in tdh
Extracted_mean_std$subject <- as.factor(Extracted_mean_std$subject)
Activity_factor <- read.table("./activity_labels.txt", stringsAsFactors = TRUE)
Extracted_mean_std$activity <- factor(Extracted_mean_std$activity, levels = Activity_factor[,1], labels = Activity_factor[,2])

## 4. Appropriately labels the data set with descriptive variable names.
# Cleaning up the variable names

for (i in 4:length(colnames(Extracted_mean_std))) 
{
        colnames(Extracted_mean_std)[i] = gsub("[-().]","",colnames(Extracted_mean_std)[i])
        colnames(Extracted_mean_std)[i] = gsub("std","StdDev",colnames(Extracted_mean_std)[i])
        colnames(Extracted_mean_std)[i] = gsub("mean","Mean",colnames(Extracted_mean_std)[i])
        colnames(Extracted_mean_std)[i] = gsub("^(t)","time",colnames(Extracted_mean_std)[i])
        colnames(Extracted_mean_std)[i] = gsub("^(f)","frequency",colnames(Extracted_mean_std)[i])
        colnames(Extracted_mean_std)[i] = gsub("([Gg]ravity)","Gravity",colnames(Extracted_mean_std)[i])
        colnames(Extracted_mean_std)[i] = gsub("([Bb]ody[Bb]ody|[Bb]ody)","Body",colnames(Extracted_mean_std)[i])
        colnames(Extracted_mean_std)[i] = gsub("[Gg]yro","Gyroscope",colnames(Extracted_mean_std)[i])
        colnames(Extracted_mean_std)[i] = gsub("Acc","Accelerometer",colnames(Extracted_mean_std)[i])
        colnames(Extracted_mean_std)[i] = gsub("[Mm]ag","Magnitude",colnames(Extracted_mean_std)[i])
        colnames(Extracted_mean_std)[i] = gsub("([Bb]odyaccjerkmag)","BodyAccJerkMagnitude",colnames(Extracted_mean_std)[i])
        colnames(Extracted_mean_std)[i] = gsub("JerkMag","JerkMagnitude",colnames(Extracted_mean_std)[i])
        colnames(Extracted_mean_std)[i] = gsub("GyroMag","GyroMagnitude",colnames(Extracted_mean_std)[i])
}


## 5.From the data set in step 4, creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# require(package="dplyr")
# require(package="reshape2")

tidy_data_set_melted <- melt(select(Extracted_mean_std, -1), id=(c("subject","activity")))

tidy_data_set_mean <- dcast(tidy_data_set_melted, subject + activity ~ variable, mean)


# View(tidy_data_set_mean)

## EXPORT the tidy data set
write.table(tidy_data_set_mean, "tidydata.txt", row.names = FALSE, quote = FALSE)

# tidydata_import <- read.table("tidydata.txt", header = TRUE)
# View(tidydata_import)   #"Wed Sep 07 03:04:00 2016"
