# critical values and rejection regions and confidence intervals

## random variable basics

a random variable can be thought of as a mathematical object which takes certain values with certain probabilities.

there are **discrete** and **continuous** random variables, but we can always find an approximate continuous one with a discrete one.

a simple discrete random variable $X$ can be described as a single random draw from a "box" containing tickets, each with numbers written on them.

- $E(X) = \mu$
- $Var(X) = \sigma^2$
- $SD(X) = \sigma$

### random sample with replacement

consider taking a random sample of size n with replacement, values being $X_1, X_2, \dots X_n$

this means one of all possible samples of size $n$ is chosen in such a way that each is equally likely. if there are $N$ tickets in the box, we can ask how many such samples are there?

it turns out, all of these $X_i$ are independent and identically distributed.:

- each $X_i$ has the same distribution as single draw
- the $X_i$ are all mutually independent.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/cons.png" width="auto" height="auto">
</p>

### expectation of sums of random variables

the expectation of a sum is always the sum of the expectations:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/sunm.png" width="auto" height="auto">
</p>

multiplying by a constant, cE(X) becomes E(cX).

### variance of sums of random variables

the variance of a sum is not always the sum of the variances. however, it is, if the $X_i$s are independent. this means:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/inde.png" width="auto" height="auto">
</p>

multiplying by a constant, Var(cX) = c^2Var(X)

###

the sample mean:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/sm.png" width="auto" height="auto">
</p>

the expected value of the mean should just be the population mean.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/eb.png" width="auto" height="auto">
</p>

this says that the variance of the mean is realted to the variance of a single observation, but the more observations we have, the smaller it gets.

## estimating $\mu$

in many applications, we have data and want to estimate $\mu$, an unknown population mean.

the estimator is the sample mean $\bar{X}$, and the estimate is actually $\bar{x}$ the sum of all $x_i$, the observed value of the mean of the data we have.

we want to look at the standard error, which is the standard deviation of the estimator.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/stdev.png" width="auto" height="auto">
</p>

the standard erro tells us the likely size of the estimation error. an estimate on its own its not very useful, we need to know how accurate or reliable the estimate is.

in most contexts the SE is unknown, but we can also estimate it.

### estimating the SE

the SE involves the population variance $\sigma^2$ which is usually unknown:

```math
SE=\frac{\sigma}{sqrt(n)}
```

we can estimate $\sigma^2$ using the sample variance:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/s2.png" width="auto" height="auto">
</p>

and so the estimated standard error is

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/tf.png" width="auto" height="auto">
</p>

## critical values and confidence intervals

we want to know if given value $\mu_0$ is a "plausible value" for the unknown population $\mu$ based on our observed data.

we do this by:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/ro.png" width="auto" height="auto">
</p>

the procedures we look at include:

- t-tests (with corresponding p-values)
- confidence intervals
- rejection regions

### two-sided discrepancies of interest

when two-sided discrepancies are of interest we are asking: for a given $\mu_0$, is the absolute value $|\bar{x} - \mu_0|$ large, compared to the standard error $s/\sqrt(n)$

in a t-test apporach, we reject the null if the absolute difference is larger than some constant $c$ times the standard error.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/ara.png" width="auto" height="auto">
</p>

with the confidence interval approach, the set of plausible values (that is, the values we should receive to NOT reject the null) is equal to our estimated mean plus/minus the same constant $c$ times our standard error.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/cia.png" width="auto" height="auto">
</p>

### choosing a constant c

for testing: control the false alarm rate
for confidence intervals: control the coverage probability

the coverage probability is known as the confidence level and is a percentage. like a 95% confidence interval.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/gt.png" width="auto" height="auto">
</p>

when we're talking about 95% confidence intervals, we're talking about 95% of the time, our interval contains the true mean.

### false alarm rate

this is when we reject incorrectly (type I error). we reject a given value $\mu_0$ when we shouldn't.

this is called the significance level, and we try to keep it small, like 0.05 or 0.01.

we want to pick a constant $c$, such that:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/al.png" width="auto" height="auto">
</p>

this means that having the difference between the mean and the hypothesised parameter being larger than something times the standard error - meaning we'd reject the null.

### using the t-distribution

basically we know the form of the t-distribution, and we can use this in our alpha formula to find what the best value of $c$ would be.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/tds.png" width="auto" height="auto">
</p>

### finding quantiles in R

in R, we can get quantiles using a range of functions:
`qt(p, df = k)`, `qnorm(p)`, `qchisq(p, df = k)` for t, normal, and chisquared distributions.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/qd.png" width="auto" height="auto">
</p>

heres a cool little drawing explaining something

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/alp.png" width="auto" height="auto">
</p>

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/qt.png" width="auto" height="auto">
</p>

looking at our beer example:

- mean was 374.87
- standard error was 0.12
- actual discrepancy (xbar - hypothesised mean) was 0.13
  - now this is only slightly more than 1 (estimated standard error). we'd need it to be at least 2.57 standard errors to reject it at the 5% signficance level.

### coverage probability

for a confidence interval, the coverage probability is the probability that the true value of the unknown parameter "lies inside" (is covered by) the confidence interval.

we choose a (small) non-coverage probability $\alpha$, like 0.05 or 0.01, then the coverage probability is $1-\alpha$.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/10.png" width="auto" height="auto">
</p>

### using t.test()

we can use the default function:

```r
t.test(x, mu = 375)
```

or we can specify the conf level:

```r
t.test(x, mu = 375, conf.level = 0.99)
```

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/tes.png" width="auto" height="auto">
</p>

### one-sided discrepancies of interest

for the t-test apporach, we declare, for some suitable value of $c$, that

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/wut.png" width="auto" height="auto">
</p>

the discrepancy (sample mean minus pop. mean) is less than some threshold, or the sample mean is less than the population mean minus some constant multipled by the standard error.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/fal.png" width="auto" height="auto">
</p>

### observed significance level: the p-value

the observed signficance level, or p-value is the value of $\alpha$ for which the observed data is right on the edge. that is, the smallest false alarm rate for which we would "reject" a given hypothesised value, and the non-coverage probability, (1 - confidence level) for which the hypothesised value is on the boundary of the confidence interval

## rejection regions

### rejection rules

to test a hypothesis, we previously defined a decision rule to reject the null.

when the p-value is less than certain fixed preassigned levels, say p-value $ \le \alpha$ where $\alpha = 0.05, 0.10$ etc

we reject or do not reject null according to whether the p-value is less than $\alpha$ or greater than $\alpha$.

alpha is the significance level of the test, which is the boundary between rejecting and not rejecting the null.

formal notation:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/cv.png" width="auto" height="auto">
</p>

if we are testing if the actual mean is greater than the hypothesised mean:

- reject null is statistic is bigger than some quantile from a t distribution with n-1 degrees of freedom, or if or t-stat is bigger than abs value of the lower quantile.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/dec.png" width="auto" height="auto">
</p>

### rejection region for test statistics

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/rrt.png" width="auto" height="auto">
</p>
