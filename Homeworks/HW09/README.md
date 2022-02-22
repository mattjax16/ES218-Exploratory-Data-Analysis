## HW 09

In this assignment you will continue working off of the `SP2022.csv` dataset found in the current repo folder. You will probably want to recycle parts of the script created in Friday's lab (or feel free to recycle parts of lab's solution that is up on Moodle). 

In a single piping operation, you will generate a table that summarizes the total number of courses for each day of the week for Spring 2022. Make sure that the output is in chronological order (e.g. Monday > ... > Friday).

| Day  | Sum  |
| ---- | ---- |
| M    | ...  |
| T    | ...  |
| W    | ...  |
| R    | ...  |
| F    | ...  |

You will save the output to an R object called `courses_by_day`.

> Limit functions and packages to those covered in class and in the lecture notes.
 
> Note that even if you do not create the desired  output, partial credit will be given based on how far you've progressed and based on code tidiness.

TIPS:

+ Note the two variables in the output: `Day` and `Sum`. The variable `Sum` will be created near the end of the piping operation (resulting from a `summarise()` function). The `Day` variable is not present in `SP2022.csv` (it's not to be confused with the `Days` variable) but is created from existing columns. It's important that you review the `Tidying/Reshaping` section on [`pivot_longer()`](https://mgimond.github.io/ES218/Week03b.html#Creating_a_long_table_from_a_wide_table). 
+ The `sum()` function, like the `mean()` function, will return `NA` if just one of the input values is `NA`. To have `sum()` ignore `NA`s in its input, use the same argument you used in the `mean()` function in the [data type tutorial](https://mgimond.github.io/ES218/Week02a.html#NA_and_NULL).
+ Ordering character strings other than alphabetically is well suited for a factor data type. Rreview the section on [factors](https://mgimond.github.io/ES218/Week02a.html#Factor) for a refresher. You can create a factor and define its levels using the `factor()` function.
