# Matt Bass
# week02.R
# 02/13/22
# 
# This is a script to read in data from Augusta_2019.csv and 
# add a date column to it comprising of the year month and day.

library(lubridate)
library(ggplot2)


# The following line reads in the Augusta the data file
dat <- read.csv("Augusta_2019.csv")


# Replacing missing data stats based on Augusta_2019_README.txt
# temp: Missing values are coded as -999.
dat[dat$temp == -999 , "temp"] <- NA

# wd: Missing values are coded as 999.
dat[dat$wd == 999 , "wd"] <- NA

# ws:  Missing values are coded as 999.
dat[dat$ws == 999 , "ws"] <- NA

# atmos_pres: Missing values are coded as 0.
dat[dat$atmos_pres == 0 , "atmos_pres"] <- NA

# dew_point:  Missing values are coded as -999.
dat[dat$dew_point == -999 , "dew_point"] <- NA


# Creating a date-column for the dataframe: year-month-day
dat$date <- ymd(paste(dat$year, dat$month, dat$day))


