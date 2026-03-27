---
title: DataFrames.jl erabiltzen
author: Urtzi Enriquez-Urzelai
date: 2025-03-25T00:00:00.000Z
series:
  - Julia Tutorialak
series_order: 1
showPagination: false
summary: Julia-ko DataFrames paketea erabiltzeko sarrera labur-laburra
categories:
  - Programming
tags:
  - Julia
  - dataframes
  - data analyses
format: hugo-md
jupyter: julia-1.11
---


<script src="https://cdn.jsdelivr.net/npm/requirejs@2.3.6/require.min.js" integrity="sha384-c9c+LnTbwQ3aujuU7ULEPVvgLs+Fn6fJUvIGTsuu1ZcCf11fiEubah0ttpca4ntM sha384-6V1/AdqZRWk1KAlWbKBlGhN7VG4iE/yAZcO6NZPMF8od0vukrvr0tg4qY6NSrItx" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.min.js" integrity="sha384-ZvpUoO/+PpLXR1lu4jmpXWu80pZlYUAfxl5NsBMWOEPSjUn/6Z/hRTt8+pR6L4N2" crossorigin="anonymous" data-relocate-top="true"></script>
<script type="application/javascript">define('jquery', [],function() {return window.jQuery;})</script>


Adibide honetan, internetetik deskargatutako munduko herrialdeen populazio-datuekin egingo dut lan. Ikasgai hau YouTubeko bideo batean [^1] oinarrituta dago.

## Datuak inportatzen

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

## Datuen eraldaketa (Data wrangling)

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

Kontuz ibili, harridura-markak (`!`) jatorrizko taula ere aldatzen baitu! Gogoratu **ez** garela kopiak egiten ari, memoriako objektu berberetara zuzentzen duten erakusle (pointer) berriak sortzen baizik.

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

## Azpimultzoak hautatzea (Subsetting)

Kate bat (adibidez, herrialde baten izena) edo balio bat presente dagoen egiaztatzeko `in` operadorea erabili daiteke.

``` julia
"Tanzania" in wp.country
```

    true

Herrialde zehatz bat zein indizetan dagoen jakiteko `findall()` edo `findfirst()` funtzioak erabili ditzakegu.

``` julia
# funtzio anonimoekin
findall(x -> x == "Tanzania", wp.country)

# edo == funtzioa erabiliz
findall(==("Tanzania"), wp.country)
```

    1-element Vector{Int64}:
     21

Horrek gure dataframe-aren azpimultzoak hainbat modutan hautatzeko aukera ematen digu:

``` julia
# findall() edo findfirst() erabiliz
wp[findall(==("Tanzania"), wp.country), :]
```

<div><div style = "float: left;"><span>1×4 DataFrame</span></div><div style = "clear: both;"></div></div><div class = "data-frame" style = "overflow-x: scroll;">

| Row |    id | country  |  pop2024 | growth_rate |
|----:|------:|:---------|---------:|------------:|
|     | Int64 | String   |    Int64 |     Float64 |
|   1 |    21 | Tanzania | 69419073 |      0.0294 |

</div>

``` julia
# edo "broadcasting" bidez, R-ko sintaxiaren antzera
wp[wp.country .== "Tanzania", :]
```

<div><div style = "float: left;"><span>1×4 DataFrame</span></div><div style = "clear: both;"></div></div><div class = "data-frame" style = "overflow-x: scroll;">

| Row |    id | country  |  pop2024 | growth_rate |
|----:|------:|:---------|---------:|------------:|
|     | Int64 | String   |    Int64 |     Float64 |
|   1 |    21 | Tanzania | 69419073 |      0.0294 |

</div>

`wp.country .== "Tanzania"` adierazpenak `0` eta `1` balioez osatutako bektore bat itzultzen du, eta bektore hori errenkadak hautatzeko erabiltzen da.

[^1]: YouTube bideo [honetan](https://www.youtube.com/watch?v=TGFNEwVB9DU&list=PLhQ2JMBcfAsjZTA8_jGhz3BVqYgOeyyeu&index=7) oinarrituta.
