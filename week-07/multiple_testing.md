# multiple testing

## microRNA and Alzheimers

evidence that microRNA behaviour in the brain is associated with Alzhiemers disease.

okay so basically the context is, we are testing to see if the behaviour of microRNAs in the brain is associated with the presence or absence of Alzheimers in the subject.

there are a bunch of different RNAs, so we conduct t tests for each of them, 301 t tests. or something

then we distributed those t stat values that we observed. out of 301, 49 were statistically significant, meaning 49 reported an observed value of less than 0.05.

now if we made the null such that the distribution of t-stats would follow a uniform distribution (that is, there is no association) then just by chance, we would get 15 observed values which are considered statistically signficiant, just by chance.

## types of errors

suppose we are testing a hypothesis that a paremeters $\theta$ is 0 vs H1 that it is not 0.

a Type I error or false positive is when we conclude that $\theta$ does not equal 0 when it does (rejecting the null when we shouldnt)

a type II error or false negative is when we conclude that $\theta$ does equal 0 when it doesnt (not rejecting the null when we should've)

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/tyy.png" width="auto" height="auto">
</p>

### error rates

the false positive rate is the rate at which null results (theta = 0) are signficant.

the family wise error rate is the probability of at least one false positive

the false discovery rate is the rate which claims of significance are false. this is just the number of false positives (type I errors) out of all the times we reject the null

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/rate.png" width="auto" height="auto">
</p>

### family-wise error rate

FWER: the probability of at least one false positive.

let T1, ... Tm be m test statistics for null hypothesis H0,.., H0m

the FWER is the probability of falsely rejectign oen or more H0i.

if the null hypothesis is always true by we conduct m tests each at significance level $\alpha$ then,

- the probability of at least one false positive is
  $ 1 - (1 - \alpha)^m$

so the larger the number of tests, the higher the chance.

### bonferroni correction

to control for this family wise error rate we use this.

given the number of false positives for m tests is $m\alpha$ then consider defining a new threshold for signifance

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/bon.png" width="auto" height="auto">
</p>

- suppose we do m tests
- we want to control FWER at level alpha so that P(V>=1) <= alpha
- we calculate our p values normally
- then we adjust our alpha, and take p values less than a star

### false discovery rate

aim is to keep the expected proportion of false positives in rejected tests close to alpha

remember false discovery is the proportion of nulls we reject when we weren't meant to reject them out of all the nulls we reject

let R be the total number of H0i rejected (nulls rejected) and V be the number of H01 falsely rejected

FDR = E(V/R)

#### controlling the false discovery rate

- suppose we do m tests and want to control FDR at level alpha
- calculate p values normally
- order them from smallest to largest
- find j\* = max j such that .. just look at the photo bruh

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/fdr.png" width="auto" height="auto">
</p>

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/bcip.png" width="auto" height="auto">
</p>

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/gg.png" width="auto" height="auto">
</p>

but it is actually so easy in r, just use p.adjust.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/wow.png" width="auto" height="auto">
</p>
