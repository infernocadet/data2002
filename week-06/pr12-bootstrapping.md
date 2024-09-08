# bootstrapping

permutation tests destroy the structure of our dataset and resampling assuming the null is true to get the test statistic.

with bootstrapping we resample our data with replacement to get a better understanding of the distribution of the sample mean or whatever parameter.

## speed of light

this guy measured the time it took for light to travel from his lab to a mirror and back which was 7400 meters. he did this 66 times to estimate the speed of light. look at slide 6 of lecture slide

## confidence intervals

an estimation is where a population parameter is unknown. we use sample statistics to generate estimates of the population parameter.

hypothesis testing is where there is an explicit statement regarding the population parameter. test statistics are generated which will either support or reject the null.

confidence intervals bring the two together. we should avoid reporting just a point estimate for a sample, by always including a measure of variability, the point estimate +- a margin of error.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/ca.png" width="auto" height="auto">
</p>

we find an interval estimate, and we have a lower and upper bound which we believe at different confidence levels should contain the true population parameter.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/dpp.png" width="auto" height="auto">
</p>

suppose we have a 95% confidence interval for the mean mu is (a, b).

this does not mean that 95% of the means mu are in (a, b) - like P(a < u < b) since u is a fixed parameter.

it also does not mean P(a < Xbar < b) = 0.95 where Xbar is the sample mean since the CI is for the true mean.

it does mean that if we draw a large number of random samples and compute a 95% CI, 95% of these CIs will contain mu.

it can be described as a range of plausible vlaues for the population parameter.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/sumtest.png" width="auto" height="auto">
</p>
