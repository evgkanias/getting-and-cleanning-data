CodeBook
========

In this file we describe the variables, the data, and any transformations
or work that we performed to clean up the data 


Feature Selection of the Original Data
--------------------------------------

The features selected for this database come from the accelerometer and
gyroscope 3-axial raw signals tAcc-XYZ and tGyro-XYZ. These time domain
signals (prefix 't' to denote time) were captured at a constant rate of
50 Hz.
Then they were filtered using a median filter and a 3rd order low pass
Butterworth filter with a corner frequency of 20 Hz to remove noise.
Similarly, the acceleration signal was then separated into body and gravity
acceleration signals (tBodyAcc-XYZ and tGravityAcc-XYZ) using another low
pass Butterworth filter with a corner frequency of 0.3 Hz. 

Subsequently, the body linear acceleration and angular velocity were derived
in time to obtain Jerk signals (tBodyAccJerk-XYZ and tBodyGyroJerk-XYZ).
Also the magnitude of these three-dimensional signals were calculated using
the Euclidean norm (tBodyAccMag, tGravityAccMag, tBodyAccJerkMag,
tBodyGyroMag, tBodyGyroJerkMag). 

Finally a Fast Fourier Transform (FFT) was applied to some of these signals
producing fBodyAcc-XYZ, fBodyAccJerk-XYZ, fBodyGyro-XYZ, fBodyAccJerkMag,
fBodyGyroMag, fBodyGyroJerkMag.
(Note the 'f' to indicate frequency domain signals). 

These signals were used to estimate variables of the feature vector for
each pattern: '-XYZ' is used to denote 3-axial signals in the X, Y and Z
directions.

_tBodyAcc-XYZ_<br />
_tGravityAcc-XYZ_<br />
_tBodyAccJerk-XYZ_<br />
_tBodyGyro-XYZ_<br />
_tBodyGyroJerk-XYZ_<br />
_tBodyAccMag_<br />
_tGravityAccMag_<br />
_tBodyAccJerkMag_<br />
_tBodyGyroMag_<br />
_tBodyGyroJerkMag_<br />
_fBodyAcc-XYZ_<br />
_fBodyAccJerk-XYZ_<br />
_fBodyGyro-XYZ_<br />
_fBodyAccMag_<br />
_fBodyAccJerkMag_<br />
_fBodyGyroMag_<br />
_fBodyGyroJerkMag_<br />

The set of variables that were estimated from these signals are: 

_mean()_: Mean value<br />
_std()_: Standard deviation<br />
_mad()_: Median absolute deviation <br />
_max()_: Largest value in array<br />
_min()_: Smallest value in array<br />
_sma()_: Signal magnitude area<br />
_energy()_: Energy measure. Sum of the squares divided by the number of values. <br />
_iqr()_: Interquartile range <br />
_entropy()_: Signal entropy<br />
_arCoeff()_: Autorregresion coefficients with Burg order equal to 4<br />
_correlation()_: correlation coefficient between two signals<br />
_maxInds()_: index of the frequency component with largest magnitude<br />
_meanFreq()_: Weighted average of the frequency components to obtain a mean frequency<br />
_skewness()_: skewness of the frequency domain signal <br />
_kurtosis()_: kurtosis of the frequency domain signal <br />
_bandsEnergy()_: Energy of a frequency interval within the 64 bins of the FFT of each window.<br />
_angle()_: Angle between to vectors.<br />

Additional vectors obtained by averaging the signals in a signal window sample. These are used on the angle() variable:

_gravityMean_<br />
_tBodyAccMean_<br />
_tBodyAccJerkMean_<br />
_tBodyGyroMean_<br />
_tBodyGyroJerkMean_<br />

The complete list of variables of each feature vector is available in 'features.txt'


Transformations from the Original Data
--------------------------------------

Data had the following tranformation to be in the finel format:

1. Merged the training and testing data using the _rbind_ R function to
create one dataset that contains all the data.
2. Put feature names to the measures of the dataset.
3. Replaced the numbers from the prediction vector with their labels.
4. Extracted only the measurements on the mean and standard deviation for each
measurement using the _grep_ R function.
5. Appended that data with the subjects and the predictions using the _cbind_
R function to create one dataset that contains all the information needed.
6. Creates a second, independent tidy data set with the average of each variable
for each activity and each subject melting the data using the _melt_ R function 
from the _reshape2_ R package and then tidying the data using the _dcast_ R
function from the _reshape2_ R package.


