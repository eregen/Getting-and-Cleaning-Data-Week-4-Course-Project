This codebook describes the variables, data, and transformations involved in the **run_analysis.R** script.

## Required Libraries
```
dplyr and data.table
```

## Overview

30 volunteers performed 6 different activities of daily living (ADL) while wearing a waste-mounted smartphone. The smartphone captured various data about their movements.
The volunteers ranged between 19-48 years of age.  The ADLs include (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) while wearing a smartphone (Samsung Galaxy S II) on the waist. 
The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). 
The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. 
The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. 
From each window, a vector of features was obtained by calculating variables from the time and frequency domain.

## The Data

* ``` features.txt ```:  Names of the 561 features.
* ``` activity_labels.txt ```:  Names and IDs for each of the 6 activities.
* ``` X_train.txt ```:  7352 observations of the 561 features, for 21 of the 30 volunteers.
* ``` subject_train.txt ```:  A vector of 7352 integers, denoting the ID of the volunteer related to each of the observations in ```X_train.txt```.
* ``` y_train.txt ```:  A vector of 7352 integers, denoting the ID of the activity related to each of the observations in ```X_train.txt```.
* ``` X_test.txt ```:   2947 observations of the 561 features, for 9 of the 30 volunteers.
* ``` subject_test.txt ```:  A vector of 2947 integers, denoting the ID of the volunteer related to each of the observations in ```X_test.txt```.
* ``` y_test.txt ```:  A vector of 2947 integers, denoting the ID of the activity related to each of the observations in ```X_test.txt```.

## Processing steps

1. All of the relevant data files were read into data frames, appropriate column headers were added, and the training and test sets were combined into a single data set.

2. All feature columns were removed that did not contain the exact string "mean()" or "std()". This left 66 feature columns, plus the subjectID and activity columns.

3. The activity column was converted from a integer to a factor, using labels describing the activities.

4. A tidy data set was created containing the mean of each feature for each subject and each activity. Thus, subject #1 has 6 rows in the tidy data set (one row for each activity), and each row contains the mean value for each of the 66 features for that subject/activity combination. Since there are 30 subjects, there are a total of 180 rows.

5. The tidy data is outputed to a file called ```tidydata.txt``` in the working directory.
