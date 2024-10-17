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

```r
new_obs = data.frame(radiation = 200, temperature = 90, wind = 15)
predict(lm3, new_obs, interval = "prediction", level = 0.90)
predict(lm3, new_obs, interval = "prediction", level = 0.90)
```

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/b3.png" width="auto" height="auto">
</p>
