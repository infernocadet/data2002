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

### fitted values and residuals

the fitted values are obstained by plugging in the observed predictor (x) values into our estimated model/

the residuals are the differences between the observed outcome variable (y) and the value the estimated model predicts for that observation.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a9.png" width="auto" height="auto">
</p>

however, we shouldn't actually hard code the numbers - we should extract the residuals and fitted values from the lm1 object directly

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a10.png" width="auto" height="auto">
</p>

## checking assumptions

there are 4 assumptions underlying our linear regression model:

1. linearity: the relationship between Y and x is linear
2. independence: all the errors are independent of each other
3. homoskedasticity: the errors have constant variance Var($\epsilon_i$ = $\sigma^2$) for all i: 1, 2, ... n
4. normality: the errors follow a normal distribution

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a11.png" width="auto" height="auto">
</p>

### linearity

violations to the linearity assumption are serious - or else your predictions will be systematically wrong

before running the regression, plot y against x and look to see if the relaitonship is approximately linear

after running, look at a plot of the residuals against x

- residuals should be symmetrically distributed above and below zero
- a curved pattern in the residuals is evidence for non-linearity - for some values of x the model regularly overestimates y while in other regions the mdoel regularly underestimates y

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a12.png" width="auto" height="auto">
</p>

the plot of the residuals may indicate non-linearity. in the plot the residuals are above zero for low temperatures, then they go below and end up high again for high temperatures. we underestimate the ozone level for low and high temperatures and overestimate the ozone level at moderate temperatures.

our predictions are systemtically wrong for certain ranges of temperature.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a13.png" width="auto" height="auto">
</p>

#### transformations

if we see a non-linear relationship between y and x we can try to transform the data so that we have a linear relationship between the transformed variables.

we can consider the log of ozone concentration:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a14.png" width="auto" height="auto">
</p>

so we would mutate our existing data set and create another linear regression model

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a15.png" width="auto" height="auto">
</p>

it looks way better

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a16.png" width="auto" height="auto">
</p>

### independence

assumption of independence between errors is dealt with before data collection.

observations shouldn't be related to one another. if the sample is not random, estimates of B0 and B1 may be biased.

violations of independence arise in time series data where observations are measured on the same subject through time and may be related to one another.

### homoskedasticiity

skedasticity means spread.

constant error variance is important which ensures the hypothesiss tests give valid results.

heteroskedasticity makes it difficult to estimate the true standard deviation of the errors resulting in weird confidence intervals

this also might give too much weight to a small subset of the data when estimating coefficients.

check for homoskedasticity in plots of residuals versus x. if residuals are getting more spread out, that is evidence of heteroskedasticity

### normality

violations of normality of the erros compromise our inferences. check of a Q-Q plot of the residuals to check for normalilty - sometimes the problem is a couple of outliers - these can be scrutinised. if they are genuine/explainable/caused by events likely to occur again in the future.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a17.png" width="auto" height="auto">
</p>

#### autoplot

the `ggforitfy` package provides an autoplat method for lm objects

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a18.png" width="auto" height="auto">
</p>

## interpreting model coefficients

to interpret the estimated coefficients - the intercept is the expected value of Y when x is 0. and the slope is the amoutn we expect Y to change by.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a19.png" width="auto" height="auto">
</p>

#### nicer model output

we can use `sjPlot` to show a better output as well as the equation

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a20.png" width="auto" height="auto">
</p>

we could also show the x and y intercept lines.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a21.png" width="auto" height="auto">
</p>

### slope interpretation

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a22.png" width="auto" height="auto">
</p>

log can be interpreted as a percentage increase

#### log transformations

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a23.png" width="auto" height="auto">
</p>

## inference in regression models

we are interested in hypotheses of the form: H0: B1 = 0: B1 != 0 or </>

to do this we use a t-test which follows a t-distribution with degrees of freedom n-2

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a24.png" width="auto" height="auto">
</p>

calling a summary of the lm object gives us a lot of informaiton

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a25.png" width="auto" height="auto">
</p>

in this output, the estimate (for the predictor variable) divided by the std. error gives the t value

the p-value as an expression would be

$ 2 \* P(t\_{109} \ge 11.654) $

### workflow

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/a26.png" width="auto" height="auto">
</p>
