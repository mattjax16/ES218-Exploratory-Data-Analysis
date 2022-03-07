library(dplyr)
library(tidyr)
library(stringr)
library(lubridate)
library(forcats)
library(ggplot2)

# Read data file
dat  <- read.csv("SP2022.csv")
div  <- read.csv("http://mgimond.github.io/ES218/Data/Divisions.csv")

# Create a master table 
# Compute start/end times, gather days of the week and join to div
dat1 <- dat %>% 
  mutate( Mon   = str_detect(Days, "M"),
          Tue   = str_detect(Days, "T"), 
          Wed   = str_detect(Days, "W"), 
          Th    = str_detect(Days, "R"), 
          Fr    = str_detect(Days, "F"),
          Start = ymd_hm(paste("2021/01/01 ", StartTime)),
          Start = hour(Start) + minute(Start)/60,
          End   = ymd_hm(paste("2021/01/01 ", EndTime )),
          End   = hour(End) + minute(End)/60 ,
          DeptProg = str_sub(Course, 1, 2)) %>% 
  pivot_longer(names_to = "Day", values_to = "Class", 
               cols = c("Mon", "Tue", "Wed", "Th", "Fr")) %>% 
  mutate(Day = factor(Day, levels = c("Mon", "Tue", "Wed", "Th", "Fr"))) %>% 
  filter(Class == TRUE)

# Descriptive summary
table1 <- dat1 %>% 
  left_join(div, by = "DeptProg", ) %>% 
  group_by(Division) %>% 
  summarize(Total = sum(Reg)) %>%
  drop_na()
knitr::kable(table1, format="html") %>% 
  kableExtra::kable_styling(bootstrap_options = "striped", full_width = F, position = "left")

# Map all course blocks using geom_tile
ggplot(dat1, aes(x = Day , y = (Start + End) / 2,  width = 0.5 , 
                 height = End - Start, alpha  = Reg)) + 
  geom_tile(fill = rgb(.7,0,0)) +
  scale_y_reverse() + ylab("Time") +
  facet_wrap(~ DeptProg) +
  theme(axis.text.x = element_text(angle = 90, vjust = 0, hjust = 1))
