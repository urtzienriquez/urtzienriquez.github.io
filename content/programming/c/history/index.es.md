---
title: "Una breve historia de C"
author: Urtzi Enriquez-Urzelai
date: 2026-11-10
series: ["C Tutorials"]
series_order: 1
showPagination: false
summary: "De dónde viene C, cómo se convirtió en el lenguaje que hay debajo de casi todo y por qué todavía merece la pena aprenderlo."
categories: ["Programming"]
tags: ["C", "history"]
---

Antes de escribir código en C, me pareció buena idea empezar esta serie con un poco de historia. C tiene más de 50 años y, aun así, sigue estando en todas partes, así que merece la pena saber de dónde viene.

## De BCPL a B y a C

La historia empieza a finales de los años 60. En 1967, Martin Richards diseñó **BCPL**, un lenguaje sencillo para escribir compiladores. En los Laboratorios Bell, Ken Thompson tomó BCPL y lo simplificó todavía más hasta crear un lenguaje aún más pequeño, **B** (1969), que cabía en la escasa memoria de los ordenadores con los que trabajaba.

Sin embargo, B tenía un problema: no tenía tipos de datos. Todo era una "palabra" de la máquina, lo que funcionaba bien en los ordenadores antiguos, pero no en el nuevo PDP-11, que podía direccionar bytes individuales. Entre 1971 y 1973, Dennis Ritchie amplió B con tipos (`char`, `int` y, más tarde, estructuras) y un compilador de verdad. El resultado se llamó primero "New B" y después, simplemente, **C**.

## Unix reescrito en C

C no surgió de la nada: se creó para escribir **Unix**. Thompson y Ritchie habían escrito las primeras versiones de Unix en ensamblador, lo que ataba el sistema a una máquina concreta. En 1973 reescribieron la mayor parte del núcleo de Unix en C. Fue algo bastante radical para la época, ya que se esperaba que los sistemas operativos se escribieran en ensamblador por velocidad.

Resultó ser una gran decisión. Como Unix estaba escrito en un lenguaje de relativamente alto nivel, se podía llevar a máquinas nuevas escribiendo un compilador de C para ellas y recompilando. Unix y C se extendieron juntos por universidades y empresas durante los años 70, y cada uno ayudó al otro a hacerse popular.

## K&R y "hello, world"

En 1978, Brian Kernighan y Dennis Ritchie publicaron *The C Programming Language*, un libro breve y claro conocido simplemente como **K&R**. Durante más de una década, este libro fue la definición de facto del lenguaje. También popularizó la tradición de que tu primer programa imprima "hello, world":

```c
main()
{
    printf("hello, world\n");
}
```

Un compilador moderno te pediría añadir `#include <stdio.h>` al principio y escribir `int main(void)`, pero ¡sigue siendo C reconocible casi 50 años después!

## Estandarización

A medida que C se extendía, cada compilador empezó a añadir sus propias extensiones, y el código escrito para un compilador no siempre funcionaba en otro. Para solucionarlo, el Instituto Nacional Estadounidense de Estándares (ANSI) publicó un estándar en 1989 (**C89**), que ISO adoptó al año siguiente (**C90**). Desde entonces, el lenguaje ha evolucionado de forma lenta y cuidadosa a través de nuevos estándares: **C99**, **C11**, **C17** y, más recientemente, **C23**. Cada versión añade cosas útiles (por ejemplo, comentarios con `//`, nuevos tipos de enteros o mejor soporte para multihilo) sin dejar de ser compatible con el código antiguo.

## Legado

Es difícil exagerar lo influyente que ha sido C. Su sintaxis (llaves, bucles `for`, `++`, etc.) la tomaron prestada C++, Objective-C, Java, C#, JavaScript y Go, entre muchos otros. Thompson y Ritchie recibieron el Premio Turing en 1983 por su trabajo en Unix.

C es también la base de la mayor parte del software que usamos a diario. El núcleo de Linux está escrito en C, al igual que la implementación de referencia de Python (CPython), la mayor parte del intérprete de R y buena parte del entorno de ejecución (runtime) de Julia.

## ¿Por qué aprender C hoy?

Para quienes nos dedicamos a la ciencia y usamos sobre todo R o Julia, C puede parecer innecesario. Pero aprenderlo te enseña cómo funcionan realmente la memoria, los tipos de datos y la compilación, lo que ayuda a escribir código más rápido en cualquier lenguaje. Y cuando R o Julia no son lo bastante rápidos, puedes escribir la parte lenta en C y llamarla desde R (con `.Call`) o desde Julia (con `ccall`).

Hacia ahí va esta serie. En las próximas publicaciones empezaremos a escribir, compilar y ejecutar algo de código en C. ¡Atentos!
