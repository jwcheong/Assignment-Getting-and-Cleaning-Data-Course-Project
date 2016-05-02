# Assignment-Getting-and-Cleaning-Data-Course-Project

## Background

This project uses data collected from the accelerometers from the Samsung Galaxy S smartphone, which measured 30 subjects performing 6 different activities. A full description of the research is available at the site where the data was obtained:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Below is the url to download the data for the project:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

## Description of run_analysis.R

"run_analysis.R"" performs the following functions in order: 

1. Download and extracts data files onto local directory
2. Import relevant data sets into R
3. Merges the "test" and "train" data sets into a single working data set
4. Extract only the mean and standard deviation of the various measurements
5. Identify the subject and activity for each observation
6. Create a new data set of the average of each variable for each subject and activity

The script creates a tidy data set titled "summarydata" from the raw data (step 6 above), which can then be exported for further analysis
