# testing for homogeneity - covid tests

> testing for proportions - seeing if they are the same across different categories - testing for homogeneity

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/tab.png" width="auto" height="auto">
</p>

in this study, 39 plasma recipients were propensity-score matched to 156 control patients to assess the effectiveness of convalescent plasma therapy in patients with severe or life-threatening COVID-19.

we want to see, is there any evidence that convalescent plasma is an effective treatment for severe covid-19?

## test of homogeneity

- suppose the observations were sampled from two independent populations - each of which is categorised according to the same set of outcomes.
- we want to test whether the distribution (proportions) of the outcomes are the same across different populations.

the this ex. we consider the proportions of patients treated with plasma who died or were discharged and (separately) the proportion of patients who were not treated with plasma who died or were discharged.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/pro.png" width="auto" height="auto">
</p>

under the null hypothesis of _homogeneity_, the proportion of patients who died is the same in both populations, meaning $p_11 = p_21$, and the proportion of patients who were discharged is the same in both populations, meaning $p_12 = p_22$.

## two way contigency table

a **contingency table** allows us to tabulate data from multiple categorical variables.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/ct.png" width="auto" height="auto">
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
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/not.png" width="auto" height="auto">
</p>

basically y.1 means add up the first column, y.2 means add up the second column, y1. means add up the first row.

the dot "." basically justy means all. so if you do y.1 that means add up all the rows of the first column. y.. means add up all rows of all columns.

under the null hypothesis of homgeneity, we have $p_11 = p_21$ and $p_12 = p_22$, so our best estimate of the proportion in each categoriy is the column total divided by the overall sample size, $\widehat{p}_ij = \frac{y_{\bullet j}}{n}$.

under the null, expected counts are

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/exp.png" width="auto" height="auto">
</p>

## chi-squared test of homogeneity

so we have our actual cell counts, we know what the expected cell counts would be if the null hypothesis were to be true and the proportions are the same across populations.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/br.png" width="auto" height="auto">
</p>

the expected cell counts are:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/cl.png" width="auto" height="auto">
</p>

> [!IMPORTANT]
> Workflow: Chi-squared test of homgeneity for a 2x2 contigency table
>
> - Hypothesis: That p11 = p21 and p12 = p22, vs H1: p11 != p21 and p12 != p22, which means: H0: the proportions for the two outcomes are the same across the two populations vs H1: the proportions for the two outcomes are different across the two populations
> - Assumptions: observations randomly sampled from two independent populations, and expected cell counts are more than or greater to 5.
> - Test statistic: see above. Under H0, T follows a chi-square distribution with 1 degree of freedom.
> - Observed t stat: see above
> - P value: idk why i am typing this

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/wfw.png" width="auto" height="auto">
</p>

### applying to our covid data:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/cov.png" width="auto" height="auto">
</p>

- pretty simple actually, we just make a table of our expected cell counts, which is the $c_ij$th cell, divided by the total number of entries, then we sum up the squared differences to get our t-stat. this gives us like 1.9.

so our question is, is the t-stat of 1.9 large or extreme enough for us to warrant rejecting the null hypothesis (that the proportions are the same)

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/isit.png" width="auto" height="auto">
</p>

the p-value of getting a test-stat of 1.9471 is 0.16, which is quite large at the 5% level of significance. there is no evidence to suggest a significant difference in the proportion of dead and discharged patients between the plasma and control groups.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/inr.png" width="auto" height="auto">
</p>

## testing for homogeneity in general tables

take this table for voter sentiment to compare a fraction of voters favouring a new tax reform pacakge:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/sent.png" width="auto" height="auto">
</p>

we want to see, does the data present sufficient evidence to indicate that the fractions of voters favouring the new tax reform package differ in labor and liberal?

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/mult.png" width="auto" height="auto">
</p>

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/pt.png" width="auto" height="auto">
</p>

when it comes to degrees of freedom, we have degrees = (r-1)(c-1) degrees of freedom.

### workflow for contingency table

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/new.png" width="auto" height="auto">
</p>

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/neww.png" width="auto" height="auto">
</p>

we can see here that our p value is small in regards to the 5% level of significance, meaning we reject the null hypothesis, that proportions are equal. voter preferences are not homogenous across Liberal and Labour voters.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/vs.png" width="auto" height="auto">
</p>
