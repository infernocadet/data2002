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
