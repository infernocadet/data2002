# chi square tests

_plus, hypothesis testing revision_

## hypothesis testing

the statement against which we search for evidence is the **null hypothesis.**. it is denoted by $H_{0}$. it is generally a "no difference" statement.

the statement we claim is called the alternative hypothesis, denoted by $H_{1}$. we basically want to prove this.

### assumptions

observations are generally assumed ot have been chosen at random from population, so they are **iid (independent and identically distributed)**.

### test statistic

since observations vary from sample to sample, we can't really know if $H_{0}$ is true or not.

a test statistic is a function of the observations, $T = f(X_{1}, X_{2}, ..., X_{n})$ such that the distribution of $T$ is known, assuming $H_{0}$ is true. it can be used to test if the data is consistent with $H_{0}$.

so basically we calculate a statistic, under the assumption that the null hypothesis is true, based on our given data. then we have to see if this lines up with our data to test the strength of the evidence against the null hypothesis.

the **observed test statistic**, $t_{0}$ is where we plug our observed data into the formula for the test statistic.

large test statistic values is taken as evidence of poor agreement with the null hypothesis.

### significance

the **p-value** is defined as the probability of getting a test statistic, $T$, **_as or more extreme_** than the value we observed, $t_{0}$, assuming $H_{0}$ is true. its saying, how likely is it that we would get a test statistic as extreme as this, if the null hypothesis was true.

we reject the null hypothesis if the p-value is small, and not reject it if the p-value is large. a large p-value doesn't necessarily mean we accept the null hypothesis - more so we don't have any evidence against the null hypothesis.

### decision

an observed large positive or negative test statistic, and hence a small p-value is taken as evidence of poor argeement with the null hypothesis.

if the p-value is small, then either the null hypothesis is true and the poor agreement is due to an unlikely event, or the null hypothesis is false. the smaller the p-value, the stronger the evidence against the null hypothesis.

a large p-value does not mean there is evidence the null hypothesis is true.

the **level of significance**, $\alpha$, is the strength of evidence needed to reject the null hypothesis. it is often 0.05.

## test statistic calculated

lets say we are expecting 100 of the _AB, aB, Ab, & ab_ species each. if we get results which slightly differ, we can take the average of the difference. e.g. if AB have 84, the difference is -16, if ab had 123, the difference is 23. and so we could take the average. however negative and positive differences would cancel each other out. so we take the **squared difference**.

we square the difference, and _normalise_ it by dividing by the expected cell counts.

$$\sum_{i=1}^{k}\frac{(y_{i}-e_{i})^{2}}{e_{i}}$$

where $k$ is the number of categories / groups.

we can easily do this in rstudio using math.

## simulate

to see if a test statistic is consistent with the null hypothesis, we want to see the distribution of the test statistic, if the null was true.

we can run a simulation in r, fixing a sample size, assuming the null hypothesis was true.

```r
n = 400
phenotype = c("AB", "Ab", "aB", "ab")
no_link_p = c(1, 1, 1, 1)/4
e = n * no_link_p
set.seed(1)
sim1 = sample(
  x = phenotype,
  size = n,
  replace = TRUE,
  prob = no_link_p
)
```

if we calculated the test statistic ((y-e)^2 / e), it may be smaller or larger than our first data set. however it is important to run these tests multiple times.

```r
B = 3000
sim_t_stats = vector(mode = "numeric", length = B)
for (i in 1:B) {
  sim = sample(x = phenotype, size = n, replace = TRUE, prob = no_link_p)
  sim_y = table(sim)
  sim_t_stats[i] = sum((sim_y - e)^2/e)
}
hist(sim_t_stats, main = "", breaks = 20)
```

now we can visualise the distribution of the test statistic, if the null hypothesis was true. we can compare the test statistic we calculated to the **null distribution**.

> [!TIP]
> Given that the null hypothesis is true, how likely is it that we observe a test statistic as or more extreme than that we calculated from our original sample?

we can calculate that in r:

```r
sum(sim_t_stats >= t0)/B
# or, we can use mean(sim_t_stats >= t0)
```

if this gave us 0.001, this means that 0.1% of samples when the null hypothesis is true, was more extreme than our original sample. what does this tell us about the agreement between the null hypothesis and our sample of data?

## chi squared

there is a way to look at the distribution of the test statistic without having to run simulations. we can use a $\chi^{2}$ test.

in this example, the test statistic:

$$T=\sum_{i=1}^{k}\frac{(y_{i}-e_{i})^{2}}{e_{i}}~\chi^{2}_{k-1}$$

where $k$ is the number of groups, referred to as **degrees of freedom**.

we can add in our curve on top of the histogram we already have:

```r
curve(dchisq(x, df = 3), add= TRUE,
  col = "blue", lwd = 2)
```

here, we have 3 degrees of freedom, because we had four groups (phenotypes) and we subtract one.

## $\chi^{2}$ test degrees of freedom

in general, the test statistic takes the form:

$$T=\sum_{i=1}^{k}\frac{(y_{i}-e_{i})^{2}}{e_{i}}~\chi^{2}_{k-1-q} \text{  (approximately)}$$

where, $q$ is the number of parameters that need to be estimated from the sample.
