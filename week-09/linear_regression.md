# linear regression

## learning and prediction

types of learning:

**supervised learning**:

- we have knowledge of class labels or values
- goal: train a model using known class labels to predict class or value label for a new data point

**unsupervised learning**:

- no knowledge of output class or value - data is unlabelled
- goal: determine data patterns/groupings

## supervised learning

there are two main classes: **classification** and **regression**

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a1.png" width="auto" height="auto">
</p>

classification maps inputs to an output label e.g. decision trees, nearest neighbour, logistic regression, artifical neural networks etc - usually for categorical variables

regression maps inputs to a continuous output

## regression

motivating example: air pollution

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a2.png" width="auto" height="auto">
</p>

want to see if maximum daily temperature influences on avergae ozone concentration.

we can plot our data first

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a3.png" width="auto" height="auto">
</p>

we can add a geom_smooth to add a line, "lm" means linear model

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a4.png" width="auto" height="auto">
</p>

this finds the line of best fit.

### simple linear regression

a simple linear regression model aims to predict an outcome variable, Y, using a single predictor variable x,

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a5.png" width="auto" height="auto">
</p>

### fitting a line through least squares

how can we estimate B0 and B1? we aim to minimise the sum of the squared residuals:

a residual:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a6.png" width="auto" height="auto">
</p>

yi is the observation, and yi hat is the fitted (predicted) value. this fitted values comes from the ith observation given the ith predictor value.

we can use this optimisation problem :

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a7.png" width="auto" height="auto">
</p>

R does this with the lm() function

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a8.png" width="auto" height="auto">
</p>
