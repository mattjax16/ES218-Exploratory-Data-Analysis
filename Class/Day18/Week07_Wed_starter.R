library(dplyr)
library(ggplot2)
library(tidyr)

# Load data
df  <- lattice::singer  # The lattice package should already be in the system library

# Compute f-values
df2 <- df %>% 
  filter(voice.part %in% c("Tenor 1", "Tenor 2")) %>% 
  mutate(voice.part = droplevels(voice.part)) %>% 
  group_by(voice.part) %>% 
  arrange(height) %>% 
  mutate(fval = (row_number() - 0.5) / n() )

ggplot(df2, aes(x=fval, y=height)) + geom_point() + 
  facet_wrap(~voice.part, ncol=1) 

# A better approach is to map to a common variable: the f-value
# We can spread by voice.part and height because both
# voice parts share the same f-value. If they didn't, we would
# get an error message.
df3 <- pivot_wider(df2, names_from =  voice.part , values_from =  height)

xylim <- range(df2$height)
ggplot(df3, aes(x = `Tenor 1`, y = `Tenor 2`)) + geom_point() +
  geom_abline(intercept = 0, slope = 1) + 
  ylim(xylim) + xlim(xylim) + 
  coord_fixed(ratio = 1)


# If offset to line additive or subtraction depending on way.
# When dots are at an angle we have a multiplicative relationship.
# Can have a mixture of the two like we have here

# We can try and manipulate values to fit the 45 degree line
# How does Tenor 2 compare to Tenor 1
xylim <- range(50, 100)
ggplot(df3, aes(x = `Tenor 1` * 0.6 + 29, y = `Tenor 2`)) + geom_point() +
  geom_abline(intercept = 0, slope = 1) + 
  ylim(xylim) + xlim(xylim) + 
  coord_fixed(ratio = 1)


lm(`Tenor 2` ~ `Tenor 1`, df3)

xylim <- range(50, 100)
ggplot(df3, aes(x = `Tenor 1` * 0.5807 + 29.8903, y = `Tenor 2`)) + geom_point() +
  geom_abline(intercept = 0, slope = 1) + 
  ylim(xylim) + xlim(xylim) + 
  coord_fixed(ratio = 1)

# This worked well because we have same number of observations.


## What if the number of observations do not match? 


df4 <- df %>% 
  filter(voice.part %in% c("Tenor 1", "Bass 2")) %>% 
  droplevels() 

# Base qq plot
tenor1 <- df4 %>% filter(voice.part == "Tenor 1") %>% pull(height)
base2 <- df4 %>% filter(voice.part == "Bass 2") %>% pull(height)
qq.out <- as.data.frame(qqplot(x = tenor1, y = base2, plot.it = FALSE))
names(qq.out) <- c("Tenor1","Bass2")


xylim <- range(60, 80)
ggplot(qq.out, aes(x = Tenor1 + 2.5 , y = Bass2)) + geom_point() +
  geom_abline(intercept = 0, slope = 1) + 
  ylim(xylim) + xlim(xylim) + 
  coord_fixed(ratio = 1)
