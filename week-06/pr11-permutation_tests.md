# permutation tests

about the lady who tasted 8 cups of tea to see if she knew if it was milk first or tea first.

## permutations

we look at all 40320 different permutations of the cups of tea.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/per.png" width="auto" height="auto">
</p>

so instead what we can do is also apply it to a vector, and then check if theyre identical

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/per1.png" width="auto" height="auto">
</p>

so we could do that across all permutations, iterating through all the rows. we would get the same value that we would get with Fisher's exact test. this is infeasible, we can sample a selection of them.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/per2.png" width="auto" height="auto">
</p>

we sample under the null hypothesis that the person can't tell the difference. this also gives us a 0.0146 p-value, which is very close.

## two independent samples

looking at plant growth. an experiment compared yields under a control and two different treatment conditions.

<p align="center">
    <img src="https://github.com/infernocadet/data2002/blob/main/graphics/pg.png" width="auto" height="auto">
</p>
