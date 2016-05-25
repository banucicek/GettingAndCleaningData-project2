# GettingAndCleaningData-project2
JHU Data Science Specialization course project



This repo contains an R script for tidying and aggregating the UCI HAR Dataset, called run_analysis.R.

The output of the run_analysis.R consists of two dataset as txt files. 
First one is tidyUCIHARdataset.txt where variables and activities are appropriately named and only the variables that gives mean() and std() are taken from the initial dataset. 
Second dataset aggregates the first one by taking the average of each variable for each activity and each subject.

Codebook.Rmd contains information on the variables of tidyUCIHARdataset.txt dataset.
