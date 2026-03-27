---
title: Uso de DataFrames.jl
author: Urtzi Enriquez-Urzelai
date: 2026-03-25T00:00:00.000Z
weight: 10
series:
  - Julia Tutoriales
series_order: 1
showPagination: false
summary: Una breve introducción al uso del paquete DataFrames en Julia
tags:
  - Julia
  - dataframes
  - análisis de datos
format: hugo-md
jupyter: julia-1.11
---


<script src="https://cdn.jsdelivr.net/npm/requirejs@2.3.6/require.min.js" integrity="sha384-c9c+LnTbwQ3aujuU7ULEPVvgLs+Fn6fJUvIGTsuu1ZcCf11fiEubah0ttpca4ntM sha384-6V1/AdqZRWk1KAlWbKBlGhN7VG4iE/yAZcO6NZPMF8od0vukrvr0tg4qY6NSrItx" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" integrity="sha384-ZvpUoO/+PpLXR1lu4jmpXWu80pZlYUAfxl5NsBMWOEPSjUn/6Z/hRTt8+pR6L4N2" crossorigin="anonymous" data-relocate-top="true"></script>
<script type="application/javascript">define('jquery', [],function() {return window.jQuery;})</script>


En este ejemplo, trabajaré con un conjunto de datos de la población mundial por país, descargado de internet. Esta lección está basada en un vídeo de YouTube [^1].

## Importación de datos

``` julia
using DataFrames
using CSV

wp = DataFrame(CSV.File("./world_pop.csv"))
first(wp, 5)
```

<div><div style = "float: left;"><span>5×8 DataFrame</span></div><div style = "clear: both;"></div></div><div class = "data-frame" style = "overflow-x: scroll;">

| Row | Country | Population 2024 | Population 2023 | Area (km2) | Density (/km2) | Growth Rate | World % | World Rank |
|---:|:---|---:|---:|:---|---:|---:|---:|---:|
|  | String | Int64 | Int64 | String7 | Float64 | Float64 | Float64? | Int64 |
| 1 | India | 1441719852 | 1428627663 | 3M | 485.0 | 0.0092 | 0.1801 | 1 |
| 2 | China | 1425178782 | 1425671352 | 9.4M | 151.0 | -0.0003 | 0.178 | 2 |
| 3 | United States | 341814420 | 339996563 | 9.1M | 37.0 | 0.0053 | 0.0427 | 3 |
| 4 | Indonesia | 279798049 | 277534122 | 1.9M | 149.0 | 0.0082 | 0.035 | 4 |
| 5 | Pakistan | 245209815 | 240485658 | 770.9K | 318.0 | 0.0196 | 0.0306 | 5 |

</div>

``` julia
describe(wp)
```

<div><div style = "float: left;"><span>8×7 DataFrame</span></div><div style = "clear: both;"></div></div><div class = "data-frame" style = "overflow-x: scroll;">

| Row | variable | mean | min | median | max | nmissing | eltype |
|---:|:---|:---|:---|:---|:---|---:|:---|
|  | Symbol | Union... | Any | Union... | Any | Int64 | Type |
| 1 | Country |  | Afghanistan |  | Zimbabwe | 0 | String |
| 2 | Population 2024 | 3.46886e7 | 526 | 5.62636e6 | 1441719852 | 0 | Int64 |
| 3 | Population 2023 | 3.43744e7 | 518 | 5.6439e6 | 1428627663 | 0 | Int64 |
| 4 | Area (km2) |  | 1.1K |  | \< 1 | 0 | String7 |
| 5 | Density (/km2) | 453.788 | 0.14 | 98.5 | 21674.0 | 0 | Float64 |
| 6 | Growth Rate | 0.00920043 | -0.0309 | 0.00795 | 0.0483 | 0 | Float64 |
| 7 | World % | 0.00444649 | 0.0 | 0.00075 | 0.1801 | 6 | Union{Missing, Float64} |
| 8 | World Rank | 117.5 | 1 | 117.5 | 234 | 0 | Int64 |

</div>

``` julia
names(wp)
```

    8-element Vector{String}:
     "Country"
     "Population 2024"
     "Population 2023"
     "Area (km2)"
     "Density (/km2)"
     "Growth Rate"
     "World %"
     "World Rank"

## Manipulación de datos (Data wrangling)

Code snippet

``` julia
wp.id = 1:nrow(wp)
first(wp, 5)
```

<div><div style = "float: left;"><span>5×9 DataFrame</span></div><div style = "clear: both;"></div></div><div class = "data-frame" style = "overflow-x: scroll;">

| Row | Country | Population 2024 | Population 2023 | Area (km2) | Density (/km2) | Growth Rate | World % | World Rank | id |
|---:|:---|---:|---:|:---|---:|---:|---:|---:|---:|
|  | String | Int64 | Int64 | String7 | Float64 | Float64 | Float64? | Int64 | Int64 |
| 1 | India | 1441719852 | 1428627663 | 3M | 485.0 | 0.0092 | 0.1801 | 1 | 1 |
| 2 | China | 1425178782 | 1425671352 | 9.4M | 151.0 | -0.0003 | 0.178 | 2 | 2 |
| 3 | United States | 341814420 | 339996563 | 9.1M | 37.0 | 0.0053 | 0.0427 | 3 | 3 |
| 4 | Indonesia | 279798049 | 277534122 | 1.9M | 149.0 | 0.0082 | 0.035 | 4 | 4 |
| 5 | Pakistan | 245209815 | 240485658 | 770.9K | 318.0 | 0.0196 | 0.0306 | 5 | 5 |

</div>

``` julia
colnames = [:country, :pop2024, :pop2023, :area, :density, :growth_rate, :world_perc, :world_rank, :id]
rename!(wp, colnames)
describe(wp)
```

