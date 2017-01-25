# CleanDataW4Project
Coursera project

##This project cleans and tidies the data as described below:

It has 3 files:  
* run_Analysis.R    code for creating the tidydataset.txt  
* README.md         this file that describes the project  
* codebook.txt      original file that described the dataset, updated with this project's changes  
* tidydataset.txt   the dataset created from the original information by the submitted code that performs the operations described below  

First it just reads the features and labels.

Then, for each of the training and test sets, the code:  
1. Reads the X, Y and subject data  
2. Changes the column names, for X acording to features.  
3. Joins the three data.frames in a single named data.frame

It then joins (rbind) the training and testing datasets and, on the whole data set:  
1. Removes the columns with duplicate names to be able to process the next steps without errors.  
2. Selects only the columns x_total,activity,subject, and all the others that contain either mean or std.  
3. Creates a factor on the first column using the labels from the activity_labels.  

The last step is to summarize by the means of activity and subject (grouping first), and exporting the tidydataset.txt
