## HW 10

In this assignment, you will work off of two datasets: fair market rents for 2015 and for 2020. The data were generated from the Department of Housing and Development and made available via Socialexplorer.com. The code book (dataset documentation) that came with the data is stored in the `code_book.txt` file. 

> Only adopt workflows and functions covered in class or on this course's website.

###  Part A

The data were unaltered from their original source. Organizations like Socialexplorer.com will do their best to clean up the data but when dealing with large datasets, errors in the dataset can be elusive. For example, each US county has a unique numeric federal ID (also referred to as FIPS). This ID is encoded as the `Geo_FIPS` variable in both data files. As such, when loaded into R, this variable should be identified as being numeric and not character. You'll probably note that the 2015 dataset treats `Geo_FIPS` as a character. Recall that there is a data type hierarchy whereby R will assign a column the datatype based on *all* values present in that vector (see the last paragraph in the data type [lecture note](https://mgimond.github.io/ES218/Week02a.html#(Atomic)_Vectors)  which addresses the highest common mode). So if R is forcing what should be a numeric column to a character, it must be seeing one, or several, non-numeric values in that column.

It's always good practice to check the integrity of the data and to understand why  a variable is assigned an unexpected data type. If this was a small data table, a quick scan of the CSV file in a text editor could help identify the problematic value(s). But such an approach is far more difficult with a data table consisting of thousands of  rows. So in this part of the assignment, you will come up with a few lines of code that will identify the problematic value(s). The code should output the value(s) to the console. Once the problematic value(s) is/are identified, you will ensure that this/these value(s) be assigned NA and that the column be converted to double. Note that you will not be able to convert these values to integers since the integer in R can only accommodate a range of 2<sup>32</sup>--a range too small to handle the FIPS values.

### Part B

Once you've corrected the datatype associated with the `Geo_FIPS` column, you will join the two tables using `Geo_FIPS` as the common key. More specifically, you will  join the 2015 rent table to the 2020 rent table--this will be a *left* join. 

In joining the tables, you will be merging columns that have identical names. This will force R to rename these columns by appending `.x` and `.y` to their names.  This is not ideal given that it will not always be clear which column is referencing which year. This is a disadvantage of a *wide* table. A long table, on the other hand, could accommodate another variable called `Year` that would associate an observation (i.e. rent) with a year of 2015 or 2020. This portion of the workflow will be tackled in Friday's group session. But feel free to start thinking about how you would define the variables for a  tidy version of this dataset and how you might proceed in creating the tidy table.



