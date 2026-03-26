---
title: "Benchmarking future.apply"
date: 2026-03-25
weight: 10
summary: "A very brief introduction on using the DataFrames package in Julia"
tags: ["R", "programming", "loops", "parallelization"]
output: hugodown::md_document
rmd_hash: c7e926ff014f0802

---

## The Three Contenders

1.  **Standard `for` loop**: Manual iteration (pre-allocated).
2.  **`lapply`**: The functional, sequential R standard.
3.  **`future_lapply`**: The parallelized version.

------------------------------------------------------------------------

## Experiment 1: The "Cheap" Task

In this scenario, we do something very fast: calculating the mean of 1,000 numbers.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>n</span> <span class='o'>&lt;-</span> <span class='m'>200</span></span>
<span><span class='nv'>data_list</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://rdrr.io/r/base/lapply.html'>replicate</a></span><span class='o'>(</span><span class='nv'>n</span>, <span class='nf'><a href='https://rdrr.io/r/stats/Normal.html'>rnorm</a></span><span class='o'>(</span><span class='m'>1000</span><span class='o'>)</span>, simplify <span class='o'>=</span> <span class='kc'>FALSE</span><span class='o'>)</span></span>
<span></span>
<span><span class='nv'>bench_cheap</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://rdrr.io/pkg/microbenchmark/man/microbenchmark.html'>microbenchmark</a></span><span class='o'>(</span></span>
<span>  for_loop <span class='o'>=</span> <span class='o'>&#123;</span></span>
<span>    <span class='nv'>res_for</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://rdrr.io/r/base/vector.html'>vector</a></span><span class='o'>(</span><span class='s'>"list"</span>, <span class='nv'>n</span><span class='o'>)</span></span>
<span>    <span class='kr'>for</span><span class='o'>(</span><span class='nv'>i</span> <span class='kr'>in</span> <span class='m'>1</span><span class='o'>:</span><span class='nv'>n</span><span class='o'>)</span> <span class='nv'>res_for</span><span class='o'>[[</span><span class='nv'>i</span><span class='o'>]</span><span class='o'>]</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://rdrr.io/r/base/mean.html'>mean</a></span><span class='o'>(</span><span class='nv'>data_list</span><span class='o'>[[</span><span class='nv'>i</span><span class='o'>]</span><span class='o'>]</span><span class='o'>)</span></span>
<span>  <span class='o'>&#125;</span>,</span>
<span>  standard_apply <span class='o'>=</span> <span class='nf'><a href='https://rdrr.io/r/base/lapply.html'>lapply</a></span><span class='o'>(</span><span class='nv'>data_list</span>, <span class='nv'>mean</span><span class='o'>)</span>,</span>
<span>  future_apply   <span class='o'>=</span> <span class='nf'><a href='https://future.apply.futureverse.org/reference/future_lapply.html'>future_lapply</a></span><span class='o'>(</span><span class='nv'>data_list</span>, <span class='nv'>mean</span><span class='o'>)</span>,</span>
<span>  times <span class='o'>=</span> <span class='m'>10</span></span>
<span><span class='o'>)</span></span>
<span></span>
<span><span class='c'># Generate Table</span></span>
<span><span class='nf'><a href='https://rdrr.io/pkg/knitr/man/kable.html'>kable</a></span><span class='o'>(</span><span class='nf'><a href='https://rdrr.io/r/base/summary.html'>summary</a></span><span class='o'>(</span><span class='nv'>bench_cheap</span><span class='o'>)</span>, caption <span class='o'>=</span> <span class='s'>"Cheap Task Results (milliseconds)"</span><span class='o'>)</span></span>
</code></pre>

| expr           |       min |        lq |       mean |    median |         uq |        max | neval |
|:------------|--------:|--------:|---------:|--------:|---------:|---------:|-----:|
| for_loop       |  1608.359 |  1670.975 |  2190.1166 |  1903.875 |   2669.886 |   3709.897 |    10 |
| standard_apply |   587.176 |   595.874 |   947.8083 |   867.347 |   1267.916 |   1548.279 |    10 |
| future_apply   | 43543.992 | 46387.785 | 84049.1765 | 99176.992 | 102294.771 | 133827.555 |    10 |

