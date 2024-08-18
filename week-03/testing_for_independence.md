# testing for independence

want to see independence between two categorical variables. we are sampling from one population and asking multiple questions. in a test of homgeneity, we are sampling from different populations and asking the same questions.

## test for independence using 2x2 contingency table

usaing the Titanic dataset, we see a lot of info about passengers, we want to see any evidence of gender bias in survival rates?

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/tit.png" width="auto" height="auto">
</p>

we want to think about the proportions of males and females who survived.

there are times where a sample from a population may be categorised according among two categorical variables. each categorical variable has various levels (factors). we want to see if these variables are independent.

the two variables are **survival status** and **gender**.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/uy.png" width="auto" height="auto">
</p>

## independence

from a statistical point, independence is when P(a | b) = P(a).

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/ind.png" width="auto" height="auto">
</p>

### table of proportions

the sum of all the probabilites in our contigency table is actually 1, as opposed to our homogeneity table, which is the total number of entries.

so here, X can be the random variable representing survival status and y can be representing sex. under independence:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/ye.png" width="auto" height="auto">
</p>

### test statistic

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/top.png" width="auto" height="auto">
</p>

here, n is the sample size.

in pratice, we dont actually know those row and column probabilities, they are unknown parameters. we can estimate the probability values using out data, we take the row and column sums and divide by sample size.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/est.png" width="auto" height="auto">
</p>

### workflow

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/ber.png" width="auto" height="auto">
</p>

manipulating our data in R:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/rty.png" width="auto" height="auto">
</p>

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/rt.png" width="auto" height="auto">
</p>

our t stat is huge, and our p value is small

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/res.png" width="auto" height="auto">
</p>

note we restricted our sample to only look at adults and those in third class - to eliminate considering children or socioeconomic class in the results.

## general 2-way contingency tables

we can look at $r x c$ tables with classifying factors $R$ and $r$ levels and $S$ at $c$ levels. the $\bullet$ notation denotes summation over a particular index.

- $y_{i{\bullet}}$ is the sum of the ith row
- $y_{\bullet j}$ is the sum of the jth row

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/cont.png" width="auto" height="auto">
</p>

### estimating $p_ij$ under independence

if we have a completely random sample of size $n$ classified by two categorical variables $R$ and $S$, we want to test if they're independent.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/hypo.png" width="auto" height="auto">
</p>

e.g. lets say X represents opinion and Y represents income. the probability of X being negative, and Y being high income, under the independence hypothesis, should just be:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/inc.png" width="auto" height="auto">
</p>

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/inra.png" width="auto" height="auto">
</p>
