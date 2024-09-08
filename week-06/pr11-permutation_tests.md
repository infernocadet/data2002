# permutation tests

about the lady who tasted 8 cups of tea to see if she knew if it was milk first or tea first.

## permutations

we look at all 40320 different permutations of the cups of tea.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/per.png" width="auto" height="auto">
</p>

so instead what we can do is also apply it to a vector, and then check if theyre identical

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/per1.png" width="auto" height="auto">
</p>

so we could do that across all permutations, iterating through all the rows. we would get the same value that we would get with Fisher's exact test. this is infeasible, we can sample a selection of them.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/per2.png" width="auto" height="auto">
</p>

we sample under the null hypothesis that the person can't tell the difference. this also gives us a 0.0146 p-value, which is very close.

## two independent samples

looking at plant growth. an experiment compared yields under a control and two different treatment conditions.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/pg.png" width="auto" height="auto">
</p>

we check for normality using a qqplot. check slide 16 of this lecture for results.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/per3.png" width="auto" height="auto">
</p>

our standard results give slightly different results, but same approach.

### permutation test

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/gartj.png" width="auto" height="auto">
</p>

basically what this code is doing is that we are making a copy of the data, and then we are reshuffling the groups - the sample just reshuffles the groups around to enforce the null hypothesis (that there is not difference between the control and the treatment). then we perform the t test on that shuffled one.

check this website for more its really good [jwilber.me/permutationtest/](jwilber.me/permutationtest/)

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/perm.png" width="auto" height="auto">
</p>

we would get a normal looking distribution for the statistics but we want to look at the absolute value of the test statistic because were just looking at the actual difference not really a greater than or lower than or anything so we'll turn everything absolute and then get the test statistic

the two sample t test and permutation test give similar p-values but this may not always be the case. the two-sample t test is a parametric test where the test statistic is assumed to follow a distribution (t-distribution with some degrees of freedom). the permutation test considers the (n1 + n2)! permutations of the labels (or a random subset to save time) from a single instance of data.

it assume that all the Xn and Yn observations are exchangeable under H0, meaning swapping the labels on the observations keeps the data just as likely as the original. it can use the t-test test statistic but not the t-distribution.

### outliers - and then wilcoxon rank-sum

basically if there was an outlier, using a two sample t test (using welch's if equal variance is not assumed) then itll mess up welchs, but the wilcoxon rank sum will still reject the null (its more robust against outliers since it ignores magnitudes.) so we can make a permutation test using the wilcoxon rank-sum statistic

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/werm.png" width="auto" height="auto">
</p>

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/derm.png" width="auto" height="auto">
</p>

## paired sample tests

can we use permutation tests if we are testing for a shift in location by sampling from one population?

for paired tests we think about differences. in the wilcoxon signed-rank test, we had a test statistic involving the sum of the ranks multipled by its sign (-1 or +1) - we could also think of a statistic where we used the values of the differnces and multiplied by its sign. so we'll permute all possible signs for the differences.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/si.png" width="auto" height="auto">
</p>

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/king.png" width="auto" height="auto">
</p>

looking at the smoking data again, we get the differences and run a t test which gives us a small value, but there are like 2^11 ways to permute all of these values

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/ski.png" width="auto" height="auto">
</p>

theres only like 2000 permutations so we can test this exhaustively

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/cki.png" width="auto" height="auto">
</p>
