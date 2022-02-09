# vector (attomic vector)
a <- c(3.14,2L,5.3)
b <-  c(4L,3L,1L)
d <- c("abc", "abc edf", 3.14)
l <- c(FALSE,FALSE,TRUE)

# chr >double >int >logical

# data frame 
df <- data.frame(a,b,d,l)


### Dervived data types

# factor
f <- c("abc","abc","e","f","e")

f.fac <- as.factor(f)


# date time (stored as number past 1970)
dt <- as.Date("2022-02-04")
as.double(dt)


# Identify Classes
class(dt)
class(f.fac)
class(a)

b2 <- df$b

typeof(b2)


#change the name of the row frames
row.names(df) <- c("sample 1", "sample 2","sample 3")


# Mapping
y = c(TRUE,FALSE,TRUE)

df[y,]

# Shows how r will recycle  for arrays that arent the right length
df$b <- month.abb[df$b]


