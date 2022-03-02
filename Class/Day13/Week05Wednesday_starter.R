library(ggplot2)

load(url("http://mgimond.github.io/ES218/Data/dat1_2.RData"))

# Remove unused files
rm(dat2, dat2b)

#  Generated Point Plot
ggplot(data = dat1w, aes(x = Year, y = Oats)) +
  geom_point()


#  Generated Line Plot
ggplot(data = dat1w, aes(x = Year, y = Oats)) +
  geom_line()


#Generate point and line plot
ggplot(data = dat1w, aes(x = Year, y = Oats)) +
  geom_line() +
  geom_point(size = 2, col = "red") 

# Plot all crop types
ggplot(dat1l, aes(x = Year, y = Yield , col = Crop, lty = Crop)) +
  geom_point() + 
  geom_line()


# faceting
ggplot(data = dat1l, aes(x = Year, y = Yield)) +
  geom_line() +
  facet_wrap( ~ Crop, nrow = 1)

# Plot income (F ~ M)
ggplot(dat2c) + aes(x = M, y = F) + 
  geom_point(alpha = 0.5) +
  facet_wrap(~ Level, nrow = 1) +
  geom_smooth(method = lm)

# Plot income (F ~ M) by level of education and region
ggplot(dat2c) + aes(x = M, y = F) + 
  geom_point(alpha = 0.5) +
  facet_grid(Region ~ Level) +
  geom_smooth(method = lm)


# Histogram
ggplot(dat1w , aes(x = Oats)) +
  geom_histogram()

ggplot(dat1l , aes(x = Yield, fill = Crop)) +
  geom_histogram() + 
  facet_wrap(~ Crop, ncol = 1)


# Boxplot
ggplot(dat1l , aes(x = reorder(Crop, Yield, median), y = Yield, fill = Crop)) +
  geom_boxplot() 


# Violin Plot (Like box plot but good for distribution and skew)
ggplot(dat1l , aes(x = reorder(Crop, Yield, median), y = Yield, fill = Crop)) +
  geom_violin() + xlab("Crop Type") + ylab("Yield (metric tons)")


