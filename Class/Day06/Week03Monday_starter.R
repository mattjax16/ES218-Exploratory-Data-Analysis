library(lubridate)
library(dplyr)

# Load the data file
dat <- read.table("http://mgimond.github.io/ES218/Data/buoy_44005_2012.dat",
                  header = TRUE)

# Add a column (using base R ecosystem)
dat$Date <- ymd_hm(paste(dat$YY, dat$MM, dat$DD, dat$hh, dat$mm))

