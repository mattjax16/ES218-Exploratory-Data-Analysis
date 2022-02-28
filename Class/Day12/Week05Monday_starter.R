library(dplyr) # Used later for some data manipulation

load(url("http://mgimond.github.io/ES218/Data/dat1_2.RData"))

# Basic
plot(Oats ~ Year, data = dat1w, type = "l", lty = 2,
     xlab = "Year", ylab = "Oat Production")


plot(y = dat1w$Oats , x = dat1w$Year, type = "l", lty = 2)

#  To add variable to plot
y.rng <-  range( c(dat1w$Oats, dat1w$Barley, dat1w$Maize) )
plot(Oats ~ Year, data = dat1w, type = "l", xlab = "Year", ylim = y.rng)
lines(Barley ~ Year, data = dat1w, type = "l", lty = 2)
lines(Maize ~ Year, data = dat1w, type = "l", lty = 3)


# Boxplot
boxplot(dat1w$Oats, dat1w$Barley, dat1w$Maize, 
        names = c("Oats" , "Barley", "Maize"))

# better approach for boxplots go from a wide to a long format.
boxplot(Yield ~ Crop, data = dat1l) # can dd more plots without modifying boxplot 
                                    # command

#  Reorder Crop variable 
dat1l$Crop.ord <- reorder(dat1l$Crop, dat1l$Yield, median)
#  making better boxplot with reordered crop factors
boxplot(Yield ~ Crop.ord, data = dat1l)

# Reducing plot down to just 2 crop types
dat2l <- dat1l %>% 
  filter(!Crop.ord %in% c("Maize", "Barley")) %>% 
  mutate(Crop.ord = droplevels(Crop.ord))

boxplot(Yield ~ Crop.ord, data = dat2l)


# Histogram
hist(dat1w$Oats, col  = "bisque")

# To get unique colors in R
colors(distinct = T)

#  Colors 
boxplot(Yield ~ Crop.ord, data = dat2l, colors = dat2l$Crop.ord)
