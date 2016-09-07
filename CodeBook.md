### Code Book

This code book summarizes the resulting data fields in the tidy data, `tidydata.txt` file.

## Identifiers

* `subject` - The ID of the training and test subject, a total of 30 subjects.
* `activity` - The type of activity performed when the corresponding measurements were taken, 6 distinct activities.

## Measurements

* `timeBodyAccelerometerMeanX`
* `timeBodyAccelerometerMeanY`
* `timeBodyAccelerometerMeanZ`
* `timeBodyAccelerometerStdDevX`
* `timeBodyAccelerometerStdDevY`
* `timeBodyAccelerometerStdDevZ`
* `timeGravityAccelerometerMeanX`
* `timeGravityAccelerometerMeanY`
* `timeGravityAccelerometerMeanZ`
* `timeGravityAccelerometerStdDevX`
* `timeGravityAccelerometerStdDevY`
* `timeGravityAccelerometerStdDevZ`
* `timeBodyAccelerometerJerkMeanX`
* `timeBodyAccelerometerJerkMeanY`
* `timeBodyAccelerometerJerkMeanZ`
* `timeBodyAccelerometerJerkStdDevX`
* `timeBodyAccelerometerJerkStdDevY`
* `timeBodyAccelerometerJerkStdDevZ`
* `timeBodyGyroscopeMeanX`
* `timeBodyGyroscopeMeanY`
* `timeBodyGyroscopeMeanZ`
* `timeBodyGyroscopeStdDevX`
* `timeBodyGyroscopeStdDevY`
* `timeBodyGyroscopeStdDevZ`
* `timeBodyGyroscopeJerkMeanX`
* `timeBodyGyroscopeJerkMeanY`
* `timeBodyGyroscopeJerkMeanZ`
* `timeBodyGyroscopeJerkStdDevX`
* `timeBodyGyroscopeJerkStdDevY`
* `timeBodyGyroscopeJerkStdDevZ`
* `timeBodyAccelerometerMagnitudeMean`
* `timeBodyAccelerometerMagnitudeStdDev`
* `timeGravityAccelerometerMagnitudeMean`
* `timeGravityAccelerometerMagnitudeStdDev`
* `timeBodyAccelerometerJerkMagnitudenitudeMean`
* `timeBodyAccelerometerJerkMagnitudenitudeStdDev`
* `timeBodyGyroscopeMagnitudeMean`
* `timeBodyGyroscopeMagnitudeStdDev`
* `timeBodyGyroscopeJerkMagnitudenitudeMean`
* `timeBodyGyroscopeJerkMagnitudenitudeStdDev`
* `frequencyBodyAccelerometerMeanX`
* `frequencyBodyAccelerometerMeanY`
* `frequencyBodyAccelerometerMeanZ`
* `frequencyBodyAccelerometerStdDevX`
* `frequencyBodyAccelerometerStdDevY`
* `frequencyBodyAccelerometerStdDevZ`
* `frequencyBodyAccelerometerJerkMeanX`
* `frequencyBodyAccelerometerJerkMeanY`
* `frequencyBodyAccelerometerJerkMeanZ`
* `frequencyBodyAccelerometerJerkStdDevX`
* `frequencyBodyAccelerometerJerkStdDevY`
* `frequencyBodyAccelerometerJerkStdDevZ`
* `frequencyBodyGyroscopeMeanX`
* `frequencyBodyGyroscopeMeanY`
* `frequencyBodyGyroscopeMeanZ`
* `frequencyBodyGyroscopeStdDevX`
* `frequencyBodyGyroscopeStdDevY`
* `frequencyBodyGyroscopeStdDevZ`
* `frequencyBodyAccelerometerMagnitudeMean`
* `frequencyBodyAccelerometerMagnitudeStdDev`
* `frequencyBodyAccelerometerJerkMagnitudenitudeMean`
* `frequencyBodyAccelerometerJerkMagnitudenitudeStdDev`
* `frequencyBodyGyroscopeMagnitudeMean`
* `frequencyBodyGyroscopeMagnitudeStdDev`
* `frequencyBodyGyroscopeJerkMagnitudenitudeMean`
* `frequencyBodyGyroscopeJerkMagnitudenitudeStdDev`


## Activity Labels

* `WALKING` (value `1`): subject was walking during the measurements
* `WALKING_UPSTAIRS` (value `2`): subject was walking up a staircase during the measurements
* `WALKING_DOWNSTAIRS` (value `3`): subject was walking down a staircase during the measurements
* `SITTING` (value `4`): subject was sitting during the measurements
* `STANDING` (value `5`): subject was standing during the measurements
* `LAYING` (value `6`): subject was laying down during the measurements

## The tidy data set
The tidy data set, `tidydata.txt`, is a set of variables for each activity and each subject. 
10299 observations was split into 180 groups (30 subjects and 6 activities). 
And 66 mean and standard deviation features were averaged for each group. 
The resulting data table has 180 rows and 68 columns . 
The 69 columns consists of 1 subject(30 factor levels of subjects), 1 activity(6 factor levels of activity), 33 Mean variables, 33 Standard deviation variables. The tidy data set’s first row is the header containing the names for each column.