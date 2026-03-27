---
title: Benchmarking future.apply
author: Urtzi Enriquez-Urzelai
date: 2026-03-25T00:00:00.000Z
weight: 10
series:
  - R Tutorials
series_order: 1
showPagination: false
summary: >-
  For loops are very commonly used for performing tasks in series. However, the
  apply family of functions and a new framework (future.apply) allow to perform
  this tasks in parallel, which might be more performant than the classical
  for-loop in R.
tags:
  - R
  - programming
  - loops
  - parallelization
format: hugo-md
---


## The Three Contenders

1.  **Standard `for` loop**: Manual iteration (pre-allocated).
2.  **`lapply`**: The functional, sequential R standard.
3.  **`future_lapply`**: The parallelized version.

------------------------------------------------------------------------

## Experiment 1: The "Cheap" Task

In this scenario, we do something very fast: calculating the mean of 1,000 numbers.

``` r
n <- 200
data_list <- replicate(n, rnorm(1000), simplify = FALSE)

bench_cheap <- microbenchmark(
  for_loop = {
    res_for <- vector("list", n)
    for (i in 1:n) res_for[[i]] <- mean(data_list[[i]])
  },
  standard_apply = lapply(data_list, mean),
  future_apply = future_lapply(data_list, mean),
  times = 10
)

# Generate Table
kable(summary(bench_cheap), caption = "Cheap Task Results (milliseconds)")
```

| expr | min | lq | mean | median | uq | max | neval |
|:------------|--------:|--------:|---------:|---------:|--------:|---------:|-----:|
| for_loop | 1663.241 | 1817.202 | 2092.5988 | 1857.2320 | 2260.686 | 2978.865 | 10 |
| standard_apply | 597.124 | 631.260 | 806.3467 | 727.4855 | 865.540 | 1348.628 | 10 |
| future_apply | 45537.029 | 69018.471 | 79258.6578 | 75984.0165 | 88612.943 | 134551.889 | 10 |

Cheap Task Results (milliseconds)

``` r
# Generate Figure
autoplot(bench_cheap) +
  labs(title = "Cheap Task: Parallel Overhead is Visible")
```

<img src="/programming/r/future_apply/index.markdown_strict_files/figure-markdown_strict/cheap_benchmark-1.png" width="768" />

------------------------------------------------------------------------

## Experiment 2: The "Expensive" Task

In this scenario, we simulate "heavy" work by adding a tiny delay (`Sys.sleep`). This mimics complex statistical modeling or web scraping.

``` r
n_heavy <- 20
data_heavy <- replicate(n_heavy, rnorm(10), simplify = FALSE)

# A function that takes 0.1 seconds per call

heavy_func <- function(x) {
  Sys.sleep(0.1)
  mean(x)
}

bench_expensive <- microbenchmark(
  for_loop = {
    res_for <- vector("list", n_heavy)
    for (i in 1:n_heavy) res_for[[i]] <- heavy_func(data_heavy[[i]])
  },
  standard_apply = lapply(data_heavy, heavy_func),
  future_apply = future_lapply(data_heavy, heavy_func),
  times = 2 # Low iterations because it's slow!
)

# Generate Table

kable(summary(bench_expensive), caption = "Expensive Task Results (seconds)")
```

| expr | min | lq | mean | median | uq | max | neval |
|:------------|--------:|--------:|--------:|--------:|--------:|--------:|-----:|
| for_loop | 2013.3710 | 2013.3710 | 2014.1945 | 2014.1945 | 2015.0180 | 2015.0180 | 2 |
| standard_apply | 2007.3922 | 2007.3922 | 2007.6933 | 2007.6933 | 2007.9944 | 2007.9944 | 2 |
| future_apply | 281.1161 | 281.1161 | 287.9782 | 287.9782 | 294.8402 | 294.8402 | 2 |

Expensive Task Results (seconds)

``` r
# Generate Figure

autoplot(bench_expensive) +
  labs(title = "Expensive Task: Future Wins Big")
```

<img src="/programming/r/future_apply/index.markdown_strict_files/figure-markdown_strict/expensive_benchmark-1.png" width="768" />
