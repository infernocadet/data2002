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

there are different ways to measure the association between a risk factor/treatment and the disease outcome. how the data is **sampled** greatly impacts the ways in which these methods are applicable and interpretable.

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
> if $D$ and $R$ are **independent**, then the probability of $P(D|R) = P(D)$, and hence $RR=1$.
