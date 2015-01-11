## Assignment folder

This folder contains the R scripts and png figures corresponding to Course Project 1 of the *Exploratory Data Analysis Course*. The objective has been to follow the requirements and to reproduce the reference figures as close as 
possible. Where conflict exists, written requirements prevail. Aspects matched:
* Plotted data (of course)
* Title and Labels
* Colors
* Image Size: 480x480
* Background transparent
* Locale for weekdays

In order to match as close as possible, I have plotted directly to png. I have not used the procedure of plotting first to sceeen and then copy to png, because the copy operation is not as accurate as plotting directly to png.

Other aspects may not be "exactly" equal:
* Margins
* Font sizes
* Image resolution (which is not specified in the assignment and for which I have used the png() default)

All the R scripts follow the same sequence of operations:
* Read the csv file (the whole file, no attempt has been made to optimize the speed of this part)
* Select the required data
* Plot the data to png file