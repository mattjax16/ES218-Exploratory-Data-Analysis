library(dplyr)
library(lubridate)
library(ggplot2)

# Load and prep the data
dat <-readRDS("allen_army_1945_2019.rds")

# Restrict data to the month of April and the years 1970 and 1974
dat1 <- dat %>%
  mutate(year = year(time)) %>% 
  filter(year == 1970 | year == 1974,
         month(time) == 4) %>%
  select(-time) 

ggplot(dat1, aes(x = as.character(year), y = temp)) + 
  geom_jitter(width = 0.2, height = 0) +
  ylab("year")


