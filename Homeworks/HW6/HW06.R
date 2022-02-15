# ES218 - Exploratory Data Analysis Prof. Gimond - HW06
# Matthew Bass
# 02/15/2022
# 
# Using dplyr functions and a single series of piping operations to 
# subset the data for Boston flights in 2014


library(dplyr)
library(lubridate)


# Reading in the flight data
dat <- readRDS(gzcon(url("https://mgimond.github.io/ES218/Data/BOS_2014.rds")))


# Sub-setting the data
dat.final <- dat %>%
  
  # Getting only AA flights
  filter(CARRIER %in% c("AA")) %>% 
  
  # making date and weekday column
  mutate(date = ymd(paste(YEAR, MONTH, DAY_OF_MONTH)),
         weekday = wday(date,label =TRUE)) %>% 
     
  
  # Getting only Monday flights (fist making fay_of_week var)
  filter(weekday %in% c("Mon")) %>%
  
  # Getting rows with cancellation codes of A or B
  filter(CANCELLATION_CODE %in% c("A", "B")) %>%
  
  # Getting only the date weekday and CANCELLATION_CODE cols 
  select(date,weekday,CANCELLATION_CODE) %>%

  # Sorting the data by cancellation code
  arrange(CANCELLATION_CODE)



# Saving sub-setted data to data diretory
saveRDS(dat.final, "Data/dat.final.rds")


  
         