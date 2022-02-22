# ES218 - Exploratory Data Analysis Prof. Gimond - HW07
# Matthew Bass
# 02/15/2022
# 
#  Setting up data for lab 3
library(dplyr)
library(lubridate)
library(stringr)


# Loading in data
dat <- read.csv("SP2022.csv")


# Complete all tasks in a single series of piping operations
dat1 <- dat %>% 
  mutate(M = str_detect(Days, "M"),
         T = str_detect(Days, "T"),
         W = str_detect(Days, "W"),
         R = str_detect(Days, "R"),
         F = str_detect(Days, "F"),
         Overenrolled = case_when(Reg > Max ~ "O",
                                  Reg == Max ~ "C",
                                  Reg < Max ~ "U",
                                  is.na(Reg) | is.na(Max) ~ NA_character_),
         stime = str_split_fixed(Times, "-",2)[ ,1],
         etime = str_split_fixed(Times, "-",2)[ ,2],
         sdate = ymd_hm(paste("2018/1/1", stime)),
         edate = ymd_hm(paste("2018/1/1", etime)),
         Duration = (edate - sdate) /dminutes())



