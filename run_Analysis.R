trainlabels <- read.table("./UCI HAR Dataset/train/y_train.txt")
testlabels <- read.table("./UCI HAR Dataset/test/y_test.txt")
testset <- read.table("./UCI HAR Dataset/test/X_test.txt")
trainset <- read.table("./UCI HAR Dataset/train/X_train.txt")
activitylabels <- read.table("./UCI HAR Dataset/activity_labels.txt")
features <- read.table("./UCI HAR Dataset/features.txt")
subjecttrain <- read.table("./UCI HAR Dataset/train/subject_train.txt")
subjecttest <- read.table("./UCI HAR Dataset/test/subject_test.txt")

mergeddata <- cbind(cbind(rbind(subjecttrain,subjecttest),rbind(trainlabels, testlabels)),rbind(trainset, testset))

listnames <- as.character(features[,2])
    make.names(listnames, unique = TRUE)
    colnames(mergeddata) <- c("Subject", "ActivityNumber", listnames)


meandata <- mergeddata[ , grepl( "mean()-", names( mergeddata ), fixed = TRUE ) ]
stddata <- mergeddata[ , grepl( "std()-", names( mergeddata ), fixed = TRUE ) ]
subjectactivity <- cbind(rbind(subjecttrain,subjecttest),rbind(trainlabels, testlabels))

meanstdonly <- cbind(subjectactivity,cbind(meandata, stddata))
names(meanstdonly) <- c("Subject", "ActivityNumber", names(cbind(meandata, stddata)))

finaldata <- merge(meanstdonly , activitylabels, by.x = "ActivityNumber", by.y = "V1")
finaldata <- finaldata[,c(2,1,51,3:50)]

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
                          ,"Frequency Domain - Standard Deviation of Domain Body Acceleration - Direction X"       
                          ,"Frequency Domain - Standard Deviation of Domain Body Acceleration - Direction Y"       
                          ,"Frequency Domain - Standard Deviation of Domain Body Acceleration - Direction Z"      
                          ,"Frequency Domain - Standard Deviation of Domain Body Acceleration Jerk - Direction X"   
                          ,"Frequency Domain - Standard Deviation of Domain Body Acceleration Jerk - Direction Y"   
                          ,"Frequency Domain - Standard Deviation of Domain Body Acceleration Jerk - Direction Z"   
                          ,"Frequency Domain - Standard Deviation of Domain Body Gyroscope - Direction X"     
                          ,"Frequency Domain - Standard Deviation of Domain Body Gyroscope - Direction Y"      
                          ,"Frequency Domain - Standard Deviation of Domain Body Gyroscope - Direction Z")