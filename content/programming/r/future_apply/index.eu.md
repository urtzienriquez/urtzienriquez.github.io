---
title: future.apply-rekin benchmarking-a egiten
author: Urtzi Enriquez-Urzelai
date: 2026-03-25T00:00:00.000Z
series:
  - R Tutorialak
series_order: 1
showPagination: false
summary: >-
  For-loop-ak oso erabiliak dira zereginak seriean egiteko. Hala ere, "apply"
  familiako funtzioek eta esparru berri batek (future.apply) zeregin horiek
  paraleloan egitea ahalbidetzen dute, eta hori for-loop klasikoa baino
  eraginkorragoa izan daiteke R-n.
categories:
  - Programming
tags:
  - R
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
|:------------|--------:|--------:|---------:|---------:|--------:|---------:|-----:|
| for_loop | 1621.207 | 1649.317 | 1844.2160 | 1738.0125 | 1816.831 | 2798.576 | 10 |
| standard_apply | 570.980 | 572.757 | 679.9542 | 609.3615 | 668.030 | 1070.847 | 10 |
| future_apply | 41958.711 | 44211.130 | 66316.4306 | 45609.9595 | 91943.761 | 131875.262 | 10 |

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
| for_loop | 2014.4471 | 2014.4471 | 2014.9119 | 2014.9119 | 2015.3766 | 2015.3766 | 2 |
| standard_apply | 2009.7203 | 2009.7203 | 2011.6294 | 2011.6294 | 2013.5385 | 2013.5385 | 2 |
| future_apply | 287.4234 | 287.4234 | 298.2098 | 298.2098 | 308.9962 | 308.9962 | 2 |

Zeregin garestiaren emaitzak (segundoak)

``` r
# Irudia sortu
autoplot(bench_expensive) +
  labs(title = "Zeregin garestia: Future-k alde handiz irabazten du")
```

<img src="/programming/r/future_apply/index.eu.markdown_strict_files/figure-markdown_strict/expensive_benchmark-1.png" width="768" />
