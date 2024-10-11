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
