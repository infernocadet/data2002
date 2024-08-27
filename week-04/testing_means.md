# testing means

## general t test background

what is the t-distribution?

facts about samples from **normal populations**:

- sample mean from a normal sample is itself normally distributed.
- same variance from a normal sample has a scaled chi-squared distribution ($\chi^2$)
- sample mean and sample variance from a normal sample are statistically independent.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/dof.png" width="auto" height="auto">
</p>

## t-statistic

given a population mean, $\mu$, the sample mean, $\bar{X}$, and variance $S^2$, the ratio:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/tstat.png" width="auto" height="auto">
</p>

the numerator is actually a normal distribution, and the denominator follows a chi-squared distribution.

in many statistical applications, we have a model where a certain statistic has this general form:
the ratio of
estimator - true value / standard error follows a t distribution.

### one sample t-test

take a look at this beer content:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/beer.png" width="auto" height="auto">
</p>

the general hypothesis testing workflow follows:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/ght.png" width="auto" height="auto">
</p>

here, theta is just a population parameter, we're looking at means - and our assumptions is that our observations we sample are distributed as some particular distribution. observations are independent.

each observation, X1, X2, Xn is chosen at random from a population. we say that such random variables are _iid_ (independently and identically distributed).

Test statistic is a result of a function f. since observations Xi vary from sample to sample, we are never really sure if H0 is true or not. we use a test statistic T = f(X1, X2,.. Xn) to test if the data are consistent with H0 such that the distribution of T is known assuming H0 is true. large (pos or neg) test statistic is where we plug our observed data into the formula

p-value is the probability of getting a t statistic as or more extreme than what we observed, assuming H0 is true.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/typ.png" width="auto" height="auto">
</p>

if we're proposing that the actual population parameter is larger than some value, we check the p-value of the T stat being larger than what we observed. if we're proposing that the actual population

suppose we have a sample X1 X2... Xn of size n drawn from a normal population with an unknown variance of $\sigma^2$. let x1, x2,... xn be the observed values, and we want to test population mean $\mu$.

workflow:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/ost.png" width="auto" height="auto">
</p>

beer contents:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/bc.png" width="auto" height="auto">
</p>

we could also just do this solely in R.

```r
t.test(x, mu = 375, alternative = "less")
```

## two sampled t test

if we have two samples, there may be times we want to test if the population means of two samples are different. there are two possible scenarios:

1. two independent samples
2. two related samples (dependent samples or repeated measures)

> blood samples are taken from 11 smokers and 11 non-smokers to measure aggregation of blood platelets. are these dependent or independent samples?

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/blo.png" width="auto" height="auto">
</p>

first, we should visualise the data:

```r
library(ggplot2)
ggplot(dat) + aes(x = status, y = platelets) +
    geom_boxplot() +
    geom_jitter(width = 0.15, size = 3, colour = "blue") +
    labs(x = "", y = "Blood platelet\naggregation")
```

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/vis.png" width="auto" height="auto">
</p>

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/twf.png" width="auto" height="auto">
</p>

what this workflow means:

- hypotheses: null: mean of u = mean of y. alt: they are not equal, or one is larger / smaller
- assumptions: samples are _iid_ and they follow a normal distrbution. they are independent. MOREOVER: distributions of both samples must have the same variance, as seen sigma squared is consistent
- test statistic: given as a formula

we can also do this in R:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/tsi.png" width="auto" height="auto">
</p>

## equal variance assumption

we assume that the two underlying normal populations have the same variance. if we actually do look at the standard deviation, they are a little different:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/smok.png" width="auto" height="auto">
</p>

do they really have equal underlying population variance? we can use the **welsch test**.

this does not assume equal population variance

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/welsch.png" width="auto" height="auto">
</p>

to use the welch t-test in R, we just use `t.test()` but don't change the `var.equal` parameter, which is by default set to FALSE.

## paired samples t-test

this is more for a before and after test, where there is some natural link between your observations.

lets take a look at an example of blood samples from 11 individuals before and after they smoked a cigarette.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/cig.png" width="auto" height="auto">
</p>

we can plot the distribution of our differences and we can see that if there was no difference, the distribution should be centred on zero. doesn't look to be.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/pot.png" width="auto" height="auto">
</p>

we can put this into R and set the paired = TRUE parameter. OR, we can simply just conduct a regular t test on the differences.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/pte.png" width="auto" height="auto">
</p>

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/oip.png" width="auto" height="auto">
</p>
