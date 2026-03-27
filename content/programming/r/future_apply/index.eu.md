---
title: future.apply-rekin benchmarking-a egiten
author: Urtzi Enriquez-Urzelai
date: 2026-03-25T00:00:00.000Z
weight: 10
series:
  - R Tutorialak
series_order: 1
showPagination: false
summary: >-
  For-loop-ak oso erabiliak dira zereginak seriean egiteko. Hala ere, "apply"
  familiako funtzioek eta esparru berri batek (future.apply) zeregin horiek
  paraleloan egitea ahalbidetzen dute, eta hori for-loop klasikoa baino
  eraginkorragoa izan daiteke R-n.
tags:
  - R
  - programming
  - loops
  - parallelization
format: hugo-md
---


## Hiru Lehian kideak

1.  **`for` begizta estandarra**: Eskuzko iterazioa (aurre-esleitua).
2.  **`lapply`**: R-ko estandar funtzional eta sekuentziala.
3.  **`future_lapply`**: Bertsio paralelizatua.

------------------------------------------------------------------------

## 1. Esperimentua: Zeregin "Merkea"

Eszenatoki honetan, oso azkar egiten den zerbait egingo dugu: 1.000 zenbakiren batez bestekoa kalkulatu.

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

# Taula sortu
kable(summary(bench_cheap), caption = "Zeregin merkearen emaitzak (milisegundoak)")
```

| expr | min | lq | mean | median | uq | max | neval |
|:------------|--------:|--------:|---------:|--------:|--------:|---------:|-----:|
| for_loop | 1527.265 | 1634.641 | 1779.7843 | 1744.709 | 1914.875 | 2065.791 | 10 |
| standard_apply | 596.950 | 601.254 | 729.8006 | 632.197 | 803.007 | 1238.508 | 10 |
| future_apply | 43311.720 | 45430.723 | 68898.6957 | 60474.312 | 76580.966 | 132509.011 | 10 |

Zeregin merkearen emaitzak (milisegundoak)

``` r
# Irudia sortu
autoplot(bench_cheap) +
  labs(title = "Zeregin merkea: Paralelizazioaren gainkarga nabaria da")
```

<img src="/programming/r/future_apply/index.eu.markdown_strict_files/figure-markdown_strict/cheap_benchmark-1.png" width="768" />

------------------------------------------------------------------------

## 2. Esperimentua: Zeregin "Garestia"

Eszenatoki honetan, lan "astun" bat simulatuko dugu atzerapen txiki bat gehituz (`Sys.sleep`). Horrek modelizazio estatistiko konplexu bat edo web scraping-a imitatzen du.

``` r
n_heavy <- 20
data_heavy <- replicate(n_heavy, rnorm(10), simplify = FALSE)

# Deialdi bakoitzeko 0,1 segundo ematen dituen funtzioa
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
  times = 2 # Iterazio gutxi, motela baita!
)

# Taula sortu
kable(summary(bench_expensive), caption = "Zeregin garestiaren emaitzak (segundoak)")
```

| expr | min | lq | mean | median | uq | max | neval |
|:------------|--------:|--------:|--------:|--------:|--------:|--------:|-----:|
| for_loop | 2010.4344 | 2010.4344 | 2012.9175 | 2012.9175 | 2015.4007 | 2015.4007 | 2 |
| standard_apply | 2007.5907 | 2007.5907 | 2008.0775 | 2008.0775 | 2008.5644 | 2008.5644 | 2 |
| future_apply | 296.7501 | 296.7501 | 298.9791 | 298.9791 | 301.2081 | 301.2081 | 2 |

Zeregin garestiaren emaitzak (segundoak)

``` r
# Irudia sortu
autoplot(bench_expensive) +
  labs(title = "Zeregin garestia: Future-k alde handiz irabazten du")
```

<img src="/programming/r/future_apply/index.eu.markdown_strict_files/figure-markdown_strict/expensive_benchmark-1.png" width="768" />
