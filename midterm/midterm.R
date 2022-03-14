# Matthew Bass
# Midterm ES218
# 03/11/2022

library(dplyr)
library(tidyr)
library(lubridate)
library(stringr)
library(ggplot2)



# The following data are used for questions 8 and 9
load("data_files.RData")



# Question 1 ----
data("mtcars")

q1 <- mtcars %>% 
  mutate(cylinder = case_when(cyl == 4 ~ "four",
                              cyl == 6 ~ "six",
                              cyl == 8 ~ "eight"))
  

# Question 2 ---- 
q2 <- mtcars %>% 
  filter((mpg > 15) & (mpg < 24)) %>% 
  select(cyl,hp)


# Question 3 ---- 
data("iris")

q3 <- iris %>% 
  filter(Species == "virginica",
         Sepal.Length < 6 | Sepal.Length > 7,
         Sepal.Width > 2.8 & Sepal.Width < 3.2)


# Question 4 ----
ggplot(data = iris, aes(x = Sepal.Width)) +
  geom_density(bw = 0.5) +
  facet_wrap( ~ Species) +
  xlab("Sepal Width (cm)") +
  ggtitle("Distribution of Sepal Width over the Iris Species")



# Question 5 ---- 
q5 <- iris %>% 
  select(-Petal.Length, -Petal.Width) %>% 
  pivot_longer(cols = c(Sepal.Length, Sepal.Width),
               names_to = "Sepal") %>% 
  mutate(Sepal = str_split_fixed(Sepal, "[.]", 2)[ ,2]) %>% 
  group_by(Species, Sepal) %>% 
  summarize(Value = median(value)) %>% 
  arrange(Sepal)


# Question 6 ---- 
data("storms")

q6 <- storms %>%  
    filter(str_detect(name, "Andrew") |
              str_detect(name, "Arthur") |
              str_detect(name, "Barry") |
              str_detect(name, "Bonnie")) %>% 
  group_by(name, year) %>% 
  summarise(`max winds` = max(wind))


# Question 7 ---- 
q7 <- storms %>%
  filter(str_detect(status, "hurricane")) %>% 
  mutate(Letter = str_sub(name, start = 1, end=1)) %>% 
  group_by(Letter) %>% 
  summarise(Count = n())


# Question 8 ---- 
ggplot(mask , aes(x = reorder(state, +fraction), y = fraction)) +
  geom_bar(stat= "identity", orientation = "x") + 
  facet_wrap(~ wear_mask) +
  coord_flip() +
  xlab("States") + 
  ylab("Fraction") +
  ggtitle("Fraction of population that wears a face mask") +
  theme(plot.title = element_text(hjust = 0.5))



# Question 9 ---- 
q9 <- pres %>% 
  mutate(state = if_else(str_detect(state, "District Of Columbia"),
                         "District of Columbia",
                         state)) %>% 
  right_join(mask, by = "state") %>% 
  filter(str_detect(wear_mask, "always"))

ggplot(q9 , aes(x = winner, y = fraction)) +
  geom_boxplot() + 
  xlab("2020 Presidential election winner") + 
  ylab("Fraction of population that always wear masks") +
  ggtitle("Mask wearing by election results")
  
  
  



