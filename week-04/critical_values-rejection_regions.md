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

$$SE=\frac{\sigma}{sqrt(n)}$$

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
