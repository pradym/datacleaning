==================================================================
Getting and Cleaning Data Course Project - Nov 2014 (Prady Misra)

This "study" (course project) uses the Human Activity Recognition Using Smartphones Dataset Version 1.0 and 
creates a new, independent tidy data set with the average of each variable for each activity and each subject.

==================================================================
The original Study was conducted by the folllowing:

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.
Smartlab - Non Linear Complex Systems Laboratory
DITEN - Università degli Studi di Genova.
Via Opera Pia 11A, I-16145, Genoa, Italy.
activityrecognition@smartlab.ws
www.smartlab.ws
==================================================================

The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used. From each window, a vector of features was obtained by calculating variables from the time and frequency domain. See 'features_info.txt' for more details. 

For our study (course project) the following actions were perfromed:

1. Training and the Test sets were merged to create one data set.
2. The measurements on the mean and standard deviation for each measurement were extracted (see my assumptions below). 
3. Descriptive activity names were assigned to the activities in the data set.
4. Assorted varaibles in the data set were appropriately labeled with descriptive variable names. 
5. From the data set in step 4 a second, independent tidy data set was created with the average of each variable for each activity and each subject.

I have made assumptions about which column to include. I can think of tens of possibilities but do not have the requisite domain knoowledge to know which are more appriopriate than others. Based on my understanding of the instructions I included the columns that contain "mean" and "std" in the original varaible names except those with "meanFreq" in the name. I have included a codebook that describes these 73 variables (along with the variables in original data set).

Here is the conceptual approach to create the tidy data set required in Step 5. Once the dataset is prepared (steps 1 thru 4) we subset a table for each subject to get a table that has all the activities (designated by labels e.g. "WALKING") and corresponding measurement for all the variables (columns e.g. tBodyAcc-mean()-X) chosen in step 2). In other words for every subject I have 6 actvities and for each activity there are multiple measurements. Since each activitiy is carried out multiple times there are multiple measurements for each variable. Now for each "block of activity and measurements" i.e. 1 activity and multiple measurements we calculate the mean of values in each column resulting in a row like the following: 

subject, activity, av-m1, av-m2, av-m3, .........av-mn where n is the number of measurement variables (columns chosen in step 2)

For each subject there will be 6 of these, one per activity and for all 30 subjects there will be a total of 180. If for example we chose 40 columns (in Step 2)  table would be 180 x 42 (includes subject and activity columns). We can then convert it into a tidy table in the desired format.

The file created for submission is named "pradymtbl.txt" and is created in the same directory where the run_analysis.R is run from.

NOTES:

(1) The approach above isn't meant to describe the code in "run_analysis.R", the comments in the code describe that more accurately.
(2) I don't undersatnd the "science" here so have hard time assessing the usefulness and meaningfulness of data produced, 
 

