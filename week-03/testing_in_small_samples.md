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
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/test.png" width="auto" height="auto">
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
