# Getting and Cleaning Data Project
NAME: Okundaye Osasumwen Gabriel

Repo for the submission of the course project for the Johns Hopkins Getting and Cleaning Data course.

## Overview
The purpose of this project is to demonstrate my ability to collect, work with, and clean a data set. The goal is to prepare tidy data that can be used for later analysis.

A full description of the data used in this project can be found at [The UCI Machine Learning Repository](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)

[The source data for this project can be found here.](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)

## Reproduceability of this script
This script is well written to be reproduceable. And the download and unzippng of the source data and creation of working directory is automated as necessary and does not need a manual editing. But if you must download the source data outside R, then you must create a directory named "UCI HAR Dataset" containing all needed source data and with folder structure identical to the zip file of the source data. And set your working directory within R to the afore-mentioned directory  so as to prevent any logical errors in the beginning of this script.

For the purpose of this project, the files in Inertial Signals folders are not used. The files that was used are as follows:

1. subject_train.txt

2. X_train.txt

3. y_train.txt

4. subject_test.txt

5. X_test.txt

6. y_test.txt

7. features.txt

8. activity_labels.txt

They were in their respective file paths identical to their file paths in the source data or zip file.

## Project Summary
The summary description of the project instructions is as follows.

You should create one R script called run_analysis.R that does the following:

1. Merges the training and the test sets to create one data set.

2. Extracts only the measurements on the mean and standard deviation for each measurement. 

3. Uses descriptive activity names to name the activities in the data set

4. Appropriately labels the data set with descriptive activity names. 

5. Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

## Additional Information
You can find additional information about the variables, data and transformations in the CodeBook.md file.

