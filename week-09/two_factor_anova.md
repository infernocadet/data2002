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

we plot the data and we want to get the interaction between each poison and antidode using the interaction() function - which is the same thing as grouping by antidote

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
