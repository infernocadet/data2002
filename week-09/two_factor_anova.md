# two-factor anova with interactions

some experiments have more than one factor which might impact the response. we can think of an experiment as a big one-way anova where each combination of factors is a different treatment.

our interest lies in determining not only if there are differences between each treatment, but other questions such as whether:

- each factor has an effect
- the effect of one factor is the same across all levels of other factors

## setup

we have these observations:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/fp.png" width="auto" height="auto">
</p>

assuming each number of levels in i and j are the same.

## poisons and antidotes

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/poi.png" width="auto" height="auto">
</p>

we plot the data and we want to get the interaction between each poison and antidote using the interaction() function - which is the same thing as grouping by antidote

## paper planes

students launched paper planes in a controlled environment controlling for two factors:

- paper quality
- plane design

response was distance travelled in mm. foru flights were conducted at each of the 4 treatment combinations.

2 by 2 factorial experiment.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/p1.png" width="auto" height="auto">
</p>

here we are taking in the data and renaming some variables.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/p2.png" width="auto" height="auto">
</p>

then its easy to put them into boxplots and take a look at the spread and median of each group.

but its better to break it down more and group by plane and weight

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/p3.png" width="auto" height="auto">
</p>

so looking back at our general set up, we will let i run from the factor levels of factor a, j run through factor b, and k runs through each joint level of i and j.

## various questions

a couple of questions to ask:

- H0: uij = u (straight 1-way anova between all treatment combinations)
- H0: uij = ui for all j (so factor B has no effect)
- H0: uij = uj for all i (so factor A has no effect)

we can also ask if an interaction is present (below)

- maybe mu(ij) is an outcome of some overall mean mu, plus the impact of being level i in factor a, plus the impact of being level j of factor b - they are additive. if this is true, then the adjustment for each level of factor A is the same within each level of factor B and vice versa. if this is not true and it goes beyond this linear association, then there is some interaction between factors A and B.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/p4.png" width="auto" height="auto">
</p>

### comparing to two-way anova blocks

this looks similar but it is different:

we adjust for blocks in the two-way anova

- the full model is E(Yij) = uij = u + ai + Bj (i.e. treatments and blocks combine additively)
- the null hypothesis is that uij = u + Bij (i.e. all treatment effects ai are zero)
- the Bj are not treatment effects, they are block effects

in our scenario:

- the full model is E(Yijk) = uij (i.e. unrestricted)
- the null hypothesis is uij = u + ai + yj (factor A and B effects combine additively)
- both ai and yj are related to treatment effects

## reparameterisation

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/p5.png" width="auto" height="auto">
</p>

a test for no interaction can be formulated as the following null hypothesis:

H0: (ay)ij = 0 for all i, j

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/p6.png" width="auto" height="auto">
</p>

### f-test for no interaction

brooo seriously this is cooked

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/p7.png" width="auto" height="auto">
</p>

so here is the actual score. I am sure that R will save us today

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/p8.png" width="auto" height="auto">
</p>

## going back to our examples

poison has 3 levels (I, II, III) and antidote has 4 levels (a, b, c, d)

we can make a new variable which is a level for each treatment combination

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/p9.png" width="auto" height="auto">
</p>

this factor indicates that the 12 groups in the big 1 way anova with 4 observations each

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/p10.png" width="auto" height="auto">
</p>

we could put this in a big 1 way anova and this gives us a highly significant result, indicating that there is a signficant difference in the means with at least 1 of the combinations of poison and antidote

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/p11.png" width="auto" height="auto">
</p>

but a better approach would be to break it down into the two main effects and then the interaction effect

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/p12.png" width="auto" height="auto">
</p>

so we model our dependent variable inv_survival against poison mean effect + antidote mean effect + the interaction between poison and antidote.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/p13.png" width="auto" height="auto">
</p>

again the F-value is calculated by taking the mean square of the poison:antidote and dividing by the residual mean square - which follows an f-distribution with 6 and 36 degrees of freedom, giving us an p valu eof 0.387.

there is no signficiant difference - we would not reject the null hypothesis that the alpha gamma i j are all jointly equal to 0.

we can actually see however, that the poison and antidote main effects are significant, there is a significant difference between the levels of each treatment group.

## interaction plots

we can visualise the interactions between the levels of factor a and the levels of factor b

we take the mean of each treatment combination and plot those means on a scatter plot.

if there is no interaction, the traces should be roughly parallel. if there is an interaction, the traces may cross or deviate from parallelism in some other way.

pretty easy - just calculate the mean for each treatment group:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/p14.png" width="auto" height="auto">
</p>

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/p15.png" width="auto" height="auto">
</p>

so this shows the mean survival time for observations with poison and antidote combination.

they do look pretty parallel, and that aligns with our decision to not reject the null hypothesis that there is no interaction between poison and antidote.

we can do it with `emmans::emmip`, we feed it our anova object and then we can denote what we want to plot

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/p16.png" width="auto" height="auto">
</p>

on the other hand, with the paper planes, we found that there was some sort of interaction. so the interaction plots actually look like this

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/p17.png" width="auto" height="auto">
</p>

## post-hoc tests

if we reject the null hypothesis, we want to see what leads to the significance. however, in the two-factor scenario, exactly which comparisons one might be interested in may depend on whether there was a significant interaction or not. if there is a significant interaction, we might like to know if one factor has a strong effect of the other factor within some or all of its levels.

if there is no significant interaction, levels of factor A can be compared independently of levels of factor B.

- which levels of factor A are significantly different from one another or
- which levels of factor B are signficiantly different from the other

### comparing poisons

we determined that there is no interaction between poison and antidote, so we can go ahead and compare different poisons to each other and compare antidote treatments to each other.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/p18.png" width="auto" height="auto">
</p>
