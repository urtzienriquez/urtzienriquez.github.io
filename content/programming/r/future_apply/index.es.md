---
title: Benchmarking de future.apply
author: Urtzi Enriquez-Urzelai
date: 2026-03-25T00:00:00.000Z
weight: 10
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
|:------------|--------:|--------:|---------:|--------:|--------:|---------:|-----:|
| for_loop | 1602.845 | 1681.812 | 1824.4828 | 1714.448 | 1854.294 | 2568.728 | 10 |
| standard_apply | 592.409 | 612.976 | 952.0854 | 637.425 | 1185.623 | 2714.626 | 10 |
| future_apply | 41520.068 | 44619.462 | 65634.8911 | 45378.888 | 86757.992 | 132784.248 | 10 |

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
| for_loop | 2014.3689 | 2014.3689 | 2015.0432 | 2015.0432 | 2015.7174 | 2015.7174 | 2 |
| standard_apply | 2007.8064 | 2007.8064 | 2007.9208 | 2007.9208 | 2008.0352 | 2008.0352 | 2 |
| future_apply | 276.0554 | 276.0554 | 294.9683 | 294.9683 | 313.8811 | 313.8811 | 2 |

Resultados de la tarea pesada (segundos)

``` r
# Generar figura
autoplot(bench_expensive) +
  labs(title = "Tarea pesada: Future gana por goleada")
```

<img src="/programming/r/future_apply/index.es.markdown_strict_files/figure-markdown_strict/expensive_benchmark-1.png" width="768" />
