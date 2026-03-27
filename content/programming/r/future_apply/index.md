---
title: Benchmarking future.apply
author: Urtzi Enriquez-Urzelai
date: 2026-03-25T00:00:00.000Z
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
| for_loop | 1627.203 | 1710.958 | 2016.6050 | 1888.7455 | 2275.979 | 2993.959 | 10 |
| standard_apply | 571.801 | 596.274 | 750.1603 | 657.2715 | 987.174 | 1070.018 | 10 |
| future_apply | 43858.992 | 50738.741 | 76084.3102 | 69395.2050 | 88297.921 | 145216.788 | 10 |

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
| for_loop | 2008.8803 | 2008.8803 | 2009.5386 | 2009.5386 | 2010.1969 | 2010.1969 | 2 |
| standard_apply | 2007.6840 | 2007.6840 | 2007.8177 | 2007.8177 | 2007.9514 | 2007.9514 | 2 |
| future_apply | 289.9186 | 289.9186 | 297.2076 | 297.2076 | 304.4966 | 304.4966 | 2 |

Expensive Task Results (seconds)

``` r
# Generate Figure

autoplot(bench_expensive) +
  labs(title = "Expensive Task: Future Wins Big")
```

<img src="/programming/r/future_apply/index.markdown_strict_files/figure-markdown_strict/expensive_benchmark-1.png" width="768" />
