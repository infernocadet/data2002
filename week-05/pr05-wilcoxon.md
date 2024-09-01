# wilcoxon signed-rank test

when we can assume normality, then the t test is the best. the sign test is robust, but it threw away information about the magnitudes of the differences in the test.

suppose the sample X1, X2 ... are drawn from a population symmetric with respect to mean $\mu$ or median.

we test the hypotheses: H0: mu is some proposed value, and H1: pop. mu is not this value.

the t-test and Z-test assume a normal distribution without a long tail (outliers).

## ranks

to find the ranks for a set of data:

- arrange the data in ascending order
- assign a rank of 1 to smallest observation, 2 to second smallest etc
- for tied obs, assign each the average of the corresponding ranks

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/rn.png" width="auto" height="auto">
</p>

under the null, half of the differences should be negative and half positive,l and they should be of equal magnitude and occur with equal probability on average.

if we rank the absolute values of $d_i$ in ascending order, the expected rank sums for the negative and positive d should be nearly equal.

## wilcoxon signed-rank test

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/ww.png" width="auto" height="auto">
</p>

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/an.png" width="auto" height="auto">
</p>

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/ann.png" width="auto" height="auto">
</p>

### calculation of p-value

after we get all the differences and calculate the observed sum of the positive ranks, we get our exact p-value, which would be the probability of our hypothesised distribution having a rank sum of more than our observed rank, $w^+$, which is on this slide:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/wwww.png" width="auto" height="auto">
</p>

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/clp.png" width="auto" height="auto">
</p>

theres a good example on the slides about how to do it manually in r.

ofcourse, we can do it in R:

```r
wiclox.test(d, alternative = "greater")
```

where d is a vector containing the differences

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/ad.png" width="auto" height="auto">
</p>

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/it.png" width="auto" height="auto">
</p>

if we were comfortable with the normality of the samples, we can use the paired t-test approach, if we weren't comfortable (e.g. low number of samples) then we can go for the wilcoxon signed rank test approach

## normal approximation to the wilcoxon test statistic

### normal approximation

for large enough n, we can use a normal distributions to approximate the distribution of the Wilcoxon sign rank test statistic.

a bunch of math:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/nap.png" width="auto" height="auto">
</p>

so we can standardise this into a normal dist with mean 0 and standard distribution 1.
