# Getting-and-Cleaning-Data-Week-4-Course-Project

The course project for Getting and Cleaning Data was to read in the "Human Activity Recognition Using Smartphones" data set, perform an analysis on the data set, and output a tidy data set.

The data used in this project was collected the accelerometers from the Samsung Galaxy S smartphone. A full description is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

The data used in this project may be downloaded from the following link:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

To run the run_analysis.R script, perform the following steps:

         1. Download the the zip file linked above
         2. Unzip the file 
         3. Move the following files to theh same directory as the script
                  * features.txt
                  * subject_train.txt
                  * subject_test.txt
                  * X_train.txt
                  * X_test.txt
                  * Y_train.txt
                  * Y_test.txt

__Once you've done that, run the script (run_analysis.R)__. If you don't have the dplyr package installed, download it from CRAN.

__The script outputs tidyed data as a .txt file__, "tidydata.txt".  See the codebook for more details on the 
variables in the data and how the analysis script works.
