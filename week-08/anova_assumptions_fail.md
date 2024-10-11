# what to do when anova assumptions fail

we have learnt a bunch of stuff already

- the F-test (with p-value computed using the F-distribution)
- contrasts based on the t-distribution
- comparisons:
  - bonferroni
  - tukey
  - scheffe

however, there are underlying assumptions:

- each sample comes from a normal population
- all population variances are equal
  - meaning all populations are identical up to possible location shifts

this can be violated in a couple of ways

- normality might be ok, but equal variances might not be
- normality might not be ok, but identical up to location shifts assumptions might be ok

we can use

- simulation
- resampling (with conditioning)

## relaxing equal variance assumption

motivating example: wolf river data - concentration of chemicals at different depths

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/d2.png" width="auto" height="auto">
</p>
<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/d1.png" width="auto" height="auto">
</p>

we just clean up the columns of the dataset, and then we use pivot longer to actually make a column which has the different types of chemicals and concentration to make a dataframe.

we can kind of see that the equal variance assumption is not meant.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/nor1.png" width="auto" height="auto">
</p>

in terms of normality this is ok.

we can use a welch t test when we can't assume equal variance. we can also apply a bonferroni correction.

welch tests only assume that each sample is normal. R defaults to Welch using `t.test()`

we can then conduct our pairwise differences using the welch t test (unadjusted with bonferroni)

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/wtu.png" width="auto" height="auto">
</p>

to do a bonferroni correction, we multiply by the number of pairwise comparisons with the smallest of the p-values as a valid p-value for testing the global/overall hypothesis that all means are equal.

or we could use `pairwise.t.test()`

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/air.png" width="auto" height="auto">
</p>

### simultaneous confidence intervals

please refer to slide 17 on the pr16 lecture.

## relaxing on the normality assumption

we can relax the assumption and say that the samples come from the same distribution, albeit not guaranteed to be a normal one.

### conditioning

we combine all the groups into one combined sample (throwing away the labels) meaning that the remaining data will tell us nothing about the differences between groups. therefore it becomes an ancillary statistic. under the null hypothesis of "no differences between groups", all possible allocations are equally likely.

slide 30 of the pr16 lecture shows the method to permute the data

### using ranks

we pool all data, rank the pooled samples, and do an f test on the ranks. - can

a p-value can be obtained using:

- a permutation test approach
- a large-sample chi-squared approximation can be used

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/rug.png" width="auto" height="auto">
</p>

now we've got the ranks of all of these games, and we will use anova to check if the means are the same
