library(dplyr)
library(ggplot2)

# Data prep
alto  <- lattice::singer %>% 
  filter(voice.part == "Alto 1") %>% 
  arrange(height) %>% 
  mutate(fval = (row_number() - 0.5) / n())


# Density plot
ggplot(alto, aes(height)) + geom_density(fill = "bisque")


# Normal Q-Q plot
ggplot(alto, aes(sample = height)) + 
  geom_qq(distribution = qnorm) + 
  geom_qq_line(distribution = qnorm, col  = "red")
  
# Simulate normal distribution from alto 1 mean and SD
x.mean <- mean(alto$height)
x.sd <- sd(alto$height)

x <- rnorm(n = 35, mean = x.mean, sd = x.sd) # Generate rand height values

# Theoretical Q-Q plot 
ggplot() + aes(sample = x) + 
  geom_qq(distribution = qnorm) + 
  geom_qq_line(distribution = qnorm, col  = "red")



# Compare with expodential 
ggplot(alto, aes(sample = height)) + 
  geom_qq(distribution = qexp) + 
  geom_qq_line(distribution = qexp, col  = "red")
