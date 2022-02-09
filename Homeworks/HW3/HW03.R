# ES218 Spring 2022 - Exploratory Data Analysis Prof. Gimond - HW03
# Matthew Bass
# 02/07/2022

# Importing the necessary libraries
library(lubridate) # Library for working with date/time data

# The following line reads the data file directly from the website
dat <- read.table("http://mgimond.github.io/ES218/Data/buoy_44005_2012.dat",
                  header=TRUE)

# Adding a date column to the dataframe that will 
# be of type POSIXct (a kind of date object) that will 
# consist of the Year, Month, Day, Hour, and Minute of the 
# buoy observation.
dat$Date <- ymd_hm(paste(dat$YY,"-",dat$MM,"-",dat$DD,"-",dat$hh,"-",dat$mm))


# Saving the buoy data with the Date column to a new R object
saveRDS(dat,"bouy.rds")
