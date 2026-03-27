---
title: Creación de gráficos con Makie.jl
author: Urtzi Enriquez-Urzelai
date: 2025-03-26T00:00:00.000Z
weight: 20
series:
  - Julia Tutoriales
series_order: 2
showPagination: false
summary: Una visión general sobre cómo crear gráficos con el framework Makie en Julia
tags:
  - Julia
  - plotting
  - data analyses
format: hugo-md
jupyter: julia-1.11
---


``` julia
using CairoMakie
using RDatasets
using DataFramesMeta: @with
using CategoricalArrays: levelcode

iris = dataset("datasets", "iris")
typeof(iris)

# Gráfico de dispersión simple
scatter(iris.SepalLength, iris.PetalLength)
```

<pre><span class="ansi-yellow-fg ansi-bold">┌ </span><span class="ansi-yellow-fg ansi-bold">Warning: </span>Found `resolution` in the theme when creating a `Scene`. The `resolution` keyword for `Scene`s and `Figure`s has been deprecated. Use `Figure(; size = ...` or `Scene(; size = ...)` instead, which better reflects that this is a unitless size and not a pixel resolution. The key could also come from `set_theme!` calls or related theming functions.

<span class="ansi-yellow-fg ansi-bold">└ </span><span class="ansi-bright-black-fg">@ Makie ~/.julia/packages/Makie/kJl0u/src/scenes.jl:264</span>
</pre>

![](index.es_files/figure-markdown_strict/cell-2-output-2.svg)

``` julia
# Estructura básica de Makie
f = Figure();

ax = Axis(f[1, 1],
    xlabel="eje-x",
    ylabel="eje-y",
    title="Gráfico increíble")
f
```

<pre><span class="ansi-yellow-fg ansi-bold">┌ </span><span class="ansi-yellow-fg ansi-bold">Warning: </span>Found `resolution` in the theme when creating a `Scene`. The `resolution` keyword for `Scene`s and `Figure`s has been deprecated. Use `Figure(; size = ...` or `Scene(; size = ...)` instead, which better reflects that this is a unitless size and not a pixel resolution. The key could also come from `set_theme!` calls or related theming functions.

<span class="ansi-yellow-fg ansi-bold">└ </span><span class="ansi-bright-black-fg">@ Makie ~/.julia/packages/Makie/kJl0u/src/scenes.jl:264</span>
</pre>

![](index.es_files/figure-markdown_strict/cell-3-output-2.svg)

``` julia
# Gráfico de líneas
x = LinRange(-10, 10, 1000)
y = cos.(x)
obj = lines(x, y)
```

<pre><span class="ansi-yellow-fg ansi-bold">┌ </span><span class="ansi-yellow-fg ansi-bold">Warning: </span>Found `resolution` in the theme when creating a `Scene`. The `resolution` keyword for `Scene`s and `Figure`s has been deprecated. Use `Figure(; size = ...` or `Scene(; size = ...)` instead, which better reflects that this is a unitless size and not a pixel resolution. The key could also come from `set_theme!` calls or related theming functions.

<span class="ansi-yellow-fg ansi-bold">└ </span><span class="ansi-bright-black-fg">@ Makie ~/.julia/packages/Makie/kJl0u/src/scenes.jl:264</span>
</pre>

![](index.es_files/figure-markdown_strict/cell-4-output-2.svg)

``` julia
typeof(obj)
```

    Makie.FigureAxisPlot

``` julia
# Graficar en el mismo panel
fig, axs, plot = lines(x, y)
lines!(axs, x, sin.(x))
fig
```

<pre><span class="ansi-yellow-fg ansi-bold">┌ </span><span class="ansi-yellow-fg ansi-bold">Warning: </span>Found `resolution` in the theme when creating a `Scene`. The `resolution` keyword for `Scene`s and `Figure`s has been deprecated. Use `Figure(; size = ...` or `Scene(; size = ...)` instead, which better reflects that this is a unitless size and not a pixel resolution. The key could also come from `set_theme!` calls or related theming functions.

<span class="ansi-yellow-fg ansi-bold">└ </span><span class="ansi-bright-black-fg">@ Makie ~/.julia/packages/Makie/kJl0u/src/scenes.jl:264</span>
</pre>

![](index.es_files/figure-markdown_strict/cell-6-output-2.svg)

``` julia
# Crear paneles adicionales (ejes)
fig, ax1, plot = lines(x, sin)
ax2 = Axis(fig[2, 1])
lines!(ax2, x, cos, color=:tomato)
fig
```

