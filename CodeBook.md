# CodeBook for tidy_DF.txt

## Original data:
The original data set was acquired from:
[https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip)
From the original data set, the following files were read:
* features.txt
* activity_labels.txt
* subject_test.txt
* X_test.txt
* y_test.txt 
* subject_train.txt
* X_train.txt
* y_train.txt
The original variables measured are described in the features_info.txt document packaged with the original data set.

## Merge training and test sets
Measurements from X_test.txt and X_train.txt were combined by rows to create an x_sub_merged data frame.  subject_test.txt and subject_train.txt were combined by rows and added as new columns to the end of the x_sub_merged data frame to create merged_DF data frame, with these two columns being named to keep consistent with the arbitrary column names assigned by R to the other elements of the data frame.

## Extracting only mean and standard deviation measurements
The second column of features.txt was used to label column names associated with measured variables.

Only the original variable containing the words "mean" or "std" were kept, per the project specification. 

## Using descriptive activity names
Activity variables were converted to descriptive values using those specified in the activity_labels.txt.

## Labeling the data set with descriptive variable names
In order to create a tidy data set with proper variable names, the original names were modified to:
* Remove non-alpha-numeric characters
* Expand abbreviations "f," "t," and "Acc" to "Frequency," "Time," and "Acceleration" respectively.
* For improved readability, "mean" and "std" were renamed "Mean" and "Std" respectively.
* To correct for an apparent mislabeled variable name in the original data set "BodyBody" was relabeled to "Body"
* Subject and Activity columns were labeled appropriately.
* Only the variable names corresponding to columns for "mean" and "std" were applied.

## Creating a tidy data set with the average of each variable
A tidy data set was created using the average of all measurements for each possible combination of subject and activity.

The tidy data set contains the following variables, listed by column number:
 [1] "Subject"                                 
 [2] "Activity"                                
 [3] "TimeBodyAccelerationMeanX"               
 [4] "TimeBodyAccelerationMeanY"               
 [5] "TimeBodyAccelerationMeanZ"               
 [6] "TimeBodyAccelerationStdX"                
 [7] "TimeBodyAccelerationStdY"                
 [8] "TimeBodyAccelerationStdZ"                
 [9] "TimeGravityAccelerationMeanX"            
[10] "TimeGravityAccelerationMeanY"            
[11] "TimeGravityAccelerationMeanZ"            
[12] "TimeGravityAccelerationStdX"             
[13] "TimeGravityAccelerationStdY"             
[14] "TimeGravityAccelerationStdZ"             
[15] "TimeBodyAccelerationJerkMeanX"           
[16] "TimeBodyAccelerationJerkMeanY"           
[17] "TimeBodyAccelerationJerkMeanZ"           
[18] "TimeBodyAccelerationJerkStdX"            
[19] "TimeBodyAccelerationJerkStdY"            
[20] "TimeBodyAccelerationJerkStdZ"            
[21] "TimeBodyGyroMeanX"                       
[22] "TimeBodyGyroMeanY"                       
[23] "TimeBodyGyroMeanZ"                       
[24] "TimeBodyGyroStdX"                        
[25] "TimeBodyGyroStdY"                        
[26] "TimeBodyGyroStdZ"                        
[27] "TimeBodyGyroJerkMeanX"                   
[28] "TimeBodyGyroJerkMeanY"                   
[29] "TimeBodyGyroJerkMeanZ"                   
[30] "TimeBodyGyroJerkStdX"                    
[31] "TimeBodyGyroJerkStdY"                    
[32] "TimeBodyGyroJerkStdZ"                    
[33] "TimeBodyAccelerationMagMean"             
[34] "TimeBodyAccelerationMagStd"              
[35] "TimeGravityAccelerationMagMean"          
[36] "TimeGravityAccelerationMagStd"           
[37] "TimeBodyAccelerationJerkMagMean"         
[38] "TimeBodyAccelerationJerkMagStd"          
[39] "TimeBodyGyroMagMean"                     
[40] "TimeBodyGyroMagStd"                      
[41] "TimeBodyGyroJerkMagMean"                 
[42] "TimeBodyGyroJerkMagStd"                  
[43] "FrequencyBodyAccelerationMeanX"          
[44] "FrequencyBodyAccelerationMeanY"          
[45] "FrequencyBodyAccelerationMeanZ"          
[46] "FrequencyBodyAccelerationsTimedX"        
[47] "FrequencyBodyAccelerationsTimedY"        
[48] "FrequencyBodyAccelerationsTimedZ"        
[49] "FrequencyBodyAccelerationMeanFreqX"      
[50] "FrequencyBodyAccelerationMeanFreqY"      
[51] "FrequencyBodyAccelerationMeanFreqZ"      
[52] "FrequencyBodyAccelerationJerkMeanX"      
[53] "FrequencyBodyAccelerationJerkMeanY"      
[54] "FrequencyBodyAccelerationJerkMeanZ"      
[55] "FrequencyBodyAccelerationJerksTimedX"    
[56] "FrequencyBodyAccelerationJerksTimedY"    
[57] "FrequencyBodyAccelerationJerksTimedZ"    
[58] "FrequencyBodyAccelerationJerkMeanFreqX"  
[59] "FrequencyBodyAccelerationJerkMeanFreqY"  
[60] "FrequencyBodyAccelerationJerkMeanFreqZ"  
[61] "FrequencyBodyGyroMeanX"                  
[62] "FrequencyBodyGyroMeanY"                  
[63] "FrequencyBodyGyroMeanZ"                  
[64] "FrequencyBodyGyrosTimedX"                
[65] "FrequencyBodyGyrosTimedY"                
[66] "FrequencyBodyGyrosTimedZ"                
[67] "FrequencyBodyGyroMeanFreqX"              
[68] "FrequencyBodyGyroMeanFreqY"              
[69] "FrequencyBodyGyroMeanFreqZ"              
[70] "FrequencyBodyAccelerationMagMean"        
[71] "FrequencyBodyAccelerationMagsTimed"      
[72] "FrequencyBodyAccelerationMagMeanFreq"    
[73] "FrequencyBodyAccelerationJerkMagMean"    
[74] "FrequencyBodyAccelerationJerkMagsTimed"  
[75] "FrequencyBodyAccelerationJerkMagMeanFreq"
[76] "FrequencyBodyGyroMagMean"                
[77] "FrequencyBodyGyroMagsTimed"              
[78] "FrequencyBodyGyroMagMeanFreq"            
[79] "FrequencyBodyGyroJerkMagMean"            
[80] "FrequencyBodyGyroJerkMagsTimed"          
[81] "FrequencyBodyGyroJerkMagMeanFreq" 

These variables represent the mean value of all instances of each possible combination of subject and activity from the original data set containing the key words "mean" or "std", with expanded and cleaned variable names.