Feature Selection of the Tidied Data
------------------------------------

The tidied data features is a subset of the original. It has only the variables
that shows the mean (_mean()_) and the standard deviation (_std()_). The final
tidy dataset has 68 columns (66 columns for the mean and std features, 1 for the
subject and 1 for the activity labels) and 180 rows (6 activities x 30 subjects).

The 68 features are the following:

_activity.Labels_<br />
_subject_<br />
_tBodyAcc-mean()-X_<br />
_tBodyAcc-mean()-Y_<br />
_tBodyAcc-mean()-Z_<br />
_tBodyAcc-std()-X_<br />
_tBodyAcc-std()-Y_<br />
_tBodyAcc-std()-Z_<br />
_tGravityAcc-mean()-X_<br />
_tGravityAcc-mean()-Y_<br />
_tGravityAcc-mean()-Z_<br />
_tGravityAcc-std()-X_<br />
_tGravityAcc-std()-Y_<br />
_tGravityAcc-std()-Z_<br />
_tBodyAccJerk-mean()-X_<br />
_tBodyAccJerk-mean()-Y_<br />
_tBodyAccJerk-mean()-Z_<br />
_tBodyAccJerk-std()-X_<br />
_tBodyAccJerk-std()-Y_<br />
_tBodyAccJerk-std()-Z_<br />
_tBodyGyro-mean()-X_<br />
_tBodyGyro-mean()-Y_<br />
_tBodyGyro-mean()-Z_<br />
_tBodyGyro-std()-X_<br />
_tBodyGyro-std()-Y_<br />
_tBodyGyro-std()-Z_<br />
_tBodyGyroJerk-mean()-X_<br />
_tBodyGyroJerk-mean()-Y_<br />
_tBodyGyroJerk-mean()-Z_<br />
_tBodyGyroJerk-std()-X_<br />
_tBodyGyroJerk-std()-Y_<br />
_tBodyGyroJerk-std()-Z_<br />
_tBodyAccMag-mean()_<br />
_tBodyAccMag-std()_<br />
_tGravityAccMag-mean()_<br />
_tGravityAccMag-std()_<br />
_tBodyAccJerkMag-mean()_<br />
_tBodyAccJerkMag-std()_<br />
_tBodyGyroMag-mean()_<br />
_tBodyGyroMag-std()_<br />
_tBodyGyroJerkMag-mean()_<br />
_tBodyGyroJerkMag-std()_<br />
_fBodyAcc-mean()-X_<br />
_fBodyAcc-mean()-Y_<br />
_fBodyAcc-mean()-Z_<br />
_fBodyAcc-std()-X_<br />
_fBodyAcc-std()-Y_<br />
_fBodyAcc-std()-Z_<br />
_fBodyAccJerk-mean()-X_<br />
_fBodyAccJerk-mean()-Y_<br />
_fBodyAccJerk-mean()-Z_<br />
_fBodyAccJerk-std()-X_<br />
_fBodyAccJerk-std()-Y_<br />
_fBodyAccJerk-std()-Z_<br />
_fBodyGyro-mean()-X_<br />
_fBodyGyro-mean()-Y_<br />
_fBodyGyro-mean()-Z_<br />
_fBodyGyro-std()-X_<br />
_fBodyGyro-std()-Y_<br />
_fBodyGyro-std()-Z_<br />
_fBodyAccMag-mean()_<br />
_fBodyAccMag-std()_<br />
_fBodyBodyAccJerkMag-mean()_<br />
_fBodyBodyAccJerkMag-std()_<br />
_fBodyBodyGyroMag-mean()_<br />
_fBodyBodyGyroMag-std()_<br />
_fBodyBodyGyroJerkMag-mean()_<br />
_fBodyBodyGyroJerkMag-std()_<br />

All these features are explained in a previous section except from
the _activity.Labels_ and the _subject_. The _activity.Labels_
represents the activities that are the predictions (_y-train_ and 
_y-test_) and the _subject_ represents the subjects (_subject-train_
and _subject-test_). These features are saved in the apropreate
files in the original dataset and we append them to our tidy data.
