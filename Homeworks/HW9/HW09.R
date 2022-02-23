# ES218 - Exploratory Data Analysis Prof. Gimond - HW09
# Matthew Bass
# 02/20/2022
# 
# Exploring Colby Registrar Dataset

library(dplyr)
library(tidyr)
library(stringr)
library(lubridate)

# Read data
dat <- read.csv("SP2022.csv")


# Complete all tasks in a single series of piping operations
# grouping the class]ses by days and get the count of the number of classes
# in each day
courses_by_day <- dat %>% 
  mutate(M = str_detect(Days, "M"),
         T = str_detect(Days, "T"),
         W = str_detect(Days, "W"),
         R = str_detect(Days, "R"),
         F = str_detect(Days, "F")) %>% 
  
  pivot_longer(cols=c(M,T,W,R,F), names_to = "Day", values_to = "On_Day") %>% 
  
  mutate(Day = factor(x = Day, levels = c("M", "T", "W", "R", "F"))) %>% 
  
  group_by(Day) %>%
  summarise(Sum = sum(On_Day))



saveRDS(courses_by_day, "courses_by_day.rds")



  