Cheap Task Results (milliseconds)

<pre class='chroma'><code class='language-r' data-lang='r'><span></span>
<span><span class='c'># Generate Figure</span></span>
<span><span class='nf'><a href='https://ggplot2.tidyverse.org/reference/autoplot.html'>autoplot</a></span><span class='o'>(</span><span class='nv'>bench_cheap</span><span class='o'>)</span> <span class='o'>+</span> <span class='nf'><a href='https://ggplot2.tidyverse.org/reference/labs.html'>labs</a></span><span class='o'>(</span>title <span class='o'>=</span> <span class='s'>"Cheap Task: Parallel Overhead is Visible"</span><span class='o'>)</span></span>
<span><span class='c'>#&gt; Warning: `aes_string()` was deprecated in ggplot2 3.0.0.</span></span>
<span><span class='c'>#&gt; <span style='color: #00BBBB;'>ℹ</span> Please use tidy evaluation idioms with `aes()`.</span></span>
<span><span class='c'>#&gt; <span style='color: #00BBBB;'>ℹ</span> See also `vignette("ggplot2-in-packages")` for more information.</span></span>
<span><span class='c'>#&gt; <span style='color: #00BBBB;'>ℹ</span> The deprecated feature was likely used in the <span style='color: #0000BB;'>microbenchmark</span> package.</span></span>
<span><span class='c'>#&gt;   Please report the issue at</span></span>
<span><span class='c'>#&gt;   <span style='color: #0000BB; font-style: italic;'>&lt;https://github.com/joshuaulrich/microbenchmark/issues/&gt;</span>.</span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'>This warning is displayed once per session.</span></span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'>Call `lifecycle::last_lifecycle_warnings()` to see where this warning was</span></span></span>
<span><span class='c'>#&gt; <span style='color: #555555;'>generated.</span></span></span>
<span></span></code></pre>
<img src="figs/cheap_benchmark-1.png" alt="" width="700px" style="display: block; margin: auto;" />

</div>

------------------------------------------------------------------------

## Experiment 2: The "Expensive" Task

In this scenario, we simulate "heavy" work by adding a tiny delay (`Sys.sleep`). This mimics complex statistical modeling or web scraping.

<div class="highlight">

