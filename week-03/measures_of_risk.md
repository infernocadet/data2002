# measures of risk

## prospective study

also known as a cohort study - it is a study design where one or more samples (called cohorts) are followed prospectively and subsequent status evaluations with respect to a disease or outcome are conducted to determine which **initial** participants exposure characteristics (risk factors) are associated with it. as the study is conducted, an outcome from participants in each cohort and measured.

> [!IMPORTANT]
>
> - a **prospective study** is based on subjects who are initially identified as disease-free and classified by presence or absence of a _risk factor_.
> - a random sample from each group is followed in time (prospectively) until classified by a disease outcome

we take two random samples:

- one from the risk factor subpopulation $R^+$
- one from non-risk factor group $R^-$
- we then wait to see how many develop disease
- estimate $P(D^+|R^+)$ as well as $P(D^-|R^-)$
- we can't estimate $P(R^+|D^-)$ etc as we did not sample from the disease group.

## retrospective studies

also known as case control studies - a study design that compares patients who have a disease or outcome of interest (cases) with patients who do not have the disease or outcome (controls) and looks back retrospectively to compare how frequently the exposure to a risk factor is present in each group to determine the relationship between the risk factor and the disease.

> [!IMPORTANT]
>
> - a r**etrospective study** is based on random samples from each of the two outcome categories which are followed back to determine the presence or absence of the risk factor for each individual.

we take two random samples, opposite to the prospective study.

## estimating a population proportion

suppose:

- we have a large (but finite) population containing binary objects.
- it is desired to determine or at least estimate the overall prop. of type 1 but not feasible to examine every object.

we can take a random sample from population then use the same proportion of type 1 as an estimate of the population proportion.

consider events A and B.

- if we can take a random sample from the whole population, we can estimate $P(A)$ using the observed sample proportion with attribute $A$.
- if we can take a random sample from the subpopulation defined by $B$, we can estimate $P(A|B)$ using the observed sample proportion (of the subpopulation) with attribute $A$.

### application to prospective and retrospective studies

in both kinds of study we have:

- a population
- a subpopulation/attribute determined by a risk factor $R^{+}$ (with complimentary $R^-$)
- a subpopulation/attribute determined by having/developing the disease $D^+$

subpopulation and attribute both mean event. main difference between prospective and respective studies are which (sub)populations we can sample from.

## relative risk

there are different ways to measure the association between a risk factor/treatment and the disease outcome. how the data is **sampled** greatly impacts the ways in which these methods are applicable and interpretable. relative risk just means _"how much more likely are you"_

**relative risk** is defined as the ratio of two conditional probabilities:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/rr.png" width="350" height="auto">
</p>

this is the probability of

- having the disease **given exposure** to the risk factor, divided by
- having the disease **given no exposure** to the risk factor

as probabilities are bounded between 0 and 1, the relative risk ($RR$) goes to infinity as the probability of having the disease given no exposure is smaller to 0, and the other way around.

relative risk is approx. 1 when the conditional probabilities are the same.

> [!NOTE]
> if $`D`$ and $R$ are **independent**, then the probability of $P(D|R) = P(D)$, and hence $RR=1$.

the relative risk is the ratio of the probability of having the disease in the group with the risk factor opposed to the opposite.

- RR = 1 means no difference
- RR < 1 means disease is less likely to occur with the risk factor
- RR > 1 means disease is more likely to occur with the risk factor

because of this, we **cannot** calculate relative risk using **retrospective studies**.

## odds ratio

a common alternative to the relative risk is the odds ratio - $OR$.

if the probability of event $A$ is $P(A)$, the odds of event $A$ is defined as
$$O(A) = P(A)/(1-P(A))$$

in the risk/disease setting, the probability of disease for $R^+$ patients is $P(D^+|R^+)$, and hence the odds are $P(D^+|R^+) / P(D^-|R^+)$

we don't really use the odds just by itself, we want to use the ratio.

so we want to find the odds of a disease for $R^+$ patients as opposed to the odds for $R^-$.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/rr.png" width="350" height="auto">
</p>

we can see here, that OR can be found from both prospective and retrospective studies.

### interpretation

if $D$ and $R$ are independent then $P(D|R) = P(D)$ and the OR is 1.

it can be shown that OR = 1 if and only if D and R are independent (there is no relationship). large odd ratios (OR > 1) implies increased risk of disease and small odd rations (OR < 1) implies decreased risk of disease.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/asp.png" width="350" height="auto">
</p>

here, the estimated odds of heart attack for patients taking aspirin is 0.55 times the estimated odds for those taking the placebo.

in populations of low risk / low prevalence, the relative risk and odds ratio will end up being very similar.

## confidence interval

$$\bar{x} = z^* * se(\bar{x})$$
$$se(\bar{x}) = \frac{\sigma}{\sqrt{n}}$$

this is x bar plus or minus z star times the standard error of x bar, which is equal to the standard deviation divided by the square root of the sample size.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/conf.png" width="350" height="auto">
</p>

the value of z-star changes based on the confidence interval we want. e.g. for the 95% confidence interval, we have a $\pm 1.96$ z-star value

## standard errors and confidence intervals for odds ratios

### standard errors

the odds ratio estimator $OR$, has a skewed distribution on $(0, \inf)$ with the neutral value being 1.

the **log odds ratio** estimator, $log(OR)$, has a more symmetric distribution centred at 0 if there is no difference between the two groups.

the asymptotic **standard error** for the log odds ratio estimator, $log(\widehat{OR})$:
$$SE(log(\widehat{OR})) = \sqrt{\frac{1}{a} + \frac{1}{b} + \frac{1}{c} + \frac{1}{d}}$$

### confidence intervals

a large sample 95% confidence interval for log $\theta$ is approx:

$$log(\widehat{OR})\pm 1.96 \times SE(log(\widehat{OR}))$$

exponentiating (taking x and making it the exponent of $e$) the lower and upper ends of the log(OR) confidence interval gives us an approx. confidence interval for the odds-ratio:

$$exp(log(\widehat{OR})\pm 1.96 \times SE(log(\widehat{OR})))$$

> [!TIP]
> we always use the natural logarithm:
> $log(a) = ln(a) = log_{e}a$

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/int.png" width="350" height="auto">
</p>

this confidence interval is a range of plausible values of the population parameter. gives us the range, where we would not reject the null.

we are testing to see if the odds ratio is 1 - i.e., that our groups are independent from each other. that is the null hypothesis. do we reject this, i.e., have sufficient evidence to believe they are not independent from each other, or do we not reject this, is the odds ratio being 1 a plausible value ?

1 is not inside that interval, so we reject the null. it is not in the range of plausible values.

> [!TIP]
> example:
> the odds ratio was calculated to be 2.93. the 95% confidence interval for the odds ratio is (1.66, 5.10). what does this mean?
> the odds of a tonsillectomy patient having Hodgkin's disease are roughly **three times the odds** of a non-tonsillectomy patient having Hodgkin's. this result is **significant** at the 5% level of significance.
