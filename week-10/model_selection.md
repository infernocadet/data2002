# model selection

## crime data

we can fit a null model - which basically doesn't use any predictor variables to predict y.
we can fit a full model - which uses every variable to explain y.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/b15.png" width="auto" height="auto">
</p>

there are some variables which have small p values here.

we can use the glance function from the broom package to compare the information from both models

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/b16.png" width="auto" height="auto">
</p>

## stepwise selection

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/b17.png" width="auto" height="auto">
</p>

this slide explains hwo to drop variables or predictors from the model given some test

we look at the largest f statistic and drop it

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/b18.png" width="auto" height="auto">
</p>

this is known as backward variable selection:

1. start with model containing all explanatory variables
2. for each variable in turn, investigate effect of removing variable from model
3. remove least informative variable
4. stop when all variables are important

## forward selection

1. start with nothing and then add significant variables until no additional variables are important
