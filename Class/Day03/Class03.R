# Code from Class 3 of ES218
# 02/07/2022

# Importing nessicasy packages
library(ggplot2)
library(lubridate)


dat <- read.csv("CO2.csv", na.string = -99.99)

str(dat)

summary(dat)

# Plot the data
ggplot(dat, aes(x = Year, y = Average)) + geom_line()

#  or
ggplot(dat) +  aes(x = Year, y = Average) + geom_line()


# Create a date column for the dataframe by piecing together the year and 
# month column

dat$Date = lubridate::ymd(paste(dat$Year,"-",dat$Month,"-15",sep = ""))
dat$weekday <- wday(dat$Date, abbr = TRUE, label = TRUE)
# Plotting again with proper data objects
ggplot(dat) +  aes(x = Date, y = Average) + geom_line()


# Saving as an R data file format
saveRDS(dat, "output_co2.RDS")


#Loading rds file
dat2 <- readRDS("output_co2.RDS")


