Feature Selection & Data Dictionary for Course Project
=================================

The features selected for this database (Human Activity Recognition Using Smartphones Dataset Version 1.0 ) come from the accelerometer and gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain signals (prefix 't' to denote time) were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ). Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag, tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag, fBodyGyroMag, fBodyGyroJerkMag. (Note the 'f' to indicate frequency domain signals). 
These signals were used to estimate variables of the feature vector for each pattern:  '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc-XYZ	
tGravityAcc-XYZ	
tBodyAccJerk-XYZ
tBodyGyro-XYZ	
tBodyGyroJerk-XYZ	
tBodyAccMag
tGravityAccMag	
tBodyAccJerkMag	
tBodyGyroMag
tBodyGyroJerkMag	
fBodyAcc-XYZ	
fBodyAccJerk-XYZ
fBodyGyro-XYZ	
fBodyAccMag		
fBodyAccJerkMag
fBodyGyroMag
fBodyGyroJerkMag

A large set of variables were estimated from these signals e.g. mean, standard deviation, min and max values etc. However for this “study” (Course Project) we focused only on those estimated variables that represented mean and standard deviation for each measurement. These are enumerated below.

tBodyAcc-mean()-XYZ		tBodyAcc-std()-XYZ
tGravityAcc- mean()-XYZ		tGravityAcc-std()-XYZ
tBodyAccJerk- mean()-XYZ		tBodyAccJerk-std ()-XYZ
tBodyGyro- mean()-XYZ		tBodyGyro-std ()-XYZ
tBodyGyroJerk-mean()-XYZ		tBodyGyroJerk-std()-XYZ
tBodyAccMag-mean()		tBodyAccMag-std()
tGravityAccMag-mean()		tGravityAccMag-std()
tBodyAccJerkMag-mean()		tBodyAccJerkMag-std()
tBodyGyroMag-mean()		tBodyGyroMag-std()
tBodyGyroJerkMag-mean()		tBodyGyroJerkMag-std()
fBodyAcc--mean()-XYZ		fBodyAcc-std()-XYZ
fBodyAccJerk--mean()-XYZ		fBodyAccJerk-std()-XYZ
fBodyGyro--mean()-XYZ		fBodyGyro-std()-XYZ
fBodyAccMag-mean()		fBodyAccMag-std()
fBodyAccJerkMag-mean()		fBodyAccJerkMag-std()
fBodyGyroMag-mean()		fBodyGyroMag-std()
fBodyGyroJerkMag-mean()		fBodyGyroJerkMag-std()

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

gravityMean
tBodyAccMean
tBodyAccJerkMean
tBodyGyroMean
tBodyGyroJerkMean

For the original data set the complete list of variables of each feature vector is available in 'features.txt'

Following 73 variables are used in our study (Course Project) which are extracted from the original data set and given unique names since there were several cases of duplicate variables in the original data set. '-XYZ' is used to denote 3-axial signals in the X, Y and Z directions.

tBodyAcc.mean...XYZ                    
tGravityAcc.mean...XYZ              
tBodyAccJerk.mean...XYZ"                
tBodyGyro.mean...XYZ                  
tBodyGyroJerk.mean...XYZ               
tBodyAccMag.mean                  
tGravityAccMag.mean                
tBodyAccJerkMag.mean              
tBodyGyroMag.mean                  
tBodyGyroJerkMag.mean
fBodyAcc.mean...XYZ                   
fBodyAccJerk.mean...XYZ              
fBodyGyro.mean...XYZ                   
fBodyAccMag.mean                
fBodyBodyAccJerkMag.mean
fBodyBodyGyroMag.mean            
fBodyBodyGyroJerkMag.mean
angle.tBodyAccMean.gravity
angle.tBodyAccJerkMean..gravityMean
angle.tBodyGyroMean.gravityMean  
angle.tBodyGyroJerkMean.gravityMean
angle.X.gravityMean             
angle.Y.gravityMean
angle.Z.gravityMean              
tBodyAcc.std...XYZ
tGravityAcc.std...XYZ              
tBodyAccJerk.std...XYZ
tBodyGyro.std...XYZ                
tBodyGyroJerk.std...XYZ
tBodyAccMag.std                   
tGravityAccMag.std              
tBodyAccJerkMag.std           
tBodyGyroMag.std                   
tBodyGyroJerkMag.std            
fBodyAcc.std...XYZ
fBodyAccJerk.std...XYZ                
fBodyGyro.std...XYZ                   
fBodyAccMag.std.               
fBodyBodyAccJerkMag.std            
fBodyBodyGyroMag.std.          
fBodyBodyGyroJerkMag.std.       
