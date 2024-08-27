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
