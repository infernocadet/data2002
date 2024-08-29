# sample size calculations and power

## revision

a 95% confidence interval is a range of plausible values for the null hypothesis. if we performed a large number of identically designed experiments and for each experiement we had a 95% confidence interval, then 95% of those intervals would contrain the true population mean.

when sample size increases, confidence intervals get narrower.

## errors in hypothesis testing

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/err.png" width="auto" height="auto">
</p>

- if the null is true and we do not reject, correct decision.
- if the null is true and we do reject, this is a type I error ($\alpha$)
  - if alpha was 5%, we make mistakes 5% of the time
- if the null is not true and we do not reject, this is a type II error ($1 - \beta$)
- if null is not true and we do reject, this is correct ($1 - \beta$)

type I error: level of significance, the probability that we reject the null, given it is true
type II errors: just beta.
power: given by 1 - beta, the probability that we reject the null hypothesis, given that the alternative is true

### general testing set up

if we perform a two-sided t test, we check to see if the observed sample mean is really far from the hypothesised sample mean. if the observed discrepancy is large compared to the standard error, we reject the hypothesised value as "implausible"

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/gen.png" width="auto" height="auto">
</p>

c is chosen so that the false alarm rate is some fixed, small value $\alpha$

### model assumptions

the false alarm rate determination can only be made if a suitable statistical model is assumed for the data.

the false alarm rate is the probability of rejecting the null hypothesis (the discrepancy is bigger than c multiplied by our standard error) when the null hypothesis is true.

the way we get our constant c, is we choose a false alarm rate - the signifiance level, and we find the point on the t-distribution where the area is equal to whatever area we are looking for.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/itc.png" width="auto" height="auto">
</p>

the reason why we allow false alarms, and don't make it small for example, is because then we would never reject any value, even if we should.

technically, it is because the test would then have **no power**.

the power of a test is the probability that the test rejects the null hypothesis, $H_0$, when a specific alternative hypothesis $H_1$ is true.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/pow.png" width="auto" height="auto">
</p>

### statistical power in one sample t-test

consider the probability of rejecting as a function of the true population mean $\mu$.

we need to know the distribution of the t-statistic for testing $\mu_0$ - when the true population mena $\mu$ is not necessarily equal to $\mu_0$ (hypothesised population mean).

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/spo.png" width="auto" height="auto">
</p>

^ the probability of rejecting the null hypothesis, given that the alternative is true (alternative being the red mu.),

### beer example: power calculations

suppose the sample sd is indicative of the "true" population standard deviation. we want to plot the power function of the test as a function of $\mu$. we assume the "true" SD is equal to the sample value.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/sig.png" width="auto" height="auto">
</p>

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/pf.png" width="auto" height="auto">
</p>

the x-axis is values of mu that we have under the alternative hypothesis - the specified value we've proposed for the true population mean.

when the value of the alternative hypotehsis is very close to the null, then our power is very low. the closer and closer we get, we end up towards our level of significance.

the further the true mean $\mu$ from the value $\mu_0$ picked for the null hypothesis, the more likely we are to reject.

so then if the discrepancy between the null and the alternative influences the power of our experiment, how far away should it be in order to achieve a specific level of power?

let's assume:

- population sd = 0.294
- sample size of n = 6
- H0: mu = 375, H1: mu != 375

how much lower than 375 does mu need to be for us to be 80% sure of "detecting" that mu != 375, with a two-sided test which has a false alarm rate 0.05?

if we wanted an 80% chance to reject the null hypothesis (and therefore have some sort of significant outcome) we would look at the power curve, and find that the value of mu with power 80% is about 374.6.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/dne.png" width="auto" height="auto">
</p>
