str(airquality)
airquality$Ozone
dim(airquality)
month.abb
month.abb[airquality$Month]
airquality$Mon <-
airquality$Month == 6

# Question 1: The first line of code displays the internal structure of the data 
# object airquality (a dataframe in this example). It also shows the data type 
# associated with each variable of the dataframe along with a preview of its 
# first few values. What are the data types associated with each variable of 
# airquality? Note that int is an integer and is a special case of a numeric 
# data type (the other being double, dbl).

# Answer 1:
# 
# The first variable is Ozone which is the "Mean ozone in parts per billion from
# 1300 to 1500 hours at Roosevelt Island" and has the data type of an int.
# 
# The second variable is Solar.R which is the "Solar radiation in Langleys in 
# the frequency band 4000–7700 Angstroms from 0800 to 1200 hours at Central Park
# and is the data type of int as well
# 
# The third variable is Wind which is the "Average wind speed in miles per hour
# at 0700 and 1000 hours at LaGuardia Airport" and of the data type double.
# 
# The fourth variable is Temp which is the "Maximum daily temperature in degrees
# Fahrenheit at La Guardia Airport." and is the data type int.
# 
# The fifth variable is Month which is of type int and contains numbers 1-12 
# representing the month that the observation was taken (can see the exact month
# with month.abb)
# 
# The sixth and final variable is Day which is an int datatype that represent 
# the day of the month that the sample(observation) was taken.






# Question 2: Line 2 of the code shows you how to access a single column/variable 
# of the airquality dataframe by appending the $ symbol to the end of the object 
# name. In this example, line 2 is displaying all values in the Ozone column. 
# When running line 2, you will note that many values are designated as NA. 
# What does the value NA represent? How does it differ from a value of 0?


# Answer 2:
# 
# NA represents a missing value (NA stands for not available) and means that that 
# value has not been recorded for that sample at all. IT differs from 0 in many 
# ways for instance the 0 value operating with another numeric value as 
# expected while operating with NA always results in NA (see below).
10 + 0
10 + NA



# Question 3:
# 
# What information does line 3 return (type ?dim at the console to pull up the 
# help page)? What values are returned in this example?

# Answer 3:
# 
# The dim() function returns the dimensions of R objects such as 
# matricies, arrays, and dataframes, (in this case its a dataframe)
# and it returns either a tuple of the shape in rows then columns.
# The return values of 153 and 6 make sense here because the dataframe has 
# 153 samples (rows) and 6 variables for samples (columns).
# you can also reshape objects by using dim()<- (see below)
x3 <- 1:12 ; dim(x3) <- c(3,4)
x3


# Question 4:
# 
# The Month column is represented as a number (integer), but it can sometimes be\
# helpful to designate the month by its 3 letter designation (i.e. Jan, Feb, etc…). 
# R has a built-in character vector called month.abb (line 4 of the script). 
# How many values does month.abb store?

# Question 4:
# 
# It stores 12 values which are the 3 letter abbreviations for the months in the
# order they appear in the year.



# Question 5:
# 
# Explain in your own words what it is that line 5 is doing?
month.abb[airquality$Month]

# Answer 5:
# 
# It is returning a character array the same length as the number of samples in 
# the airquality dataframe and is using the month int value of the dataframe to
# index into month.abb to get the correct 3 letter abbriviation. (mapping the 
# month ints to the correct abbreviations in month.abb)



# Question 6:
# 
# Line 6 of the code creates a new column called Mon and assigns it values 
# listed to the right of the assignment operator (which is currently blank). 
# We want the Mon column to display the three letter abbreviation of the month 
# listed in the Month column. What syntax do you need to add to the right of the
# assignment operator to complete the code? (a big hint: see line 5 of the code)

# Answer 6:
# 
airquality$Mon <- month.abb[airquality$Month]


# Question 7:
# 
# Line 7 is assessing a condition; it’s assessing if the value in the Month 
# column equals 6 for each row (hence the use of a double equality 
# sign == instead of a single equality sign =). What kind of values are 
# returned after running this line? Are the values numeric, character or logical?

# Answer 7:
# 
# It is a logical (Boolean) values which can be used to mapped to the dataframe
# to get the columns in the data frame that satisfy the logical condition (Has True)
airquality$Month == 6

# Question 8:
# 
# How would you modify line 7 if you wanted to find which rows of the table are 
# associated with the month of June using the Mon column instead of the Month 
# column? (tip: when a character is used in a conditional statement, it needs to 
# be wrapped in double quotes as in x == "abc").

# Answer 8:
# 
(airquality$Mon == "Jun")



# Question 9:
# 
# So here’s your challenge: in just one line of code (a single command), create 
# a new dataframe (you can name this dataframe airq.JanDec) by assigning it just 
# the rows in the airquality dataframe associated with the month of July. 
# You must use the indexing system for this! Hint: note that you can embed 
# functions and/or operations inside the indexing brackets.
airq.JanDec <- airquality[(airquality$Mon == "Jul"),]



