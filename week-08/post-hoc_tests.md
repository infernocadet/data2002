# post hocs

## critical flicker frequency

case study: light is flickering very fast - looks like not flickering. there is some sort of frequency which is the line between detectable and not detectable.

looked at critical flicker frequency and iris colour for 19 people.

first visualise the data - side by side box plot and a qq plot

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/gph.png" width="auto" height="auto">
</p>

means do look quite different, but variance/spread looks similar.

however we can be more accurate using the residuals.

## residuals

remember our anova model looks like this

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/is.png" width="auto" height="auto">
</p>

where Yij is the random variable representing our outcome, mu (i) is the mean of that group, and there is some error term regarding that specific observation.

i runs from 1 to g where g is the number of groups, and j runs from 1 to n where n is the number of observatiosn in that group.

also, Eij is a random variable which follows a normal distribution centred at 0 with variance sigma^2.

the observed values just has a smaller y.

the observed group mean, which is shown as yi. (dot).

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/ggg.png" width="auto" height="auto">
</p>

this also means that r(ij) = y(ij) - y_bar(idot)

## checking for normality with residuals

so the population model is:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/pm.png" width="auto" height="auto">
</p>

so rather than looking at a qq plot we can consider the anova residuals (r = yij - y_bar(idot))

if the anova assumptions hold true, then the residauls should be normally distributed.

so thats why we can pool the residuals, becuase we've sort of normalised the values of yij, because we've subtracted off their mean. so we're only looking at the variances of each observation compared to their groups mean. and that is why we have our big graph of all the residuals of all groups. so now they are all comparable under the assumption of equal variance across all of the populations.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/fa.png" width="auto" height="auto">
</p>

## gathering summary statistics

if we actually wanted to look at the group means, we'll take our dataframe, group them by category

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/smt.png" width="auto" height="auto">
</p>

the pull takes out each column and makes it their own vector.

if we actually look at the anova results:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/e.png" width="auto" height="auto">
</p>

the p value is less than 0.05 meaning we reject the anova null hypothesis. to check which mean is different - we have to consider all contrasts of interest.

## we look at pairwise contrasts

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/pco.png" width="auto" height="auto">
</p>

depending on the contrast coefficients, we are looking at the differences between certain pairs of means

### all pairwise differences

standard approach - when no single group is special or notable, meaning that each pairwise difference is equally interesting, consider each pairwise difference as a contrast of interest.

in this case:

- a t-statistic can be constructed for each pairwise difference
- a t-based confidence interval can be constructred for each pairwise population difference

### individual 95% confidence intervals

we want to now construct a 95% confidence interval for each pairwise comparison individually.

we need:

- ciritical value (remember this comes from a t-distribution, so like 1.96 etc)
- estimated difference
- standard error

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/plm.png" width="auto" height="auto">
</p>

so the left is the difference of the means of two groups, i and h, we plus/minus a critical value which is a number that comes from a t distribution `(with N-g degrees of freedom)` based on your confidence interval, and a standard error - where sigma hat is the square root of the residual means squared.

to get our t_star in r, we use:

```r
t_star = qt(.975, df = sum(n_i - 1))
```

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/dgh.png" width="auto" height="auto">
</p>

the only confidence level that is signficiant (that is, it doesn't include 0) is blue vs brown.

### `emmeans` package

easier way to do this using the `emmeans` package:

```r
install.packages("emmeans")
library(emmeans)
flicker_anova = aov(Flicker ~ Colour, data = flicker)
flicker_em = emmeans(flicker_anova, ~ Colour)
confint(flicker_em, adjust = "none")
```

then to do the pairwise contrasts with a confidence interval:

```r
contrast(flicker_em, method = "pairwise", adjust = "none) |> confint()
```

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/emm.png" width="auto" height="auto">
</p>

can also chuck these into plot:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/b.png" width="auto" height="auto">
</p>

### bonferroni correction

when doing a bonferroni correction, we take our original signficance level and divide by the number of tests being performed.

essentially we make the bounds wider, to account for the family wise error rate. so lets say our alpha/2 was 0.025 (for a 95% rate), then we'd also need to divide that by the number of pairwise contrasts - if it were three, then we'd need to find the t_star value at alpha/6.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/cd.png" width="auto" height="auto">
</p>

very easy to do with the emmeans package, before it was `adjust = "none"`, now it is `adjust = "bonferroni"`

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/dc.png" width="auto" height="auto">
</p>

we have adjusted for multiplicity, but the Blue-Brown difference is still significant. by increasing the confidence level of each individual comparison, we can make simultaneous valid statements about them all.

## pairwise t-test

a general t test for a contrast takes the form in the slide

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/ptt.png" width="auto" height="auto">
</p>

so the observed test statistic is the estimated contrast in the numerator, square root of the residual means square and the rest in that denominator bruh

you can see blue vs brown we have small p-value meaning we reject the null that the means are the same.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/x.png" width="auto" height="auto">
</p>

of course we can still use emmeans.

## tukeys method

bonferroni might be too conservative - tukey got the exact multiplier needed for simultaneous confidence intervals for all pairwise comparisons when the sample sizes are equal.

good for when you have the same number of observations from each population and youre just conducting one way anova.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/ee.png" width="auto" height="auto">
</p>

## scheffes method

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/sche.png" width="auto" height="auto">
</p>
