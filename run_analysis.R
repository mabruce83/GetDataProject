  
  #### INCLUDE REQUIRED LIBRARIES #################################
  
  library(plyr)
  library(reshape2)

  #### READ ALL FILES NEEDED ######################################
  
  ## Read features if it does not exist in memory:
  if(!exists("features")) {
    features <- read.table("UCI HAR Dataset/features.txt")
  }
  
  ## Read activity labels if it does not exist in memory:
  if(!exists("activity_labels")) {
    activity_labels <- read.table("UCI HAR Dataset/activity_labels.txt")
  }
  
  ## Read test set if it does not exist in memory:
  if(!exists("subject_test")) {
    subject_test <- read.table("UCI HAR Dataset/test/subject_test.txt")
  }
  if(!exists("x_test")) {
    x_test <- read.table("UCI HAR Dataset/test/X_test.txt")
  }
  if(!exists("y_test")) {
    y_test <- read.table("UCI HAR Dataset/test/y_test.txt")
  }
  
  ## Read training set if it does not exist in memory:
  if(!exists("subject_train")) {
    subject_train <- read.table("UCI HAR Dataset/train/subject_train.txt")
  }
  if(!exists("x_train")) {
    x_train <- read.table("UCI HAR Dataset/train/X_train.txt")
  }
  if(!exists("y_train")) {
    y_train <- read.table("UCI HAR Dataset/train/y_train.txt")
  }
  
  #### MERGE TRAINING AND TEST SETS ###############################
    
  ## Merge x_train and x_test sets:
  x_merged <- rbind(x_train, x_test)
  
  ## Merge subject_train and subject_test sets to x_merged:
  x_sub_merged <- mutate(x_merged, V562=rbind(subject_train, 
    subject_test))
  
  ## Merge y_train and y_test sets to x_sub_merged:
  merged_DF <- mutate(x_sub_merged, V563=rbind(y_train, y_test))
  
  ## Label last two columns to keep consistency within merged_DF
  ## (For some reason mutate doesn't name these cols, why?):
  colnames(merged_DF[,562]) <- "V562"
  colnames(merged_DF[,563]) <- "V563"
  
  #### EXTRACT ONLY MEAN AND STD DEV ##############################
  
  ## Strip off column names from features and convert to char vector:
  x_col_names <- as.character(features[,2])
  
  ## Find only columns with mean or std in their name:
  std_mean_cols <- grep(c("std|mean"), x_col_names)
  
  ## Add in subject and activity columns:
  filter_cols <- c(std_mean_cols, 562, 563)
  
  ## Extract only the mean and standard deviation measurements 
  ## from merged data frame:
  trimmed_DF <- merged_DF[,filter_cols]
  
  #### USE DESCRIPTIVE ACTIVITY NAMES #############################
  
  ## Convert activity variables to factors, using activity_labels:
  trimmed_DF$V563 <- factor(trimmed_DF$V563, 
    levels = activity_labels[,1], labels = activity_labels[,2])
  
  #### LABEL THE DATA SET WITH DESCRIPTIVE VARIABLE NAMES #########
  
  ## Clean column names to remove non-alpha-numeric characters:
  x_col_names <- gsub("\\(|\\)|\\-", "", x_col_names)
  
  ## Expand column names to replace abbreviations:
  x_col_names <- sub("f", "Frequency", x_col_names)
  x_col_names <- sub("t", "Time", x_col_names)
  x_col_names <- sub("mean", "Mean", x_col_names)
  x_col_names <- sub("std", "Std", x_col_names)
  x_col_names <- sub("Acc", "Acceleration", x_col_names)
  
  ## BodyBody column names compacted to Body
  x_col_names <- sub("BodyBody", "Body", x_col_names)
  
  ## Add Column names for Subject and Activity:
  col_names <- c(x_col_names, "Subject", "Activity")
  
  ## Filter out column names that were removed:
  col_names_trimmed <- col_names[filter_cols]
  
  ## Apply column names to trimmed data frame:
  names(trimmed_DF) <- col_names_trimmed
  
  #### CREATE A TIDY DATA SET WITH AVG OF EACH VARIABLE ###########
  
  ## Melt trimmed_DF with subject and activity as id variables:
  melt_DF <- melt(trimmed_DF,id=c("Subject","Activity"))
  
  ## Create our tidy dataset using dcast:
  tidy_DF <- dcast(melt_DF, Subject + Activity ~ variable, mean)
  
  ## Write data set to text file:
  write.table(tidy_DF, file="tidy_DF.txt", row.names = FALSE)
  