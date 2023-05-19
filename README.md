
<!-- README.md is generated from README.Rmd. Please edit that file -->

# larnsceR

<!-- badges: start -->
<!-- badges: end -->

The goal of larnsceR is to keep all my functions in one place and
document them.

## Installation

You can install the development version of larnsceR from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("larnsce/larnsceR")
```

## Example

This is a basic example which shows you how to solve a common problem:

``` r
library(larnsceR)
```

``` r
df_credit <- read.csv(
  "https://raw.githubusercontent.com/Global-Health-Engineering/manuscript-qechairquality/main/data/credit.csv") |>
   tidyr::unite("name", first_name:surname, sep = "")

credit_sentence(data = df_credit, group_var = name)
#> # A tibble: 1 × 1
#>   sentence                                                                      
#>   <chr>                                                                         
#> 1 <b>Elizabeth Tilley</b>: Conceptualization, Methodology, Formal Analysis, Wri…
```
