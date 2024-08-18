# testing in small samples

## fishers exact test

the context is: given a cup of tea with milk, a lady claims she can discriminate as to whether milk or tea was first added to the cup.

a guy named fisher made 8 cups of tea, 4 where tea was added before and 4 where tea was added after.

the lady had to identify the 4 where tea was added before milk.

we needed to record:

- which cups had tea or milk added first (**truth**)
- which cups the lady claimed had tea or milk added first (**predicted**)

we wanted to see if the predicted values were independent from the truth. i.e., were her guesses really related to the nature of the tea? or was it just lucky guessing?

we can do this in r, by making a matrix and feeding it into the `chisq.test` function:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/tea.png" width="auto" height="auto">
</p>

when we have less than 5 expected counts then we get a warning.

the $\chi^2$ approximation for the test statistic is only reasonable when $n$ is sufficiently large, meaning all expected cell frequencies are 5 or more. if this is not the case, we need to consider **exact** tests, which means calculating the exact p-value for the test statistic.

all we really need to assume is that we have **independent observations** (we condition on knowing the row and column totals).

in R, the function `fisher.test()` is available to carry out these calculations for two-way contigency tables.

## fishers exact test: formulating the null hypothesis

consider this table

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/sp.png" width="auto" height="auto">
</p>

for the 2x2 table, if we know the row and column totals and y11, then the table is completely specified.

let $\theta$ be the odds ratio. if A and B are independent then the odds ratio will equal 1.

Fisher's exact test can be thought of as testing the null hypothesis:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/fsh.png" width="auto" height="auto">
</p>

against the obvious alternative that it is not 1 (and they are not independent)

the test is based on the observed value of y11, given the marginal totals.

### aside: the hypergeometric distribution

the hypergeometric distribution relates to sampling without replacement from a finite population.

conditions:

- the result of each draw (the elements of the population being sampled) can be classified into one of two mutually exclusive categories
- the probability of a "success" changes on each draw, as each draw decreased the population (sampling without replacement from a finite population)

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/hypg.png" width="auto" height="auto">
</p>

if H0 is true and we know the y1 dot and y dot 1 and n values, we expected ydot1 time sy1dot/n in the (1,1)th cell.

to obtain the distribution of y11 given the marginal values, we note that this is like selecting ydot1 values from n where y1dot are type B1 and y2dot are type B2.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/geom.png" width="auto" height="auto">
</p>

to calculate the p-value for a particular table, we need to enumerate all tables, as extreme or more extreme than the observed table **with the same marginal totals**, and sum up the probability of each of these tables.

basically saying, if we manipulated that top left outcome, could we make a contigency table more extreme than what we observed.

for fisher's exact test we:

- consider all possible permutations of 2x2 contingency table with the same marginal totals
- calculate how many of these were equal to or more extreme than what we observed.

## what is more extreme?

we define a test statistic:

T = number of cups of tea before milk she got correct.

the test stat has 5 outcomes: {0, 1, 2, 3, 4}.

given there were 8 cups, there are $\binom{8}{4}$ = 70 ways we could predict which cups had tea added before milk. we can look at all 70 ways and calculate how often we see a test stat of 0, 1, 2, 3 or 4.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/bin.png" width="auto" height="auto">
</p>

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/lad.png" width="auto" height="auto">
</p>

we can see here that a `fisher.test()` function will automatically test to see if the odds ratio is not equal to one. this will look at both sides and hence the p-value would be different - it will look to see if the lady got all of them right or all of them wrong. we want to see if she got all of them right, and hence we have a setting for that as well.

## cancer of the larynx - fisher test

look at this study comparing radiation therapy with surgery in treating cancer of the larynx:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/lar.png" width="auto" height="auto">
</p>

we want to test that the odds ratio is 1, i.e. both treatments are equally effective, against odds ratio being more than 1, meaning that surgery is more effective (as surgery is top left)

we first need to enumerate all tables which are as extreme or more extreme than the observed table.

we want to see the tables where surgery controlled more than 21 cases i.e. 22 or 23 holding the **margins constant**. these tables are more **extreme in the positive direction**, meaning surgery does better in these tables.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/ex.png" width="auto" height="auto">
</p>

### calculating using hypergeometric dist.

let X be the number of surgery cases where cancer is more controlled.

p-value = P(X >= 21 | marginal totals)
= P(X = 21, 22, 23 | marginal totals)
etc etc

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/tot.png" width="auto" height="auto">
</p>

## some drawbacks

we don't use fishers exact test all the time because

- calculation of p-value requires conditioning on row and column margins being fixed
- computationally difficult for large samples
- can be generalised to r x c two-way contingency tables but hard to compute, requires use of monte carlo (random permutation)

## yates' chi-squared test

this is default in r.

basically just reduces the expected and actual differences by 0.5.

this is for a 2x2 table to make it more accurate when cell counts are small.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/tetss.png" width="auto" height="auto">
</p>

## permutation testing

looking at thtis case study of the fingerprint patterns between twins

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/ex.png" width="auto" height="auto">
</p>

we can extract what the expected values which were calculated by r were by using the dollar sign.

to get an understanding of what the test statistic looks like when the null hypothesis is true, we wouldn't be able to use fishers exact test because its not a 2x2, but we can run a monte carlo simulation:

- analyse the sample as one would normally do in a hypo test
- from the orgiinal sample being analysed, resample it lots of times
- the test stat of interest is calculated for each of the resamples, so we have the sampling distribution of the test statistic
- this leads to lots of test statistics that can be used to calculate p-values for our observed statistic.

monte-carlo p-values are calculated by determining the proportion of the resampled test statistics as or more xtreme than the observed test statistic. there are no assumptions made about the underlying distribution.

we want to simulate "fake data" that mimics the properites of our sample but ensures that the null hypothesis remains true? we have to keep our row and column totals fixed (just like fishers exact test), enforcing our simulated contigency tables to look like our og sample.

we use `r2dtable()` in R to generate a list of random 2-way tables given marginals.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/r2.png" width="auto" height="auto">
</p>

then for each of the 10000 randomly generated contingency tables, record their test statistic then determine what proportion of them are equal to or exceed the observed test statistic.

```r
rnd.chisq = numeric(B) # initialise empty vector
for (i in 1:B) { # loop over B iterations and each time, save the t stat
  rnd.chisq[i] = chisq.test(x_list[[i]])$statistic
}
# what prop of time did we observe a test stat as or more extreme than what we observed?
sum(rnd.chisq >= 11.1699) / B
```

this gives us the monte carlo p-value of 0.022

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/simu.png" width="auto" height="auto">
</p>

notice that the degrees of freedom are NA because the test statistic is not being compared against any theoretical distribution.
