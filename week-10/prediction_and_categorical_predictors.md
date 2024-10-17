# prediction and categorical predictors

## prediction

recall our fitted ozone model

we turned ozone in the log of ozone

```r
data(environmental, package = "lattice")
environmental = environmental |>
  mutate(lozone = log(ozone))
lm3 = lm(lozone ~ radiation + temperature + wind, environmental)
```

so this function basically is saying predict the log of ozone given these other predictor variables.

we end up getting this output:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/b1.png" width="auto" height="auto">
</p>

we want to assess the assumptions of this multiple regression model using autoplot.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/b2.png" width="auto" height="auto">
</p>

we can kind of see that plotting the residuals vs the fitted values kind of shows that our model has some issues predicting lower values - we could maybe plot each of the predictors against the residuals to check for linearity.

we want the spread of residuals to be the same as well to ensure homoskedasticity.

all observations are pretty good in terms of normality.

say we want to predict the log ozone when the solar radiation is 200 langley, temp is 90 degrees and avg wind speed is 15 miles p/hr. we can substitute these into our fitted model.

to do this in R, we make a data frame with the same column names and feed it into the predict function.

level refers to the alpha of the test.

```r
new_obs = data.frame(radiation = 200, temperature = 90, wind = 15)
predict(lm3, new_obs, interval = "prediction", level = 0.90)
predict(lm3, new_obs, interval = "confidence", level = 0.90)
```

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/b3.png" width="auto" height="auto">
</p>

the first **confidence interval** looks at the average level of log ozone prediction based on particular conditions (estimate the mean concentration on days we see certain conditions)

in contrast we might want to look at a prediction for a specific day- predict the log ozone concentration on a day where conditions are x - give a 90% prediction interval. this gives us a range of plausible values for a new individual data point to lie given conditions.

### prediction vs confidence intervals

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/b4.png" width="auto" height="auto">
</p>

this might be a bit but its basically saying:
bold Y is the vector of our fitted values
X is a matrix which holds all the values of the coefficients for each of the predictor variables
epsilon is the vector of error terms.

the predicted value for a single fitted value Y, given a vector of observations of other varibales x-nought, is just the fitted value of y, which is the intercept + the values of a single observation vector multiplied by the slope coefficients

there is some consistent estimator of the variance of that prediction there.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/b5.png" width="auto" height="auto">
</p>

the forecast error for a particular observed value is e-hat = the actual value of our observation minus the prediction we made given our x-nought data.

the variance of our error is the variance of the fitted value, as well as an extra layer of variance of an individual error term. this extra component is teh variance of an individual observation. not an average, but an individual particular one.

so if we chuck it back into R again,

```r
predict(lm3, new_obs, interval = "prediction", level = 0.90, se.fit = TRUE)
```

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/b6.png" width="auto" height="auto">
</p>

### effect of variance on intervals

1. the smaller the sigma squared, the better the fit and hence the smaller the variances for B hat and yhat-nought.
2. the larger the spread of our x variables, the more information we have about how Y responds to each x variable and hence the smaller the variance for B hat and y hat-nought.
3. the larger the sample size n, the smaller the variances
4. the closer x-nought is to x bar the smaller the variances of y hatnought.

### example

lets just revert back to when we tried to predict ozone just based off temperature.

```r
lm2 = lm(ozone ~ temperature, data = environmental)
new_temp = data.frame(
  temperature = seq(from = min(environmental$temperature),
                    to = max(environmental$temperature),
                    by = 0.1)
)
```

then we can calculate the prediction interval and then also the confidence interval, and extract each of those bounds.

this is what it looks like when it is plotted.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/b7.png" width="auto" height="auto">
</p>

the confidence intervals are tighter - an average day, prediction intervals are wider, cos its about a specific day.

## categorical predictors

motivator: fuel economy - the mpg dataset contains fuel economy data. in a regression context, the dependent variable could either by cty (city miles per gallon) or hwy (highway miles per gallon)

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/b8.png" width="auto" height="auto">
</p>

we can break it down by class (categorical variable), we can see that there is a difference between classes - and so we can try to see if this would be a predictor of the city miles per gallon

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/b9.png" width="auto" height="auto">
</p>

if we run a linear regression vs anova, we get similar yet slightly different results
