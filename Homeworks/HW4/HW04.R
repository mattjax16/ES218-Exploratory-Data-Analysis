# ES218 Spring 2022 - Exploratory Data Analysis Prof. Gimond - HW04
# Matthew Bass
# 02/09/2022


# Clearing the global workspace before running the script
rm(list = ls())

# Importing the necessary libraries
library(lubridate) # Library for working with date/time data

# The following line reads in the Augusta the data file
dat <- read.csv("Augusta_2019.csv", header=TRUE)


# NA stats before replacing missing variables for NA
# summary(dat)



# replacing missing object stats based on variables
# temp: Missing values are coded as -999.
dat[ dat$temp == -999 , "temp"] <- NA

# wd: Missing values are coded as 999.
dat[ dat$wd == 999 , "wd"] <- NA

# ws:  Missing values are coded as 999.
dat[ dat$ws == 999 , "ws"] <- NA

# atmos_pres: Missing values are coded as 0.
dat[ dat$atmos_pres == 0 , "atmos_pres"] <- NA

# dew_point:  Missing values are coded as -999.
dat[ dat$dew_point == -999 , "dew_point"] <- NA

# These values are already coded with NA so dont need to change
# rh:  Missing values are coded as NA.
# ceil_hgt: Missing values are coded as NA.
# visibility:  Missing values are coded as NA.
# aa1_1 - 4: Missing values are coded as NA.

# summary after changing all the variables to NA
# summary(dat)



# Creating a date-column for the df
# be of type POSIXct (a kind of date object) that will 
# consist of the Year, Month, Day, Hour, and Minute of the 
# buoy observation.
dat$date <- ymd_hm(paste(dat$year,"-",dat$month,"-",dat$day," ",dat$timestamp))


# Creating a new data frame with just the temp column, 
# rh column, and the date column 
dat2 <- subset(dat,select = c("temp","rh","date"))



