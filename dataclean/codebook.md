The goal of this data clean exercise was to make the [human activity recognition dataset](https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip) in a tidy foramt according to following requirements (more information of the dataset can be found from [uci website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones)):

+ Merges the training and the test sets to create one data set.
+ Extracts only the measurements on the mean and standard deviation for each measurement. 
+ Uses descriptive activity names to name the activities in the data set
+ Appropriately labels the data set with descriptive activity names. 
+ Creates a second, independent tidy data set with the average of each variable for each activity and each subject. 

# Data Clear Procedure

## Read in the train data and test data

First we read in the train data and the test data from `X_train.txt` and `X_test.txt`, then we combine these two datasets in one dataset.

## Activity Name Mapping

Each observation's corresponding activity was extract from the the `y_train.txt` and `y_test.txt`, after read in the activity number have need to map the activity from number to the activity name according to the mapping file `activity_labels.txt`. Then we can combine the train activy and test activity together.

## Extract the corresponding subject id

The next step is to get the corresponding subject for each observation for train and test data. We read it from `subject_train.txt` and `subject_test.txt` first then combine it together.

## Get the final data set

We combine the `activity`,`subject` and the corresponding observation together as the final dataset

## Give descriptive names to each variable in the final dataset

First variable names were extracted from `feature.txt`, then we give all the columns a name accordingly.

## Filter only mean and std measures

All measures which measure mean and standard deviation will contain either `mean()` or `std()`, we use the regular pattern to get there measures only. To make the column names tidy, we also remove `,`,`(`,`)` from the names. After all this was done we can get the final tidy data.

# Feature Description

The features selected for this database come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain jerk signals (tbodyaccjerk-xyz and tbodygyrojerkxyz). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tbodyaccmag, tgravityaccmag, tbodyaccjerkmag, tbodygyromag, tbodygyrojerkmag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fbodyaccxyz, fbodyaccjerkxyz, fbodygyroxyz, fbodyaccjerkmag, fbodygyromag, fbodygyrojerkmag. (Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for each pattern:  
'xyz' is used to denote 3-axial signals in the X, Y and Z directions.

tbodyacc-xyz
tgravityacc-xyz
tbodyaccjerk-xyz
tbodygyro-xyz
tbodygyrojerk-xyz
tbodyaccmag
tgravityaccmag
tbodyaccjerkmag
tbodygyromag
tbodygyrojerkmag
fbodyacc-xyz
fbodyaccjerk-xyz
fbodygyro-xyz
fbodyaccmag
fbodyaccjerkmag
fbodygyromag
fbodygyrojerkmag

The set of variables that were estimated from these signals are: 

mean(): Mean value
std(): Standard deviation
mad(): Median absolute deviation 
max(): Largest value in array
min(): Smallest value in array
sma(): Signal magnitude area
energy(): Energy measure. Sum of the squares divided by the number of values. 
iqr(): Interquartile range 
entropy(): Signal entropy
arcoeff(): Autorregresion coefficients with Burg order equal to 4
correlation(): correlation coefficient between two signals
maxinds(): index of the frequency component with largest magnitude
meanfreq(): Weighted average of the frequency components to obtain a mean frequency
skewness(): skewness of the frequency domain signal 
kurtosis(): kurtosis of the frequency domain signal 
bandsenergy(): Energy of a frequency interval within the 64 bins of the FFT of each window.
angle(): Angle between to vectors.
