library(dplyr)
library(tidyr)

# Step 1 ----
# Breakdown the variables and create a long version of the data table

# Load data and codebook 
shap
code <- read.csv("http://mgimond.github.io/ES218/Data/Income_education_codebook.csv")

# Add two columns to the codebook
code1 <- code %>% 
  mutate(Level  = rep( c("All", "NoHS", "HS", "AD", "BD", "Grad"), times = 3),
         Gender = rep( c("All", "Male", "Female"), each = 6))

# Create tidy table
dat1 <- dat %>% 
  pivot_longer(cols = c(-County, -State),
               names_to = 'Code', 
               values_to = "Income") %>% 
  left_join(code1, dat, by = "Code") %>% 
  select(County, State, Level, Gender, Income)

# Query 1 -----
# Compute the mean income for Male and Female graduates by state
query1 <- dat1 %>% 
    filter(Level == "Grad", Gender != "All" ) %>% 
    group_by(Gender, State) %>% 
    summarise(Income = mean(Income, na.rm = TRUE)) %>% 
    pivot_wider(names_from = Gender,
                values_from = Income)
  


# Query 2 -----
# Compute the mean income for Male and Female graduates by state and add the number
# of counties in each state where female incomes are greater than their male 
# counterparts.






  