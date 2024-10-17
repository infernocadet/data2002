# assessing performance

how can we get a better understanding of how our model will perform on unseen data or new data?

## in sample performance vs out of sample performance

e.g. looking at r^2 comparing the simple linear regression to the full model

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/b19.png" width="auto" height="auto">
</p>

the higher the r^2 the better, it explains the data better - but this doesn't protect against overfitting. how can we predict observations that we didn't use to build our model?

we could split the data up, use some to train the model, and try to predict observations from a test set.

```r
set.seed(1)
grp_labs = rep(c("Train", "Test"), times = c(n_train, n_test))
table(grp_labs)
environmental$grp = sample(grp_labs, replace = FALSE)
```

then we group by whether or not a row of the data is train or test
then feed the model into the training data

```r
lm_simple_train = lm(lozone ~ temperature, data = train_dat)
lm_full_train = lm(lozone ~ temperature + wind + radiation, data = train_dat)
```

then we run predict on the new data

```r
simple_pred = predict(lm_simple_train, newdata = test_dat)
full_pred = predict(lm_full_train, newdata = test_dat)
```

### measuring performance

root mean square error:

we can predictions from the two models by comparing them to the observed values using the root mean square error

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/b20.png" width="auto" height="auto">
</p>

mean absolute error:

an alternative measure, less influenced by outliers is the mean absolute error:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/b21.png" width="auto" height="auto">
</p>

## cross-validation

basically doing the whole process a large number of times
