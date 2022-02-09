# Class 4 Notes
# 02/09/2022

a  <- 3
a < 4
a == 4
identical(a,3L)

x <- c("a","f","a","d","a")
x == "a"
x == c("a","f")

# boolean operations
(x == "a") | (x == "f")

TRUE & FALSE

3 %in% c(3,4) #different from below
3 == c(3,4)

"a" %in% c("b","cd","f")

# Subsetting data
?subset
# x, subset, select
subset(x = mtcars, subset = (mpg > 25) & hp > 70, select =  hp)

x[c(2,4)]

#masking
mask <- x == "a"
x[mask]

x[mask] <-"o"
x[x == "a"] <- "o"
x[x %in% c("a", "d")] <- "o"


mtcars[mtcars$mpg > 25 ,]
