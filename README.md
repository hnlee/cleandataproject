### Course project for Getting and Cleaning Data on Coursera

This repository contains:

* run_analysis.R - an R script to process the data sets
  and output two "tidy" data tables as tab-delimited text files
* samsung-alldata-tidy.txt - "tidy" data table containing all 
  measurements on the mean and standard deviation
* samsung-meandata-tidy.txt - "tidy" data table containing
  the mean of measurements for each subject in each activity
* CodeBook.md - documentation describing the data, the variables,
  and data processing steps

The R script performs the following steps:

* Downloads the data into the working directory
* Records the date of download in the variable downloaddate
* Unzips the data set
* Loads data from the training and test sets and labels the columns
  by name of measurement
* Filters for only measurements on mean and standard deviation
* Replaces numeric code for activities with descriptive names
* Adds subject data and type of data set (training vs. test) as columns
* Outputs "tidy" data table as tab-delimited text file
* Calculates mean of measurements for each subject in each activity as 
  second data table and outputs as tab-delimited text file
