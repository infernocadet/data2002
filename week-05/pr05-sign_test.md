# sign test

## paired t-tests revision

motivating example:

- does biochemical substance have an inhibitive effect on muscular growth?

10 rats:

- one hind leg muscle was injected with the substance
- the other leg had a placebo
- 6 months and weighed the muscles in grams

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/h.png" width="auto" height="auto">
</p>

in r:

- make a dataframe, col 1 is the substance measures, col 2 is the placebo
- use mutate to add a column where we have the difference between placebo and substance
- then we extract the mean of the difference and the stadnard deviation
- we then run a one sample t-test with alternative being "greater" as we want to show if the substance has a inhibitive effect (makes muscles smaller, or if placebo is bigger)

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/hh.png" width="auto" height="auto">
</p>

formally:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/hhh.png" width="auto" height="auto">
</p>

if we wanted to look at the critical value to which we would compare our t-statistic, proposing that the distribution follows a t-distribution, we would look to see the value of t on a t-distribution where the area under the curve to its left would be equal to 0.95. here, this would b 1.833, and our test statistic was larger than that.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/hhhh.png" width="auto" height="auto">
</p>

in terms of the rejection region, we can map back to the original scale and write the rejection region in terms of the sample mean. we take our observed mean and multiple it by c \* standard error, where c is the critical value

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/j.png" width="auto" height="auto">
</p>

here, this means we would reject the null if the difference was greater than 0.19 grams (this is enough to be signficant at the 5% level.)

in terms of a confidence interval - confidence interval refers to the range of plausible values that the proposed population parameter would be in, to NOT reject the null.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/aa.png" width="auto" height="auto">
</p>

so here, we got our one-sided confidence interval to be (0.06, $\inf$). now because our null hypothesised population mean difference is 0, it is not inside of this range. so we reject null.

## checking for normality

one of our assumptions when conducting our t-tests is that the samples are normally distributed / data is sampled from a normal population. if we have a large enough sample size, then the normality assumption is not as important as we rely on the central limit theorem to ensure our test statistic at least approximately follows a t-distribution.

however, in small samples, it might be difficult to tell whether or not our sample comes for a normal population.

we check this normality assumption using:

- Q-Q plots (visually assessing normality) - plotting actual data against what the data would look like under a normal distribution
- Box plots (looking for symmetry) - and also histograms, but just looking for symmetry

### checking for normality: box plots

we want to check if our median (the line in the middle) is in the middle (roughly) between the second and third quartile. also check if the whiskers are roughly the same length.

### checking for normality: qq plots

we are looking for **points that lie reasonably close to the line**.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/qq.png" width="auto" height="auto">
</p>

are the theoretical quantiles in line with the observed sample

## sign test

lets say we have a sample X1,...Xn and this is IID with mean $\mu$. we want to test H0 that the population mean is actually equal to some proposed value, $\mu_0$. if the distribution is symmetric about $\mu_0$, then Di = Xi - $\mu_0$ should be scattered around 0. probability of getting a positive difference should be 0.5.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/plpl.png" width="auto" height="auto">
</p>

### sign test for paired data

paired data are very common. e.g. before/after trials, studies on twins, left/right arm etc.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/dfo.png" width="auto" height="auto">
</p>

we want to see if there is a difference between the distributions of the X and Y populations. if we can safely assume that the differences are normally distributed, we can use a paired t-test, to test if the population mean difference equals zero, H0: mu(d) = 0.

if we don't feel comfortable making the normality assumption, we can analyse differences using the sign test.

we count the sign of the differences (-, +) and ignore their magnitude, meaning it is a test of proportions, based on the prop. of positive differences.

the null hypothesis corresponds to no difference between the two populations meaning $H_0: p_+ = 1/2$. under the null, the symmetry assumption of the sign test is guaranteed, so we need to assume differences are independent.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/stop.png" width="auto" height="auto">
</p>

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/ar.png" width="auto" height="auto">
</p>
