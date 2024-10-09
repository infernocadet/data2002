# anova contrasts

remember that the treatment degrees of freedom is g-1 where g is the number of groups, and the residual df is n-g where n is the total sample size

total degrees of freedom is treatment + residual or N - 1.

## contrasts

in our anova model, each observation can be rewritten as

$Y_{ij} = \mu_i + \epsilon_{ij}$

where that is the error term and follows a normal distribution.

a contrast is a linear combination where the coefficients add to zero.

in an anova context, a contrast is a linear combination of means.

we make the distinction between two kinds of contrast:

- population contrasts: contrasts involving the population group means (the $\mu_i$)
- sample contrasts: contrasts involving the sample group means

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/cort.png" width="auto" height="auto">
</p>

we can see population contrast has coefficients which add to zero: 1 - 1.

### distribution of sample contrasts

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/sl.png" width="auto" height="auto">
</p>

basically saying

- there are g groups, so there should be g contrasts.
- a sample contrast is the contrast for each group multipled by the group mean
- the sample contrast follows a normal distribution with the mean in the slide and the variance in the slide.

### behaviour of contrasts under the null hypothesis

when the anova null hypothesis is true, i.e. all means are the same,

- all the population contrasts are zero and the expected random sample contrasts are also zero

so the anova test really tells us that all population contrasts are zero. so it might be too strong, especially if we just want to look at individual contrasts.

suppose we want to test some special contrast

holey moley wtf is going on here

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/uh.png" width="auto" height="auto">
</p>

this is cooked. please refer to lv07.

### confidence intervals

just look at this slide man

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/zz.png" width="auto" height="auto">
</p>

for observed sample means y to yg, a 95% confidence interval for the true population contrast is given by observed means and contrast coefficients, t star from t distribution with N-g degrees of freedom, and use sigma hat from the anova table with the square root of the residual mean square

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/va.png" width="auto" height="auto">
</p>
