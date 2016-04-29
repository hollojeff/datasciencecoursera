This codebook describes the transformations performed to the data.

The data can be retrieved here:

https://d396qusza40orc.cloudfront.net/getdata%2Fprojectfiles%2FUCI%20HAR%20Dataset.zip

A summary can be found here:

http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones

Within the data set a readme containing more detail on the data is available.


The test and training data is loaded in as settest, labeltest, subjecttest and settrain, labeltrain and subjecttrain respectively. The corresponding data sets are then merged into setdata, labeldata and subject data using rbind.

The features data contains the names of the data found in the training and test sets, which are applied to the data. The mean and standard deviation columns are then extracted using regex. The activity data is then loaded in and applied to the label data.

All the data is then merged together using cbind.

Using plyr, the average for each subject and activity type is collated, using colMeans to perform this. The resulting dataset is then exported out as a textfile.

 