<pre class='chroma'><code class='language-r' data-lang='r'><span><span class='nv'>n_heavy</span> <span class='o'>&lt;-</span> <span class='m'>20</span></span>
<span><span class='nv'>data_heavy</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://rdrr.io/r/base/lapply.html'>replicate</a></span><span class='o'>(</span><span class='nv'>n_heavy</span>, <span class='nf'><a href='https://rdrr.io/r/stats/Normal.html'>rnorm</a></span><span class='o'>(</span><span class='m'>10</span><span class='o'>)</span>, simplify <span class='o'>=</span> <span class='kc'>FALSE</span><span class='o'>)</span></span>
<span></span>
<span><span class='c'># A function that takes 0.1 seconds per call</span></span>
<span><span class='nv'>heavy_func</span> <span class='o'>&lt;-</span> <span class='kr'>function</span><span class='o'>(</span><span class='nv'>x</span><span class='o'>)</span> <span class='o'>&#123;</span></span>
<span>  <span class='nf'><a href='https://rdrr.io/r/base/Sys.sleep.html'>Sys.sleep</a></span><span class='o'>(</span><span class='m'>0.1</span><span class='o'>)</span></span>
<span>  <span class='nf'><a href='https://rdrr.io/r/base/mean.html'>mean</a></span><span class='o'>(</span><span class='nv'>x</span><span class='o'>)</span></span>
<span><span class='o'>&#125;</span></span>
<span></span>
<span><span class='nv'>bench_expensive</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://rdrr.io/pkg/microbenchmark/man/microbenchmark.html'>microbenchmark</a></span><span class='o'>(</span></span>
<span>  for_loop <span class='o'>=</span> <span class='o'>&#123;</span></span>
<span>    <span class='nv'>res_for</span> <span class='o'>&lt;-</span> <span class='nf'><a href='https://rdrr.io/r/base/vector.html'>vector</a></span><span class='o'>(</span><span class='s'>"list"</span>, <span class='nv'>n_heavy</span><span class='o'>)</span></span>
<span>    <span class='kr'>for</span><span class='o'>(</span><span class='nv'>i</span> <span class='kr'>in</span> <span class='m'>1</span><span class='o'>:</span><span class='nv'>n_heavy</span><span class='o'>)</span> <span class='nv'>res_for</span><span class='o'>[[</span><span class='nv'>i</span><span class='o'>]</span><span class='o'>]</span> <span class='o'>&lt;-</span> <span class='nf'>heavy_func</span><span class='o'>(</span><span class='nv'>data_heavy</span><span class='o'>[[</span><span class='nv'>i</span><span class='o'>]</span><span class='o'>]</span><span class='o'>)</span></span>
<span>  <span class='o'>&#125;</span>,</span>
<span>  standard_apply <span class='o'>=</span> <span class='nf'><a href='https://rdrr.io/r/base/lapply.html'>lapply</a></span><span class='o'>(</span><span class='nv'>data_heavy</span>, <span class='nv'>heavy_func</span><span class='o'>)</span>,</span>
<span>  future_apply   <span class='o'>=</span> <span class='nf'><a href='https://future.apply.futureverse.org/reference/future_lapply.html'>future_lapply</a></span><span class='o'>(</span><span class='nv'>data_heavy</span>, <span class='nv'>heavy_func</span><span class='o'>)</span>,</span>
<span>  times <span class='o'>=</span> <span class='m'>2</span> <span class='c'># Low iterations because it's slow!</span></span>
<span><span class='o'>)</span></span>
<span></span>
<span><span class='c'># Generate Table</span></span>
<span><span class='nf'><a href='https://rdrr.io/pkg/knitr/man/kable.html'>kable</a></span><span class='o'>(</span><span class='nf'><a href='https://rdrr.io/r/base/summary.html'>summary</a></span><span class='o'>(</span><span class='nv'>bench_expensive</span><span class='o'>)</span>, caption <span class='o'>=</span> <span class='s'>"Expensive Task Results (seconds)"</span><span class='o'>)</span></span>
</code></pre>

| expr           |       min |        lq |      mean |    median |        uq |       max | neval |
|:------------|--------:|--------:|--------:|--------:|--------:|--------:|-----:|
| for_loop       | 2010.7866 | 2010.7866 | 2014.4950 | 2014.4950 | 2018.2033 | 2018.2033 |     2 |
| standard_apply | 2008.7650 | 2008.7650 | 2011.7931 | 2011.7931 | 2014.8213 | 2014.8213 |     2 |
| future_apply   |  279.5349 |  279.5349 |  292.0067 |  292.0067 |  304.4786 |  304.4786 |     2 |

Expensive Task Results (seconds)

<pre class='chroma'><code class='language-r' data-lang='r'><span></span>
<span><span class='c'># Generate Figure</span></span>
<span><span class='nf'><a href='https://ggplot2.tidyverse.org/reference/autoplot.html'>autoplot</a></span><span class='o'>(</span><span class='nv'>bench_expensive</span><span class='o'>)</span> <span class='o'>+</span> <span class='nf'><a href='https://ggplot2.tidyverse.org/reference/labs.html'>labs</a></span><span class='o'>(</span>title <span class='o'>=</span> <span class='s'>"Expensive Task: Future Wins Big"</span><span class='o'>)</span></span>
</code></pre>
<img src="figs/expensive_benchmark-1.png" alt="" width="700px" style="display: block; margin: auto;" />

</div>

