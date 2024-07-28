# getting started with `r studio`

## syntax and stuff

install packages using `install.packages("package_name")`

load packages using `library(package_name)`

to take a peek into a dataframe, use `dplyr::glimpse(dataframe_name)`

to clean the variable names of a dataframe, use `janitor::clean_names(dataframe_name)`

to visualise the missing rows of a dataframe, use `visdat::vis_miss(dataframe_name)`

to count the number of rows in a dataframe, use `nrow(dataframe_name)`

to drop rows with missing values, use `tidyr::drop_na(dataframe_name, column_name)`

let's say we have a dataframe with information on different species of penguins. if we wanted to count the number of males and females (sex) of the penguins based on their species, we can tabulise the dataframe into these categories using the janitor library: `janitor::tabyl(dataframe_name, column_name1, column_name2)`

## pipelines

pipelines are ways to chain together multiple functions into a single line of code:

e.g.:

```r
penguins_clean = penguins_raw |>
  janitor::clean_names() |>
  tidyr::drop_na(sex)
```
