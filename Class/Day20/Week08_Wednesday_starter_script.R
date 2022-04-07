# Residual Fit Plots

library(ggplot2)
library(dplyr)
library(lattice)

df <- singer
ggplot(df, aes(y=height, x=voice.part))         + 
  geom_jitter(width = 0.1, height=0, alpha=0.1) +
  stat_summary(fun = mean, col="red", geom="point", cex=3, pch=21, bg="orange") 

# CHUNK 2 : Subtract the group mean from each group value
df2 <- df %>% 
  group_by(voice.part) %>%
  mutate( Height.res = ( height - mean(height) ) )

# CHUNK 3 : Plot normalized data
ggplot(df2) + aes(y=Height.res, x=voice.part)             + 
  geom_jitter(width = 0.1, height=0, alpha=0.1) +
  stat_summary(fun = mean, col="red", geom="point", cex=3, pch=21, bg="orange")

# CHUNK 4: Compare batches to pooled residuals
df3 <- df2 %>% 
  group_by(voice.part) %>% 
  arrange(Height.res) %>% 
  mutate(f.val = ( (row_number() - 0.5) / n() ) ) %>% 
  ungroup() %>% 
  mutate(Pooled.res  = quantile(Height.res, p = f.val))

ggplot(df3, aes(Height.res, Pooled.res)) + geom_point()+
  facet_wrap(~ voice.part, nrow = 1)+
  geom_abline(intercept = 0, slope = 1)


# CHUNK 5: Residual-fit spread plot (using the lattice package)
rfs(oneway(height ~ voice.part, data = df, spread = 1),
    aspect=1,
    ylab = "Height (Inches)")

