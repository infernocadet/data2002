# goodness of fit tests for discrete distributions

> estimate the dose of ionizing radiation, absorbed by an exposed person by usuing chromosome damage in lymphocytes.
> when radiation exposure occurs, damage in DNS is randomly distributed between cells - producing chromosome aberrations. we want to see the number of aberrations observed. this number typically follows a Poisson distribution, the rate of which depends on the dose.

basically, when we have some data, we want to see if the data is good fit for a particular **discrete probability distribution**, in this case a poisson distribution.

## poisson distribution

a poisson random variable represents the probability of a given number of events occuring in a fixed interval (e.g. number of events in a fixed period of time) if these events occur independently with some known average rate $\lambda$ per unit of time.

if $X$ is a Poisson random variable with rate parameter $\lambda$, the probability mass function is:

$$P(X=k) = e^{-\lambda}\frac{\lambda^{k}}{k!}, k=0, 1, 2 \dots$$

lambda, $\lambda$, known as the **rate variable** determines the shape of the distribution, also known as the **mean**.

## chi-squared tests for discrete distributions

lets say we have a sample of observations. we want to test whether the sample is taken from a population with a given distribution function.

we want to test whether the sample is taken from a population with a given distribution function $F_{0}(x|\theta_{1}, \theta_{2}, \dots, \theta_{h})$ where $\theta_{l}$ are the parameters of the distribution.

we can summarise the observed data by tabulating the observed frequencies $y_{i}$ for each possible outcome, and compare them to the corresponding expected frequencies $e_{i}$ (expected outcomes if the null was true), calculated using the expected probabilities $p{i}$ from the hypothesised distribution earlier $F_{0}$.
