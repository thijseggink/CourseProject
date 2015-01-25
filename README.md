# CourseProject
This repository contains the files necessary for Coursera's 'Getting and Cleaning Data' Course Project.

There are three files in this repo. The first one is the README.md which explains what the various scripts in the repo do.
Secondly the 'CodeBook' contains information about the variables that are used in the data set.
Lastly, the script called 'run_Analysis.R' basically runs the analysis for getting and cleaning the data to come up with a tidy data set, as requested in the course project.

The 'run_Analysis.R' script is fairly straight forward, and explanation is included in the script itself to explain what each line of code does. In general the script reads the relevant tables, merges the data together as one dataset, whereafter the variables are given names as provided. 
Subsequently, the data set is extracted for measurements with only the mean and std. 
The following steps are to give the variables clear names and tidy up the data set by only taking the mean of each subject for each activity. 
