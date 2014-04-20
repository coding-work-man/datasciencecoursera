# How To Use 

## Prepare the raw data

+ Download the dataset from [https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip ).
+ Extract the dataset to a directory named as `Dataset` , the `Dataset` directory should be under the same directory as `run_analysis.R`

## Data clean
	
	# set the working directory to your directory where run_analysis.R is located
	setwd(your_directory)
	# load the script
	source("run_analysis.R")
	# execute the data clean function
	dataclean()
	# the tidy data will be exported as a txt file under your working directory