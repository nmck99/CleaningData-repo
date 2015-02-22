# CleaningData-repo
For Getting and Cleaning Data course

Data cleaned and data from selected variables extracted.
Original dataset details as follows
Based on Human Activity Recognition Using Smartphones Dataset.

The experiments were carried out with a group of 30 volunteers within an age bracket of 19-48 years. Each person performed six activities (WALKING, WALKING_UPSTAIRS, WALKING_DOWNSTAIRS, SITTING, STANDING, LAYING) wearing a smartphone (Samsung Galaxy S II) on the waist. Using its embedded accelerometer and gyroscope, investigators captured 3-axial linear acceleration and 3-axial angular velocity at a constant rate of 50Hz. The experiments have been video-recorded to label the data manually. The obtained dataset has been randomly partitioned into two sets, where 70% of the volunteers was selected for generating the training data and 30% the test data. 

Each record provided data on:
- Triaxial acceleration from the accelerometer (total acceleration) and the estimated body acceleration.
- Triaxial Angular velocity from the gyroscope. 
- A 561-feature vector with time and frequency domain variables. 
- Its activity label. 
- An identifier of the subject who carried out the experiment.

Data on mean() and std() extracted from training and test datasets. The two sets of data then merged.
Columns on subject and activity included.
Outcome variables then grouped by activity then by subject.

R code in run_analysis.R can be run as a whole using source().
Expanations on  pupose of lines of code given following ###tags in run_analysis.R.

Code book provides details of variables analysed.
