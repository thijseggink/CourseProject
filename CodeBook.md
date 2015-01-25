# Code Book
###### This file explains the variables used in the tidy data set of the run_Analysis.R script.

The dataset consists of 180 observations over 51 variables. 

Below is an explanation of each of the variables in the dataset

*Subject*

30 subjects participated in the research. Hence the subject variable is the number for the subject ranging from 1 to 30.

*Activity*

6 Activities were measured in the data set. This variable presents the descriptive names attached to the Activity Number Variable. The six activities are:
1 - Walking
2 - Walking_Upstairs
3 - Walking_Downstairs
4 - Sitting
5 - Standing
6 - Laying

*Activity Number*

6 Activities were measured in the data set. This variable captures the activity ranging from 1 to 6, where the following applies:  
1 = Walking
2 = Walking_Upstairs
3 = Walking_Downstairs
4 = Sitting
5 = Standing
6 = Laying

*Measures*
48 variables/measures are included in the tidy data. Although each of these variables in unique, they can be split up into six dimensions. The following variable name is used as an example: **Time Domain - Mean of Body Gyroscope Jerk - Direction X**

**Time Domain** - Mean of Body Gyroscope Jerk - Direction X
*Domain*
The domain can be either 'Time' or 'Frequency' Domain

Time Domain - **Mean** of Body Gyroscope Jerk - Direction X
*Measure*
The measure can be either 'Mean' or 'Standard Deviation'

Time Domain - Mean of **Body** Gyroscope Jerk - Direction X
*Body - Gravity*
Either the 'Body' or 'Gravity' is measured in this part of the variable

Time Domain - Mean of Body **Gyroscope** Jerk - Direction X
*Acc/Gyro*
This can be either 'Acceleration' or 'Gyroscope'

Time Domain - Mean of Body Gyroscope **Jerk** - Direction X
*Jerk*
'Jerk' or Nothing

Time Domain - Mean of Body Gyroscope Jerk - **Direction X**
*Direction*
The direction can be one out of three: 'X' , 'Y' or 'Z'
