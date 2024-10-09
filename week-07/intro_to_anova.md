# intro to anova

means analysis of variance.

## two sample t tests

there are at least 3 different procedures which might be referred to as two sample t test:

- paired (two sample) t-test
- the welch test (unequal variances two-independent sample t-test)
- the classical or pooled two-(independent)- sample (equal variances) t-test

they take the same generic form, the only difference is how the standard error is computed.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/gpp.png" width="auto" height="auto">
</p>

please refer back to pr14 for a revision on the different types of t tests.

the assumption of equal variane is crucial for the validity of the classical test. if the populaiton variances are different and if the sample sizes are very different, strange things happen.

of the 3 different t tests, the classical is the one that requires the most assumptions

## general anova decomposition

1. Hypothesis: H0: all means are the same - H1: at least one is different
2. Assumptions: observations are independent within each of the samples. each of the populations have the same variance. each of the populations are normally distributed (or sample sizes are large enough such that you can rely on CLT)
3. Test statistic: T = treatment_mean_sq / residual_mean_sq which follows an F-distributon with degrees of freedom
4. just read the screenshot bruh

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/ov.png" width="auto" height="auto">
</p>

### the normal model

we model y_ij as the value taken by a random variable.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/vo.png" width="auto" height="auto">
</p>

we use dot notation:

- replacing either or both subscripts (i or j) with a dot means adding over the total number of those subscripts
- replacing either or both subscripts with a dot and writing a bar over the letter means averaging over those subscripts.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/dn.png" width="auto" height="auto">
</p>

something about residual sum of squares and treatment sum of square.

anova is a ratio of two variances. if the null hypothesis is true and the means are the same then a good estimate for variance is the combined sample variance.

if not then we use the residual mean square

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/RMS.png" width="auto" height="auto">
</p>

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/f.png" width="auto" height="auto">
</p>