<div><div style = "float: left;"><span>9×7 DataFrame</span></div><div style = "clear: both;"></div></div><div class = "data-frame" style = "overflow-x: scroll;">

| Row | variable | mean | min | median | max | nmissing | eltype |
|---:|:---|:---|:---|:---|:---|---:|:---|
|  | Symbol | Union... | Any | Union... | Any | Int64 | Type |
| 1 | country |  | Afghanistan |  | Zimbabwe | 0 | String |
| 2 | pop2024 | 3.46886e7 | 526 | 5.62636e6 | 1441719852 | 0 | Int64 |
| 3 | pop2023 | 3.43744e7 | 518 | 5.6439e6 | 1428627663 | 0 | Int64 |
| 4 | area |  | 1.1K |  | \< 1 | 0 | String7 |
| 5 | density | 453.788 | 0.14 | 98.5 | 21674.0 | 0 | Float64 |
| 6 | growth_rate | 0.00920043 | -0.0309 | 0.00795 | 0.0483 | 0 | Float64 |
| 7 | world_perc | 0.00444649 | 0.0 | 0.00075 | 0.1801 | 6 | Union{Missing, Float64} |
| 8 | world_rank | 117.5 | 1 | 117.5 | 234 | 0 | Int64 |
| 9 | id | 117.5 | 1 | 117.5 | 234 | 0 | Int64 |

</div>

``` julia
wp_clean = select!(wp, :id, :country, :pop2024, :growth_rate);
```

¡Ten cuidado! El signo de exclamación (!) modifica también la tabla original. Recuerda que no estamos haciendo copias, sino creando nuevos punteros a los mismos objetos en memoria.

``` julia
describe(wp_clean)
```

<div><div style = "float: left;"><span>4×7 DataFrame</span></div><div style = "clear: both;"></div></div><div class = "data-frame" style = "overflow-x: scroll;">

| Row | variable    | mean       | min         | median    | max        | nmissing | eltype   |
|----:|:------------|:-----------|:------------|:----------|:-----------|---------:|:---------|
|     | Symbol      | Union...   | Any         | Union...  | Any        |    Int64 | DataType |
|   1 | id          | 117.5      | 1           | 117.5     | 234        |        0 | Int64    |
|   2 | country     |            | Afghanistan |           | Zimbabwe   |        0 | String   |
|   3 | pop2024     | 3.46886e7  | 526         | 5.62636e6 | 1441719852 |        0 | Int64    |
|   4 | growth_rate | 0.00920043 | -0.0309     | 0.00795   | 0.0483     |        0 | Float64  |

</div>

``` julia
describe(wp)
```

<div><div style = "float: left;"><span>4×7 DataFrame</span></div><div style = "clear: both;"></div></div><div class = "data-frame" style = "overflow-x: scroll;">

| Row | variable    | mean       | min         | median    | max        | nmissing | eltype   |
|----:|:------------|:-----------|:------------|:----------|:-----------|---------:|:---------|
|     | Symbol      | Union...   | Any         | Union...  | Any        |    Int64 | DataType |
|   1 | id          | 117.5      | 1           | 117.5     | 234        |        0 | Int64    |
|   2 | country     |            | Afghanistan |           | Zimbabwe   |        0 | String   |
|   3 | pop2024     | 3.46886e7  | 526         | 5.62636e6 | 1441719852 |        0 | Int64    |
|   4 | growth_rate | 0.00920043 | -0.0309     | 0.00795   | 0.0483     |        0 | Float64  |

</div>

## Subconjuntos (Subsetting)

Es posible comprobar si una cadena (p. ej., el nombre de un país) o un valor está presente utilizando el operador in.

``` julia
"Tanzania" in wp.country
```

    true

Podemos obtener el índice donde se encuentra un país específico utilizando las funciones findall() o findfirst().

``` julia
# con funciones anónimas
findall(x -> x == "Tanzania", wp.country)
```

    1-element Vector{Int64}:
     21

``` julia
# o utilizando la función ==
findall(==("Tanzania"), wp.country)
```

    1-element Vector{Int64}:
     21

Y esto nos permite extraer subconjuntos de nuestro dataframe de varias formas:

``` julia
# usando cualquiera de las formas posibles con findall() o findfirst()
wp[findall(==("Tanzania"), wp.country), :]
```

<div><div style = "float: left;"><span>1×4 DataFrame</span></div><div style = "clear: both;"></div></div><div class = "data-frame" style = "overflow-x: scroll;">

| Row |    id | country  |  pop2024 | growth_rate |
|----:|------:|:---------|---------:|------------:|
|     | Int64 | String   |    Int64 |     Float64 |
|   1 |    21 | Tanzania | 69419073 |      0.0294 |

</div>

``` julia
# o usando broadcasting, de forma similar a la sintaxis de R
wp[wp.country .== "Tanzania", :]
```

<div><div style = "float: left;"><span>1×4 DataFrame</span></div><div style = "clear: both;"></div></div><div class = "data-frame" style = "overflow-x: scroll;">

| Row |    id | country  |  pop2024 | growth_rate |
|----:|------:|:---------|---------:|------------:|
|     | Int64 | String   |    Int64 |     Float64 |
|   1 |    21 | Tanzania | 69419073 |      0.0294 |

</div>

La sentencia wp.country .== "Tanzania" devuelve un vector de 0s y 1s, que se utiliza para seleccionar las filas.

[^1]: Basado en [video de youtube](https://www.youtube.com/watch?v=TGFNEwVB9DU&list=PLhQ2JMBcfAsjZTA8_jGhz3BVqYgOeyyeu&index=7)
