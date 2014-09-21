# Readme file for run_analysis.R 

## Instructions for use
* Download and unzip the following zip file into your working R directory: [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
* Place the run_analysis.R script file located in this repository into your R working directory.

## Script overview
The run_analysis.R script processes the original data files by:
* Reading the features, activity, test, and training files with the read.table command.
* Merging the training and test sets to create one data set.
* Extracting only the measurements on mean and standard deviation from the merged data set.
* Replacing numerical activity values with descriptive names.
* Labeling the data set with descriptive variable names. 
* Taking the average of each variable for all measurements of each subject and activity.

## Results
The resulting tidy data frame is then output as a text file (tidy_DF.txt), using the write.table function.  To import the result back into R, the following code may be used:
```
data <- read.table("tidy_DF.txt", header = TRUE)
```
