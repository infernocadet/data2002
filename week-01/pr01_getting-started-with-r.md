# getting started with `r studio`

## syntax and stuff

install packages using `install.packages("package_name")`

load packages using `library(package_name)`

to take a peek into a dataframe, use `dplyr::glimpse(dataframe_name)` or `dply::str(dataframe_name)` or `dplyr::head(dataframe_name)`

to create or rename a variable or column in the df, we can use `dplyr::mutate()`

to clean the variable names of a dataframe, use `janitor::clean_names(dataframe_name)`

to visualise the missing rows of a dataframe, use `visdat::vis_miss(dataframe_name)`

to count the number of rows in a dataframe, use `nrow(dataframe_name)`

to drop rows with missing values, use `tidyr::drop_na(dataframe_name, column_name)`

let's say we have a dataframe with information on different species of penguins. if we wanted to count the number of males and females (sex) of the penguins based on their species, we can tabulise the dataframe into these categories using the janitor library: `janitor::tabyl(dataframe_name, column_name1, column_name2)`

we can total these values using the `adorn_totals` function from the `janitor` library: `janitor::adorn_totals(penguins_clean, where = c("row", "col"))`

## pipelines

pipelines are ways to chain together multiple functions into a single line of code:

e.g.:

```r
penguins_clean = penguins_raw |>
  janitor::clean_names() |>
  tidyr::drop_na(sex)
```

the above example on using the `tabyl` function can be rewritten using a pipeline:

```r
penguins_clean |>
  janitor::tabyl(species, sex) |>
  janitor::adorn_totals(where = c("row", "col"))
```

## plotting

we can use the `ggplot2` library to plot dataframs. use `ggplot2::ggplot` and other functions from the `ggplot2` package: `aes(), geom_bar(), labs(), coord_flip()` etc
