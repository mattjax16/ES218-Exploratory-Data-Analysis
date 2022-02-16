library(lubridate)  # For date manipulation
library(dplyr)      # For dataframe manipulation
library(forcats)    # For manipulating factors

# Load the data file
dat <- read.table("http://mgimond.github.io/ES218/Data/buoy_44005_2012.dat", 
                  header = TRUE)

# Here's where we left off on Monday...
dat1 <- dat %>% 
  mutate( Date  = ymd_hm(paste(YY, MM, DD, hh, mm)) , 
          Month = month(Date, label = TRUE),
          PRES  = ifelse(PRES == 9999, NA, PRES)) %>% 
  mutate_at(vars(WVHT, DPD, APD, WSPD, GST), 
            list(~ ifelse( . == 99, NA, . )) ) %>% 
  mutate_at(vars(WDIR,DEWP),
            list(~ ifelse( . == 999, NA, . ))) %>% 
  select(-YY, -MM, -DD, -hh, -mm, -MWD, -VIS, -TIDE) %>% 
  filter(Month %in% c("Jun", "Jul", "Aug"))   

# Revisit factors
str(dat1)  # Structure
typeof(dat1$Month)  # Why is the data type numeric?
attributes(dat1$Month)  # Factors store the values as tags
levels(dat1$Month)  # Note that Other "levels" are still present

# The extra levels can be a nuisance, for example:
boxplot(WTMP ~ Month, dat1)

# "Re-level" all  factors in a dataframe
dat1 <- dat %>% 
  mutate( Date  = ymd_hm(paste(YY, MM, DD, hh, mm)) , 
          Month = month(Date, label = TRUE),
          PRES  = ifelse(PRES == 9999, NA, PRES)) %>% 
  mutate_at(vars(WVHT, DPD, APD, WSPD, GST), 
            list(~ ifelse( . == 99, NA, . )) ) %>% 
  mutate_at(vars(WDIR,DEWP),
            list(~ ifelse( . == 999, NA, . ))) %>% 
  select(-YY, -MM, -DD, -hh, -mm, -MWD, -VIS, -TIDE) %>% 
  filter(Month %in% c("Jun", "Jul", "Aug"))  %>% 
  mutate(Month = fct_drop(Month))
  

## To re-level just one factor, use the forcats package

# A word of caution about ifelse() -----
# This behaves as expected....
x <- c(2, 10, -1, 4, 0)
ifelse(x <= 0, -99, x) 

# ... this does not -----
d <- ymd("1995-6-5", "1997-8-30", "2004-6-23") # Is a date object
ifelse( d == "1997-8-30", NA, d )  # ifelse does not preserve class!

# Dplyr's if_else is better, but know your data class and types! -----
if_else( d == ymd("1997-8-30"), NA, d ) # here is wont work wants 
                                        # data types to match
if_else( d == ymd("1997-8-30"), NA_Date_, d ) # or
if_else( d == ymd("1997-8-30"), ymd(NA), d )

# Likewise...
y <- c("apple", "peanar", "orange", "banana")
if_else(y =="apple", NA_character_, y)
if_else(y == "apple", as.character(NA), y)

# Do not use if_else or ifelse with factors ----
f <- as.factor(c("apple", "banana", "banana", "pear", "apple"))
if_else(f == "pear", f, NA)  # Generates an error
if_else(f == "pear", f, NA_character_)  # Generates an error
if_else(f == "pear", f, as.factor(NA))  # Does not drop levels

# Instead, use recode() for factors ----
recode(f, "pear" = NA_character_)
recode(f, 
       "banana" = "kiwi", 
       "pear" = NA_character_) # Can apply multiple arguments

# You can also use recode on vectors
# For example, avoid nested if_else
unit <- c("F","F","C", "K")
recode(unit,
       "C" = "Celsius",
       "K" = "Kelvin",
       "F" = "Fahrenheit")

# DONT USE RECODE FOR NUMERIC DATA TYPES


# Use case_when for more complicated conditions ----
unit <- c("F","F","C", "K")
temp <- c(45.2, 56.3, 11.0, 285)
df <- data.frame(unit,temp)


df %>% 
  mutate(tempF = case_when(unit == "F" ~ temp,
                           unit == "C" ~ (temp* 9/5)+32,
                           unit == "K" ~ (temp-273.15) * 9/5 + 32),
         unit = recode(unit,
                       "C" = "Celsius",
                       "K" = "Kelvin",
                       "F" = "Fahrenheit"))


