# assignment 1

can find the specs [here](https://pages.github.sydney.edu.au/DATA2002/2024/assignment/assignment.html).

## overview

- making a report on survet data. submit HTML document using Quarto with **code folding**. explain all code.

## 2.1 - general discussion of data

need to address these questions `in the introduction`:

1. is this a random sample of data2x002 students?
2. what are the potential biases? which variables are most likely to be subjected to the bias?
3. which questions needed improvement to generate useful data? (in terms of the way the question was phrased, or response validation?)

> [!TIP]
> 756 students in data2002, and 84 students in data2902.

## 2.2 - specific hypothesis tests

need to address these questions `in the result section`. the report is more compelling, if we can articulate a connection between the questions we select, so that its a coherent body of work.

we have to make three questions we can answer from the data and perform a hypothesis test for each question. give a motivation for why we selected these questions. report the hypothesis testing workflow, interpret results and mention any limitations in the data which could impact our findings. we should be very specific here in the results.

- one test from module 1
  - categorical data
    - chi-square test
    - goodness of fit
    - measures of performance
    - measures of risk
    - odds ratios
    - homogeneity
    - independence
    - testing in small samples
- one test from module 2
  - comparing means
    - one sample t-test
    - two sample t test
    - paired samples t-test
    - sign test
    - wilcoxon signed rank test
    - wilcoxon rank-sum test
- one test should be based on a resampling method (monte carlo or permutation)

## 3.1 example yaml

to make sure that our quarto document meets the required criteria, use the following YAML:

```yaml
---
title: "Your title here"
date: "`r Sys.Date()`"
author: "Your SID (don't put your name, so that we can respect the anonymous marking policy)"
format:
  html:
    embed-resources: true # Creates a single HTML file as output
    code-fold: true # Code folding; allows you to show/hide code chunks
    code-tools: true # Includes a menu to download the code file
    # code-tools are particularly important if you use inline R to
    # improve the reproducibility of your report
table-of-contents: true # (Optional) Creates a table of contents
number-sections: true # (Optional) Puts numbers next to heading/subheadings
---
```
