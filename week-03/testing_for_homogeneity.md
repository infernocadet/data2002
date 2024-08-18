# testing for homogeneity - covid tests

> testing for proportions - seeing if they are the same across different categories - testing for homogeneity

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/tab.png" width="350" height="auto">
</p>

in this study, 39 plasma recipients were propensity-score matched to 156 control patients to assess the effectiveness of convalescent plasma therapy in patients with severe or life-threatening COVID-19.

we want to see, is there any evidence that convalescent plasma is an effective treatment for severe covid-19?

## test of homogeneity

- suppose the observations were sampled from two independent populations - each of which is categorised according to the same set of outcomes.
- we want to test whether the distribution (proportions) of the outcomes are the same across different populations.

the this ex. we consider the proportions of patients treated with plasma who died or were discharged and (separately) the proportion of patients who were not treated with plasma who died or were discharged.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/pro.png" width="350" height="auto">
</p>

under the null hypothesis of _homogeneity_, the proportion of patients who died is the same in both populations, meaning $p_11 = p_21$, and the proportion of patients who were discharged is the same in both populations, meaning $p_12 = p_22$.

## two way contigency table

a **contingency table** allows us to tabulate data from multiple categorical variables.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/ct.png" width="350" height="auto">
</p>

in order for us to load this data into R and turn it into a table:

```r
library(tidyverse)
dat = read_csv("link")
dplyr::glimpse(dat)

# this would show us the data ^ then we mutate?

dat = dat |> filter(outcome != "Censored") |>
  mutate(treatment = factor(treatment, levels = c("Plasma", "No Plasma")),
         outcome = factor(outcome, levels = c("Died", "Discharged")))

table(dat$treatment, dat$outcome)

dat |>
  janitor::tabyl(treatment, outcome) |>
  gt::gt()
```

### notation

in 2x2 contingency tables:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/not.png" width="350" height="auto">
</p>

basically y.1 means add up the first column, y.2 means add up the second column, y1. means add up the first row.

the dot "." basically justy means all. so if you do y.1 that means add up all the rows of the first column. y.. means add up all rows of all columns.

under the null hypothesis of homgeneity, we have $p_11 = p_21$ and $p_12 = p_22$, so our best estimate of the proportion in each categoriy is the column total divided by the overall sample size, $\widehat{p}_ij = \frac{y_{\bullet j}}{n}$.

under the null, expected counts are

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/exp.png" width="350" height="auto">
</p>
