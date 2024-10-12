# two-way anova

## electrode testing

looking at skin resistance for different types of electrodes. may be differences between the electrode types and/or between the subjects. if there is, this will "add" to the overall variation. can we adjust for this

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/u.png" width="auto" height="auto">
</p>

please look at lv08 for the theory and notation

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/tan.png" width="auto" height="auto">
</p>

so we can add extra variables
here mu is the overall mean of all the data, and ai is the adjustment from that group mean for electrode type, and bj is adjustment for each subject
n is the block size (group size) and the error terms follow a normal distribution.

we can decompose each observation into 4 pieces:

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/tws.png" width="auto" height="auto">
</p>

### adjusting for blocks

we have identified some systematic variation which can be attributed to the differences between Subjects.

the result is that we have a smaller (and more precise) estimate of the error variance as we have explained an extra part of the variation and removed it from the residual sum of squares.

## two way anova table

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/2a.png" width="auto" height="auto">
</p>

a two way anova with blocking can be thought of as a generalisation of the paired t-test where each pair is a block

in the paired t test, the idea is to remove the variation between pairs, to more accurately compare the two treatment levels within each pair. the within pair difference is then averaged over all pairs to get the treatment effect.

we are not interested in testing for a block effect, we are only interested in comparing treatments. we are adjusting for blocks to more accurately compare treatments.

## post-hoc tests

lets say we reject the null hypothesis on a two-way anova table

under our new parametrisation, each treatment difference, e.g. alpha1 - alpha2 is still naturally estimated using the corresponding treatment level mean difference.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/2b.png" width="auto" height="auto">
</p>
