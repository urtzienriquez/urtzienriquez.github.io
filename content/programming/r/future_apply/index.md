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
|:------------|--------:|--------:|---------:|--------:|--------:|---------:|-----:|
| for_loop | 1561.415 | 1643.008 | 1983.6259 | 1832.492 | 1974.361 | 3412.406 | 10 |
| standard_apply | 577.609 | 593.539 | 937.5296 | 618.107 | 1063.366 | 2691.602 | 10 |
| future_apply | 43168.213 | 44835.276 | 65135.7504 | 49240.382 | 78636.249 | 125024.330 | 10 |

Cheap Task Results (milliseconds)

``` r
# Generate Figure
autoplot(bench_cheap) +
  labs(title = "Cheap Task: Parallel Overhead is Visible")
```

<img src="index.markdown_strict_files/figure-markdown_strict/cheap_benchmark-1.png" width="768" />

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
| for_loop | 2010.2332 | 2010.2332 | 2013.0622 | 2013.0622 | 2015.8912 | 2015.8912 | 2 |
| standard_apply | 2009.6175 | 2009.6175 | 2012.0894 | 2012.0894 | 2014.5613 | 2014.5613 | 2 |
| future_apply | 290.4095 | 290.4095 | 294.4984 | 294.4984 | 298.5872 | 298.5872 | 2 |

Expensive Task Results (seconds)

``` r
# Generate Figure

autoplot(bench_expensive) +
  labs(title = "Expensive Task: Future Wins Big")
```

<img src="index.markdown_strict_files/figure-markdown_strict/expensive_benchmark-1.png" width="768" />
