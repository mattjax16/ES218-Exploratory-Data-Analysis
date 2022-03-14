library(dplyr)
library(tidyr)
library(stringr)

#Reading in data
dat1 <- read.csv("rent_2020.csv") 
dat2 <- read.csv("rent_2015.csv")



#Merging data to long table 
dat1.long <- dat1 %>%
  mutate(Geo_FIPS = as.numeric(Geo_FIPS),
         State = str_split_fixed(Geo_QNAME,",",2)[,2]) %>% 
  left_join(dat1, dat2, by = "Geo_FIPS") %>%
  select(-Geo_QNAME.x,-Geo_NAME.x, -Geo_FIPS,-Geo_QNAME.y) %>% 
  pivot_longer(cols = c(-State, -Geo_NAME.y), names_to = "Rent.Type",
               values_to = "Rent") %>% 
  mutate(Year = ifelse(str_split_fixed(Rent.Type, "[.]",2)[ ,2] == "x",
                       2015,
                       2020),
         Rent.Type = case_when(str_detect(Rent.Type, "T006_001") ~ "Efficiency",
                               str_detect(Rent.Type, "T006_002") ~ "1bed",
                               str_detect(Rent.Type, "T006_003") ~ "2bed",
                               str_detect(Rent.Type, "T006_004") ~ "3bed",
                               str_detect(Rent.Type, "T006_005") ~ "4bed"))



# Final part C

part.C <- dat1.long %>% 
  filter(str_detect(Rent.Type, "4bed")) %>% 
  group_by(State) %>% 
  summarize("2015" = mean(Rent[Year == 2015]),
            "2020" = mean(Rent[Year == 2020]))