<pre><span class="ansi-yellow-fg ansi-bold">┌ </span><span class="ansi-yellow-fg ansi-bold">Warning: </span>Found `resolution` in the theme when creating a `Scene`. The `resolution` keyword for `Scene`s and `Figure`s has been deprecated. Use `Figure(; size = ...` or `Scene(; size = ...)` instead, which better reflects that this is a unitless size and not a pixel resolution. The key could also come from `set_theme!` calls or related theming functions.

<span class="ansi-yellow-fg ansi-bold">└ </span><span class="ansi-bright-black-fg">@ Makie ~/.julia/packages/Makie/kJl0u/src/scenes.jl:264</span>
</pre>

![](index.es_files/figure-markdown_strict/cell-7-output-2.svg)

``` julia
# Probando con el conjunto de datos iris
fig_iris = Figure();
ax_iris = Axis(fig_iris[1, 1],
    xlabel="Longitud del pétalo",
    ylabel="Ancho del pétalo")

colors_sp = [:red, :green, :purple]

for (i, sp) in enumerate(unique(iris.Species))
    index = findall(==(sp), iris.Species)
    scatter!(ax_iris, iris.PetalLength[index], iris.PetalWidth[index],
        color=colors_sp[i],
        label=string(sp))
end
axislegend(framevisible=false, position=:lt, labelsize=10)
```

<pre><span class="ansi-yellow-fg ansi-bold">┌ </span><span class="ansi-yellow-fg ansi-bold">Warning: </span>Found `resolution` in the theme when creating a `Scene`. The `resolution` keyword for `Scene`s and `Figure`s has been deprecated. Use `Figure(; size = ...` or `Scene(; size = ...)` instead, which better reflects that this is a unitless size and not a pixel resolution. The key could also come from `set_theme!` calls or related theming functions.

<span class="ansi-yellow-fg ansi-bold">└ </span><span class="ansi-bright-black-fg">@ Makie ~/.julia/packages/Makie/kJl0u/src/scenes.jl:264</span>
</pre>

    Legend()

``` julia
ax2_iris = Axis(fig_iris[1, 2],
    xlabel="Longitud del pétalo",
    ylabel="Longitud del sépalo")
scatter!(ax2_iris, iris.PetalLength, iris.SepalLength,
    color=levelcode.(iris.Species))

# Vincular ejes Y
linkyaxes!(ax_iris, ax2_iris)

ax3_iris = Axis(fig_iris[2, :],
    xlabel="Longitud del sépalo",
    ylabel="Ancho del sépalo")
scatter!(ax3_iris, iris.SepalLength, iris.SepalWidth)

fig_iris
```

![](index.es_files/figure-markdown_strict/cell-9-output-1.svg)

``` julia
using ColorSchemes
import ColorSchemes.viridis

colors_sp = [viridis[0.0], viridis[0.5], viridis[1.0]]

# Definición de un tema personalizado
my_theme = Theme(
    Axis = (
        topspinevisible = false,
        rightspinevisible = false,
        ygridvisible = false,
        xgridvisible = false,
    )
)

@with iris begin
    with_theme(my_theme) do
        fig_iris = Figure()

        ax_iris = Axis(fig_iris[1, 1],
            xlabel="Longitud del pétalo",
            ylabel="Ancho del pétalo")
        for (i, sp) in enumerate(unique(:Species))
            index = findall(==(sp), :Species)
            scatter!(ax_iris, :PetalLength[index], :PetalWidth[index],
                color=colors_sp[i],
                label=string(sp))

        end
        axislegend(framevisible=false, position=Symbol("lt"), labelsize=10)

        ax2_iris = Axis(fig_iris[1, 2],
            xlabel="Longitud del pétalo",
            ylabel="Longitud del sépalo")
        for (i, sp) in enumerate(unique(:Species))
            index = findall(==(sp), :Species)
            scatter!(ax2_iris, :PetalLength[index], :SepalLength[index],
                color=colors_sp[i],
                label=string(sp))
        end
        linkyaxes!(ax_iris, ax2_iris)

        ax3_iris = Axis(fig_iris[2, :],
            xlabel="Longitud del sépalo",
            ylabel="Ancho del sépalo")
        for (i, sp) in enumerate(unique(:Species))
            index = findall(==(sp), :Species)
            scatter!(ax3_iris, :SepalLength[index], :SepalWidth[index],
                color=colors_sp[i],
                label=string(sp))
        end
        
        fig_iris
    end
end
```

![](index.es_files/figure-markdown_strict/cell-10-output-1.svg)
