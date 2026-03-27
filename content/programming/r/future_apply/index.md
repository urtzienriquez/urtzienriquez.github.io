---
title: Benchmarking future.apply
author: Urtzi Enriquez-Urzelai
date: 2026-03-25T00:00:00.000Z
weight: 10
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
| for_loop | 1559.343 | 1661.762 | 1964.0086 | 1811.4175 | 1960.423 | 3529.293 | 10 |
| standard_apply | 573.510 | 579.167 | 622.6739 | 597.7205 | 620.955 | 857.438 | 10 |
| future_apply | 43631.221 | 44972.875 | 66035.7896 | 51369.2755 | 82316.685 | 132553.906 | 10 |

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
| for_loop | 2014.6665 | 2014.6665 | 2015.7225 | 2015.7225 | 2016.7784 | 2016.7784 | 2 |
| standard_apply | 2007.9510 | 2007.9510 | 2008.2138 | 2008.2138 | 2008.4767 | 2008.4767 | 2 |
| future_apply | 294.6247 | 294.6247 | 301.0491 | 301.0491 | 307.4736 | 307.4736 | 2 |

Expensive Task Results (seconds)

``` r
# Generate Figure

autoplot(bench_expensive) +
  labs(title = "Expensive Task: Future Wins Big")
```

<img src="/programming/r/future_apply/index.markdown_strict_files/figure-markdown_strict/expensive_benchmark-1.png" width="768" />
