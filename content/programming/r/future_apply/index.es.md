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
categories:
  - Programming
tags:
  - R
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
|:------------|--------:|--------:|---------:|--------:|--------:|---------:|-----:|
| for_loop | 1533.673 | 1594.044 | 1715.9777 | 1696.553 | 1849.909 | 1960.733 | 10 |
| standard_apply | 581.569 | 592.545 | 632.0822 | 607.935 | 647.593 | 769.924 | 10 |
| future_apply | 42645.687 | 47242.446 | 74838.4215 | 76065.549 | 92860.346 | 124832.589 | 10 |

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
| for_loop | 2010.4419 | 2010.4419 | 2012.2996 | 2012.2996 | 2014.1572 | 2014.1572 | 2 |
| standard_apply | 2008.5706 | 2008.5706 | 2008.8800 | 2008.8800 | 2009.1893 | 2009.1893 | 2 |
| future_apply | 282.1072 | 282.1072 | 290.7669 | 290.7669 | 299.4266 | 299.4266 | 2 |

Resultados de la tarea pesada (segundos)

``` r
# Generar figura
autoplot(bench_expensive) +
  labs(title = "Tarea pesada: Future gana por goleada")
```

<img src="/programming/r/future_apply/index.es.markdown_strict_files/figure-markdown_strict/expensive_benchmark-1.png" width="768" />
