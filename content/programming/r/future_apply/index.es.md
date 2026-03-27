---
title: Benchmarking de future.apply
author: Urtzi Enriquez-Urzelai
date: 2026-03-25T00:00:00.000Z
series:
  - R Tutoriales
series_order: 1
showPagination: false
summary: >-
  Los bucles for se utilizan habitualmente para realizar tareas en serie. Sin
  embargo, la familia de funciones apply y el nuevo framework (future.apply)
  permiten realizar estas tareas en paralelo, lo que podría ofrecer un mejor
  rendimiento que el clásico bucle for en R.
tags:
  - R
  - programming
  - loops
  - parallelization
format: hugo-md
---


## Los tres contendientes

1.  **Bucle `for` estándar**: Iteración manual (con pre-asignación).
2.  **`lapply`**: El estándar funcional y secuencial de R.
3.  **`future_lapply`**: La versión paralelizada.

------------------------------------------------------------------------

## Experimento 1: La tarea "barata" (ligera)

En este escenario, hacemos algo muy rápido: calcular la media de 1.000 números.

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

# Generar tabla
kable(summary(bench_cheap), caption = "Resultados de la tarea ligera (milisegundos)")
```

| expr | min | lq | mean | median | uq | max | neval |
|:------------|--------:|--------:|---------:|---------:|--------:|---------:|-----:|
| for_loop | 1613.813 | 1685.334 | 2131.2424 | 1839.1135 | 2497.201 | 3276.460 | 10 |
| standard_apply | 578.593 | 610.074 | 739.9632 | 669.7915 | 846.517 | 1022.569 | 10 |
| future_apply | 41053.019 | 43732.484 | 71119.8329 | 64036.6630 | 88714.287 | 131977.539 | 10 |

Resultados de la tarea ligera (milisegundos)

``` r
# Generar figura
autoplot(bench_cheap) +
  labs(title = "Tarea ligera: La sobrecarga del paralelo es visible")
```

<img src="/programming/r/future_apply/index.es.markdown_strict_files/figure-markdown_strict/cheap_benchmark-1.png" width="768" />

------------------------------------------------------------------------

## Experimento 2: La tarea "cara" (pesada)

En este escenario, simulamos un trabajo "pesado" añadiendo un pequeño retardo (`Sys.sleep`). Esto imita el modelado estadístico complejo o el web scraping.

``` r
n_heavy <- 20
data_heavy <- replicate(n_heavy, rnorm(10), simplify = FALSE)

# Una función que tarda 0,1 segundos por llamada
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
  times = 2 # ¡Pocas iteraciones porque es lento!
)

# Generar tabla
kable(summary(bench_expensive), caption = "Resultados de la tarea pesada (segundos)")
```

| expr | min | lq | mean | median | uq | max | neval |
|:------------|--------:|--------:|--------:|--------:|--------:|--------:|-----:|
| for_loop | 2007.7235 | 2007.7235 | 2009.9483 | 2009.9483 | 2012.1732 | 2012.1732 | 2 |
| standard_apply | 2007.2402 | 2007.2402 | 2007.8000 | 2007.8000 | 2008.3598 | 2008.3598 | 2 |
| future_apply | 278.3014 | 278.3014 | 282.9933 | 282.9933 | 287.6853 | 287.6853 | 2 |

Resultados de la tarea pesada (segundos)

``` r
# Generar figura
autoplot(bench_expensive) +
  labs(title = "Tarea pesada: Future gana por goleada")
```

<img src="/programming/r/future_apply/index.es.markdown_strict_files/figure-markdown_strict/expensive_benchmark-1.png" width="768" />
