# ES218 - Exploratory Data Analysis Prof. Gimond - HW09
# Matthew Bass
# 02/20/2022
# 
# Exploring Colby Registrar Dataset

library(dplyr)
library(stringr)
library(lubridate)

# Read data
dat <- read.csv(paste("https://raw.githubusercontent.com/colby-es218-2022/",
                      "hw09-mattjax16/1eac26b1a4542894c7f5d30fa63b11506c12",
                      "a9ea/SP2022.csv?token=GHSAT0AAAAAABRXHR3X6TMW2RRYC7",
                      "KSZVAGYQVMQRQ",
                      sep = ""))


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
  


