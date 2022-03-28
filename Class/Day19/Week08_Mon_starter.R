library(dplyr)
library(ggplot2)

# Data prep
alto  <- lattice::singer %>% 
  filter(voice.part == "Alto 1") %>% 
  arrange(height) %>% 
  mutate(fval = (row_number() - 0.5) / n())

