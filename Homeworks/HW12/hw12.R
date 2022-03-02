library(dplyr)



#PART A

# Load the data
dat2 <- read.csv("http://mgimond.github.io/ES218/Data/ACS.csv")

# Compute the percentage then subset by column (the latter is not critical
# but may speed up drawing time if the table is large)
acs <- dat2 %>% 
  mutate(PercBD = B23006023/B23006001 * 100) %>% 
  select(B19013001, PercBD)

# Plot the data
plot(B19013001 ~ PercBD , acs, pch = 16, col = rgb(0,0,0,.1),
     xlab="Bachelor's degree or greater (percent)",
     ylab="Median household income ($)")


#### PART B

# Subset the data by column, select just those rows meeting the state criteria
# and reorder the levels by median income
acs2 <- dat2 %>% 
  select(State, B19013001) %>%
  filter(State %in% c("me", "ma", "vt", "nh","ct","ny","ri")) %>% 
  mutate(State = reorder(State , B19013001, median),
         State = droplevels(State))

# Plot the data              
boxplot(B19013001 ~ State, acs2, ylab = "Income (dollars)")