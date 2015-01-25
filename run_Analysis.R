# This script runs the five steps as proposed in the Course Project of Coursera's 'Getting and Cleaning Data Course

# The following functions read all the relevant txt files from the working directory
# There are two different data sets that have to be merged: the train data and test data
# A separate file contains the labels for each of measures and activities, both for the test and train data
trainlabels <- read.table("./UCI HAR Dataset/train/y_train.txt")
testlabels <- read.table("./UCI HAR Dataset/test/y_test.txt")
testset <- read.table("./UCI HAR Dataset/test/X_test.txt")
trainset <- read.table("./UCI HAR Dataset/train/X_train.txt")
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

# Step 1 of the Course Project: Merge training and test set to create one data set
# 3 actions are taking in the following function: binding the subjects and labels after which the data is linked to it.
mergeddata <- cbind(cbind(rbind(subjecttrain,subjecttest),rbind(trainlabels, testlabels)),rbind(trainset, testset))

# Now that the data tables are merged, the variables are given names as below:
listnames <- as.character(features[,2])
make.names(listnames, unique = TRUE)
colnames(mergeddata) <- c("Subject", "ActivityNumber", listnames)

# Step 2 of the Course Project assignment: Extract only mean and std measures
# The following functions look at the columnnames and extract any name with "mean()-" or "std()-"
# The extraction of the column names are produced in separate tables
meandata <- mergeddata[ , grepl( "mean()-", names( mergeddata ), fixed = TRUE ) ]
stddata <- mergeddata[ , grepl( "std()-", names( mergeddata ), fixed = TRUE ) ]
subjectactivity <- cbind(rbind(subjecttrain,subjecttest),rbind(trainlabels, testlabels))

# Step 2 of the Course Project
# Extracted data tables are merged together, 
meanstdonly <- cbind(subjectactivity,cbind(meandata, stddata))
names(meanstdonly) <- c("Subject", "ActivityNumber", names(cbind(meandata, stddata)))

# Step 3 of the Course Project: Uses descriptive activity names to names the activities in the data set
# Following function merges the descriptive labels with the numbers in the dataset
# Also changes the position of the columns to show the Subject, Activity in the first columns.
finaldata <- merge(meanstdonly , activitylabels, by.x = "ActivityNumber", by.y = "V1")
finaldata <- finaldata[,c(2,1,51,3:50)]

# Step 4 of the Course Project: Appropriately labels the data set with descriptive variable names
# The following labels the variable names of the data set
names(finaldata) <- c("Subject"
                      ,"Activity Number"
                      ,"Activity"
                      ,"Time Domain - Mean of Body Acceleration - Direction X"      
                      ,"Time Domain - Mean of Body Acceleration - Direction Y"     
                      ,"Time Domain - Mean of Body Acceleration - Direction Z"      
                      ,"Time Domain - Mean of Gravity Acceleration -Direction X"   
                      ,"Time Domain - Mean of Gravity Acceleration - Direction Y"   
                      ,"Time Domain - Mean of Gravity Acceleration - Direction Z"  
                      ,"Time Domain - Mean of Body Acceleration Jerk - Direction X"  
                      ,"Time Domain - Mean of Body Acceleration Jerk - Direction Y"  
                      ,"Time Domain - Mean of Body Acceleration Jerk - Direction Z"  
                      ,"Time Domain - Mean of Body Gyroscope - Direction X"    
                      ,"Time Domain - Mean of Body Gyroscope - Direction Y"     
                      ,"Time Domain - Mean of Body Gyroscope - Direction Z"     
                      ,"Time Domain - Mean of Body Gyroscope Jerk - Direction X" 
                      ,"Time Domain - Mean of Body Gyroscope Jerk - Direction Y"
                      ,"Time Domain - Mean of Body Gyroscope Jerk - Direction Z" 
                      ,"Frequency Domain - Mean of Body Acceleration - Direction X"      
                      ,"Frequency Domain - Mean of Body Acceleration - Direction Y"      
                      ,"Frequency Domain - Mean of Body Acceleration - Direction Z"     
                      ,"Frequency Domain - Mean of Body Acceleration Jerk - Direction X"  
                      ,"Frequency Domain - Mean of Body Acceleration Jerk - Direction Y"  
                      ,"Frequency Domain - Mean of Body Acceleration Jerk - Direction Z"  
                      ,"Frequency Domain - Mean of Body Gyroscope - Direction X"    
                      ,"Frequency Domain - Mean of Body Gyroscope - Direction Y"     
                      ,"Frequency Domain - Mean of Body Gyroscope - Direction Z"     
                      ,"Time Domain - Standard Deviation of Body Acceleration - Direction X"       
                      ,"Time Domain - Standard Deviation of Body Acceleration - Direction Y"      
                      ,"Time Domain - Standard Deviation of Body Acceleration - Direction Z"       
                      ,"Time Domain - Standard Deviation of Gravity Acceleration - Direction X"    
                      ,"Time Domain - Standard Deviation of Gravity Acceleration - Direction Y"    
                      ,"Time Domain - Standard Deviation of Gravity Acceleration - Direction Z"   
                      ,"Time Domain - Standard Deviation of Body Acceleration Jerk - Direction X"   
                      ,"Time Domain - Standard Deviation of Body Acceleration Jerk - Direction Y"   
                      ,"Time Domain - Standard Deviation of Body Acceleration Jerk - Direction Z"   
                      ,"Time Domain - Standard Deviation of Body Gyroscope - Direction X"     
                      ,"Time Domain - Standard Deviation of Body Gyroscope - Direction Y"      
                      ,"Time Domain - Standard Deviation of Body Gyroscope - Direction Z"      
                      ,"Time Domain - Standard Deviation of Body GyroscopeJerk - Direction X"  
                      ,"Time Domain - Standard Deviation of Body GyroscopeJerk - Direction Y" 
                      ,"Time Domain - Standard Deviation of Body GyroscopeJerk - Direction Z"  
                      ,"Frequency Domain - Standard Deviation of Body Acceleration - Direction X"       
                      ,"Frequency Domain - Standard Deviation of Body Acceleration - Direction Y"       
                      ,"Frequency Domain - Standard Deviation of Body Acceleration - Direction Z"      
                      ,"Frequency Domain - Standard Deviation of Body Acceleration Jerk - Direction X"   
                      ,"Frequency Domain - Standard Deviation of Body Acceleration Jerk - Direction Y"   
                      ,"Frequency Domain - Standard Deviation of Body Acceleration Jerk - Direction Z"   
                      ,"Frequency Domain - Standard Deviation of Body Gyroscope - Direction X"     
                      ,"Frequency Domain - Standard Deviation of Body Gyroscope - Direction Y"      
                      ,"Frequency Domain - Standard Deviation of Body Gyroscope - Direction Z")

# Step 5 of the course ProjecT: creates a second, independent tidy data set with the average of each variable for each activity and each subject.
# Summarizes the finaldata by Subject and Activity with the mean over all the columns
cleandata <- ddply(finaldata, .(Subject, Activity), numcolwise(mean))
