---
title: future.apply-rekin benchmarking-a egiten
author: Urtzi Enriquez-Urzelai
date: 2026-03-25T00:00:00.000Z
weight: 10
summary: >-
  For-loop-ak oso erabiliak dira zereginak seriean egiteko. Hala ere, "apply"
  familiako funtzioek eta esparru berri batek (future.apply) zeregin horiek
  paraleloan egitea ahalbidetzen dute, eta hori for-loop klasikoa baino
  eraginkorragoa izan daiteke R-n.
tags:
  - R
  - programazioa
  - begiztak
  - paralelizazioa
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
| for_loop | 1597.582 | 1642.186 | 1887.5209 | 1727.636 | 1860.513 | 3384.067 | 10 |
| standard_apply | 583.710 | 589.074 | 663.2824 | 625.522 | 726.864 | 857.901 | 10 |
| future_apply | 41581.888 | 43988.588 | 67064.7123 | 59031.182 | 88363.362 | 123925.270 | 10 |

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
| for_loop | 2009.3005 | 2009.3005 | 2012.4186 | 2012.4186 | 2015.5367 | 2015.5367 | 2 |
| standard_apply | 2008.4625 | 2008.4625 | 2008.5676 | 2008.5676 | 2008.6726 | 2008.6726 | 2 |
| future_apply | 284.3551 | 284.3551 | 288.7213 | 288.7213 | 293.0876 | 293.0876 | 2 |

Zeregin garestiaren emaitzak (segundoak)

``` r
# Irudia sortu
autoplot(bench_expensive) +
  labs(title = "Zeregin garestia: Future-k alde handiz irabazten du")
```

<img src="/programming/r/future_apply/index.eu.markdown_strict_files/figure-markdown_strict/expensive_benchmark-1.png" width="768" />
