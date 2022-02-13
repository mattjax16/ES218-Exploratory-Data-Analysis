# Lab instructions

An intern was asked to load the Augusta.csv dataset and perform some basic data manipulations. His week02.R script is stored in this repo.

1. Before tackling this lab assignment, make sure to clone this repo to your local PC.

2. From within your local copy of the repo, you will open this README.md file in RStudio and list all issues you have with this intern's work. Issues are both technical as well as aesthetic (you will rely on the [R coding guide](https://moodle.colby.edu/pluginfile.php/564965/mod_resource/content/2/Style_guide.html) that is up on Moodle for coding aesthetic guidance.

> Note: files ending with an `.md` extension are Markdown documents. Markdown is a cross between plain text and tag-based text. You can go ahead and answer the above question using plain text, but if you would like to learn more about markdown syntax, see [here](https://www.markdownguide.org/cheat-sheet/). Note that markdown syntax is a bit different from Rmarkdown syntax (in fact, Rmarkdown is built-off of markdown)

3.  Fix the code, save the R script, stage/commit, then upload this repo back to your GitHub account.

You will be graded on this final repo.

<br>

---
 
## ISSUES :

 <br>

* **Technical :**
    
    1. Reading in data (Using `na.strings` to clean data) :
        - On [line 5](https://github.com/colby-es218-2022/week02_lab-mattjax16/blob/9366feae03fd60cbf58601ccb1df367b8892d538/week02.R#L5) when reading in the data the argument `na.strings = c(-999, 999, 0)` is used in `read.csv()` to replace the missing values for different variables to `NA` (Based off of [Augusta_2019_README.txt](https://github.com/colby-es218-2022/week02_lab-mattjax16/blob/main/Augusta_2019_README.txt) ). However when using `na.strings` all values in every column are changed to `NA` if the match any of the values assigned to `na.strings`. That is not a problem when either all variables use the same value to represent a missing value and/or the missing value for each variable never appear as a valid value for another variable in the file. In the case of *Augusta_2019.csv* while `atmos_pres` (atmospheric pressure) has its missing value coded as 0 there are many other variables in the data set that have 0 as a valid value so that means if the code is  `dat = read.csv("Augusta_2019.csv", na.strings = c(-999, 999, 0))` there will be numerous valid values that will be incorrectly converted to `NA` so instead the data should be cleaned one variable at a time according to [Augusta_2019_README.txt](https://github.com/colby-es218-2022/week02_lab-mattjax16/blob/main/Augusta_2019_README.txt). See below :

            ```R
            # Replacing missing data stats based on Augusta_2019_README.txt
            # temp: Missing values are coded as -999.
            dat[dat$temp == -999 , "temp"] <- NA

            # wd: Missing values are coded as 999.
            dat[dat$wd == 999 , "wd"] <- NA

            # ws:  Missing values are coded as 999.
            dat[dat$ws == 999 , "ws"] <- NA

            # atmos_pres: Missing values are coded as 0.
            dat[dat$atmos_pres == 0 , "atmos_pres"] <- NA

            # dew_point:  Missing values are coded as -999.
            dat[dat$dew_point == -999 , "dew_point"] <- NA
            ```


    <br>
    
    2. Setting up date with `ymd()` (arguments) :
        - On [line 6](https://github.com/colby-es218-2022/week02_lab-mattjax16/blob/9366feae03fd60cbf58601ccb1df367b8892d538/week02.R#L6) the `ymd()` function from the lubridate libary is going to produce the wrong output because `ymd()` takes in the arguments in the order of year , month,day. However in week02.R the intern wrote the line `ymd<- ymd(paste(dat$month, dat$day, dat$year))`  and it should be :
           
           ```R 
           ymd(paste(dat$year, dat$month, dat$day))
           ```


<br>

* **Aesthetic :**
    1. Header Comments :
        - There is no intial heaing commentes for [week02.R](https://github.com/colby-es218-2022/week02_lab-mattjax16/blob/main/week02.R) I would say that the Intern should always have some
        sort of header comments with the date, name of the script, author of
        the script and a brief descriptions of the scripts purpose. For example what I updated it to.

            ```R 
            # Matt Bass
            # week02.R
            # 02/13/22
            # 
            # This is a script to read in data from Augusta_2019.csv and 
            # add a date column to it comprising of the year month and day.
            ```
    
    <br>

    2. Use of `=` for assighnment :
        - On [line 5](https://github.com/colby-es218-2022/week02_lab-mattjax16/blob/9366feae03fd60cbf58601ccb1df367b8892d538/week02.R#L5) when reading in the data the `=` sign is use which wile acting the same as the assighnment operator `<-` it is still good practice to always use the assighnment operator. So instead of `dat = read.csv("Augusta_2019.csv", na.strings = c(-999, 999, 0))` it should be :

            ```R 
            dat <- read.csv("Augusta_2019.csv")
            ```

    <br>

    3. Naming the output of `ymd()` the same as the function :
        - On [line 6](https://github.com/colby-es218-2022/week02_lab-mattjax16/blob/9366feae03fd60cbf58601ccb1df367b8892d538/week02.R#L6) the intern wrote the line `ymd<- ymd(paste(dat$month, dat$day, dat$year))`. Along with the incrocet order ot the year, month, and day the intern also stored the output of the function to a variable with the same name of the function. While in this case it does not effect the use of `ymd()` it is still bad practice to name a variable with the name of a common function or other variable use with-in the script. Not only that but the only use of this variable was to then assighn it to a new date column in the dataframe as seen with the line of code `dat$date = ym`([line 7](https://github.com/colby-es218-2022/week02_lab-mattjax16/blob/main/week02.R#L7)). Instead of 2 lines of code and poor naming of variables this can all be condenced to the code:

            ```R 
            dat$date <- ymd(paste(dat$year, dat$month, dat$day))
            ```
    
    <br>

     4. Lack of comments and spacing in code :
        - There is a lack of comments explaing what is going on in the code and also spacing seperating different major functions of the code. This leads to the code being harder for other to understand what is going on. In the new version of week02.R proper comments and spacing are added.






