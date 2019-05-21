---
title: "CodeBook for Getting and Cleaning Data - Assignment 1"
author: "Kelly Schumann"
date: "5/16/2019"
output: html_document
---

This project creates 2 tidy data sets, the first containing all of the raw columns containing the terms Mean or Standard Deviation which is titled <b>means.std</b>. The second breaks down all of the averages of the variables by the different types of activities being monitored in the study <b>ave.activity</b>;

The data has come from <a href="http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones">Human Activity Recognition Using Smartphones Data Set</a>. This data consists of Tri-axial Accelerometer and Velocity and estimated body acceleration. 

The main routine run_analysis can be broken down into 5 sections described below:
1) Make Columns Headers that are clean and understandable
2) Create a single data set from the 4 files (2 test and 2 training files). <font color="red"><b>(Goals #1 and #4)</b></font>

    A) Each group has 2 data files, the first contain all of the data points
       The second file details the activity preformed creating the data points
    B) Each Group 
        Reading the data file and using rbind combine the Activity file - to complete the test 
        results into a single file
    C) The next step of this section joins the two group (data sets) together using cbind
3) Clean unused interum variables to free memory
4) Create a single Dataset - including variables containing Mean or Standard Dev. <font color="red"><b>(Goal #2)</b></font>
    A) Create a filter using grep
    B) Apply filter creating <b>"means.std"</b> data frame.
5) Link the Activity file to the data sets so we have a more readable dataset not code but activity
    name <font color="red"><b>(Goal #3)</b></font>
6) Create a second dataset with the average of each variable by the activity and subject. <font color="red"><b>(Goal #5)</b></font>
    A) Using Aggreagate create the data frame named <b>"ave.activity"</b>
