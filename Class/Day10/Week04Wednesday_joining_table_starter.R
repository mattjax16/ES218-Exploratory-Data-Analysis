library(dplyr)

df <- data.frame( x = c(1, 23, 4, 43, 2, 17),
                  y = c("a", "b", "b", "b", "a", "d"))

dj <- data.frame( z = c("apple", "pear", "orange"),
                  y = c("a", "b", "c"))

# Left join
left_join(df, dj, by = c("y" = "y"))

# Switch join direction (Look at rows)
left_join(dj, df, by = c("y" = "y"))

# Right join
right_join(df, dj, by = c("y" = "y"))

# Inner join
inner_join(df, dj, by = "y")
inner_join(dj, df, by = "y")

# Outer Join (Full join)
# Bassicly inner join and miss-matches
full_join(df, dj, by = "y")
