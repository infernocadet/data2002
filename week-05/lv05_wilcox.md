# wilcoxon rank-sum test

## revision

the power of a statistical test is the probability that the test correctly rejects the null hypothesis when the alternative is true.

power of a test is $1 - \beta$, where $\beta$ is the probability of making a Type II error. a type II error is wehn the test fails to reject the null even when it should've.

the power of a test indicates the likelihood of avoiding a false negative. a test with high power increases one's confidence in detecting true differences.

factors impacting power:

- larger sample sizes reduce standard error and variability, increasing power.
- signficance level: the probability threshold for rejecting the null. a higher signficance level (e.g. 0.05 vs 0.01) increases power, but raises the risk of a type I error (rejecting when you weren't meant to)

in a two tialed test, we are interested in detecting a difference in either direction. the significance level $\alpha$ is split between both tails of the distribution, e.g. with an alpha of 0.05, 0.025 is allocated to each tail. a two tailed test is less powerful than a one-tailed test for detecting an effect in a specific direction - as the test is more conservative, we would need a larger effect size (a more substantial deviation from the null) or sample size to have the same power.

for a one-tailed test, the significance level is concentrated in one tail, and hence is more powerful when the effect is in the predicted direction - greater chance of rejecting the null hypothesis.

## wilcoxon stuff

we can compare the locations between two samples. when referring to the Wilcoxon test, we compare the locations between two sample means to compare their central tendencies such as medians to determine if there is a signficant difference.

## wilcoxon rank-sum test

the test does not require the underlying data distributions of the two independent samples to be symmetric around their medians. a symmetric distribution is one where the left and right hand sides of the distribution are the mirror images, such as normal distribution. parametric tests like t and z test assume the data are normally distributed, implying symmetry.

a non-parametric test, like wilcoxon rank sum, doesn't need the data to follow a specific distribution like the normal.

the wilcoxon sign-rank test assumes symmetry, but the wilcoxon rank-sum test doesn't, although it assumes that the two distributions being compared have the same shape.

### location shift

lets say we have two samples from different populations and they have the same kind of distribution, but their means are different. this is a location shift:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/ls.png" width="auto" height="auto">
</p>

this test checks to see if theta is equal to 0.

the wilcoxon rank-sum test is used to determine whether there is a signficant difference between the two independent samples, in terms of their central tendency.

the data from both samples are combined and ranked together from smallest to largest and then rankled.

in the one-sample Wilcoxon signed-rank test, the ranks are calculated for the differences between the paired samples and then they are summed up, for **only the positive differences**.

for the two-sample Wilcoxon rank-sum test, the ranks are summed for one of the independent samples. the ranks for all values in sample X are summed to get W. (W = R1 + R2 + R3 + ... Rn). This is the test statistic.

the null hypothesis for this test states that there is no difference between the two samples' central tendencies (medians). if this is true then the sum of the ranks for one of the samples, like X should be close to its expected value.

if the observed sum of ranks W is much smaller or larger than the expected value, that is evidence against the null.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/p0.png" width="auto" height="auto">
</p>

### no ties: p-value calculation

we can do it in r:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/wrs.png" width="auto" height="auto">
</p>
