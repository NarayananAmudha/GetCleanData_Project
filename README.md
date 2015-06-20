### Introduction

This repository contains the R code and the output for the assignment of the DataScience "Getting and Cleaning Data" course.

The purpose of this project is 
- To demonstrate the collection, work with, and cleaning of this data set
- To prepare Tidy data which may be used for later analysis.

### Data Set
This script works with the Human Activity Recognition Using Smartphones Dataset.
The original dataset and its description can be found from [UCI](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).

### Package
This repository package includes the following
- `CodeBook.md` describes the variables, the data, and the work that has been performed to clean up the data
- `run_analysis.R` which download,clean the data and generate the two new tidy datasets
- `output` folder with two tidy datasets `tidy-meas-extracted.txt` and `tidy-avg-calculated.txt`

### Execution Steps

- Clone this repository
- Set the working directory to the root of the repository
- Execute `run_analysis.R` in R/Rstudio without any parameters  

### Output
This script generates two separate data sets as output and stores the files in the output directory.
- 1.`tidy-meas-extracted.txt` - Extracted mean and std measurement datas from train and test datasets
- 2.`tidy-avg-calculated.txt` - Calculated average of each extracted mean and std measurement datas for each activity and each subject 	