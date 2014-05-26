## Study design ##

From the README.txt file included with the data set:

> The experiments have been carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, we captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

> The sensor signals (accelerometer and gyroscope) were pre-processed by applying noise filters and then sampled in fixed-width sliding windows of 2.56 sec and 50% overlap (128 readings/window). The sensor acceleration signal, which has gravitational and body motion components, was separated using a Butterworth low-pass filter into body acceleration and gravity. The gravitational force is assumed to have only low frequency components, therefore a filter with 0.3 Hz cutoff frequency was used.

## Data processing ##

From the features_info.txt file included with the data set:

> These time domain signals were captured at a constant rate of 50 Hz. Then they were filtered using a median filter and a 3rd order low pass Butterworth filter with a corner frequency of 20 Hz to remove noise. Similarly, the acceleration signal was then separated into body and gravity acceleration signals using another low pass Butterworth filter with a corner frequency of 0.3 Hz. 

> Subsequently, the body linear acceleration and angular velocity were derived in time to obtain jerk signals. Also the magnitude of these three-dimensional signals were calculated using the Euclidean norm. 

> Finally a Fast Fourier Transform (FFT) was applied to some of these signals. 

The mean and standard deviation were estimated from these signals.

## Variable names ##

* 'time' prefix indicates time domain signals
* 'freq' prefix indicates frequency domain signals
* 'BodyAcc' indicates body linear acceleration signals from accelerometer
* 'GravityAcc' indicates gravity linear acceleration signals from accelerometer
* 'BodyGyro' indicates body linear acceleration signals from gyroscope
* 'GravityGyro' indicates gravity linear acceleration signals from gyroscope
* 'Jerk' indicates jerk signals derived from linear acceleration and angular velocity
* 'X' indicates signal measurements along X-axis
* 'Y' indicates signal measurements along Y-axis
* 'Z' indicates signal measurements along Z-axis
* 'Mag' indicates magnitude of the tri-axial signal
* 'Mean' indicates mean estimated from signal
* 'StdDev' indicates standard deviation estimated from signal
* 'subject' indicates subject id number
* 'activity' indicates whether measurement was taken during walking,
  walking upstairs, walking downstairs, sitting, standing, laying
* 'dataset' indicates whether the data belonged to training or test data set

