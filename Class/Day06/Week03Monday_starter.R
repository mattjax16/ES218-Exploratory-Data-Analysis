library(lubridate)
library(dplyr)

# Load the data file (GOOD TO PULL DATA STRAIGHT FROM SOURCE WHEN AVALIBLE)
dat <- read.table("http://mgimond.github.io/ES218/Data/buoy_44005_2012.dat",
                  header = TRUE)

# USing piping operator

# Add a column (using base R ecosystem)
dat$Date <- ymd_hm(paste(dat$YY, dat$MM, dat$DD, dat$hh, dat$mm))


dat10 <-dat %>% 

  # Add a column (dplyr ecosystem)
  # (creates a new output dataframe)
  # We can also clean data with mutate
   mutate(date = ymd_hm(paste(YY, MM, DD, hh, mm)),
          month = month(date, label = TRUE),
          WSPD = ifelse(WSPD == 99, NA, WSPD ),
          GST = ifelse(GST == 99, NA, GST ),
          WVHT = ifelse(WVHT == 99, NA, WVHT ),
          DPD = ifelse(DPD == 99, NA, DPD ),
          APD = ifelse(APD == 99, NA, APD ),
          DEWP = ifelse(DEWP == 999, NA, DEWP ),
          WDIR = ifelse(WDIR == 999, NA, WDIR ),
          PRES = ifelse(PRES == 9999, NA, PRES )) %>% 

  # removing the columns we don't need (subset by column)
  select( -YY, -MM, -DD, -hh, -mm, -MWD, VIS, -TIDE) %>%        

  # removing the rows we don't need (subset by row)
  filter(month %in% c("Jun", "Jul","Aug"),
                 ATMP > WTMP) %>% 
  
  # sorting data by order
  arrange( rev(date) ,WTMP ) 


