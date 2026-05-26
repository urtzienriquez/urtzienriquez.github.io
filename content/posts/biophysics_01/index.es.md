---
title: "Conceptos básicos de Ecología Biofísica"
description: "Serie de Ecología Biofísica - 01"
date: 2026-03-27
series: ["Ecología Biofísica"]
series_order: 1
categories: ["Ecology"]
tags: ["biophysics", "modelling"]
---

{{< katex >}}

# Conceptos básicos de Ecología Biofísica

Bienvenidos a la primera entrega de nuestra serie. Si alguna vez te has preguntado por qué una lagartija pasa la mañana inmóvil sobre una roca o por qué un escarabajo del desierto se pone de cabeza en la niebla, ya estás observando la **Ecología Biofísica**.

En su esencia, este campo trata sobre el **balance de energía (o mejor dicho, de calor)**. Para un ectotermo —un organismo que depende de fuentes de calor ambientales— mantenerse vivo es un juego constante de equilibrar los "ingresos" de energía frente a los "gastos". Si el presupuesto falla, el organismo se congela (el metabolismo se detiene) o se cocina (las proteínas se desnaturalizan).

---

## La Ecuación Fundamental del Balance Energético

Para entender cómo interactúa un organismo con su entorno, utilizamos la ecuación del balance energético en estado estacionario. Bajo el marco de Porter y Kearney, vemos al animal como un sistema termodinámico:

$$
Q_{abs} + Q_{gen} = Q_{out} + Q_{conv} + Q_{evap} + Q_{cond} + Q_{resp} + S
$$

### Definición de variables:
* **\(Q_{abs}\)**: Radiación total absorbida (solar de onda corta + infrarroja de onda larga)
* **\(Q_{gen}\)**: Producción de calor metabólico (a menudo insignificante en pequeños ectotermos)
* **\(Q_{out}\)**: Radiación neta de onda larga emitida por la superficie
* **\(Q_{conv}\)**: Intercambio de calor por convección con el fluido (aire/agua)
* **\(Q_{evap}\)**: Pérdida de calor latente por evaporación
* **\(Q_{cond}\)**: Intercambio por conducción con el sustrato
* **\(Q_{resp}\)**: Pérdida de calor respiratorio (evaporativa + convectiva de los pulmones)
* **\(S\)**: Almacenamiento de calor (\(S = c_p M \, dT_b/dt\); cero en estado estacionario)

Para que un animal mantenga una temperatura corporal estable, **\(S\) debe ser cero**. Analicemos los principales mecanismos de transferencia de calor que nos llevan a ese punto.

---

## 1. Conducción (\(Q_{cond}\))
La conducción es la transferencia de calor a través del contacto físico directo. Piensa en una lagartija con el vientre pegado a una losa de granito caliente. El calor se desplaza del objeto con mayor temperatura al de menor temperatura mediante colisiones moleculares.

La tasa de transferencia de calor por conducción se rige por la **Ley de Fourier**:

$$
Q_{cond} = k_{sub} A_{contact} \frac{T_s - T_{sub}}{z}
$$

* **\(k_{sub}\)**: Conductividad térmica del sustrato.
* **\(A_{contact}\)**: Área superficial en contacto con el suelo.
* **\(T_s - T_{sub}\)**: Gradiente de temperatura entre la superficie y el sustrato.
* **\(z\)**: Profundidad de conducción — espesor del sustrato a través del cual viaja el calor.

**Estrategia ectoterma:** Para calentarse rápido, las lagartijas aumentan su área de contacto (\(A_{contact}\)) aplanando sus cuerpos contra las rocas cálidas. Para enfriarse, pueden elevarse sobre sus patas ("stilting") para crear un espacio de aire.

---

## 2. Convección (\(Q_{conv}\))
La convección es la transferencia de calor entre un objeto y un fluido en movimiento (normalmente aire o agua). Esto es básicamente el "efecto de enfriamiento por viento" a la inversa (o hacia adelante).

La descripción matemática suele simplificarse como:

$$
Q_{conv} = h_c A (T_s - T_a)
$$

* **\(h_c\)**: El coeficiente de convección (depende de la velocidad del viento y del tamaño/forma del animal).
* **\(T_s\)**: Temperatura superficial del animal.
* **\(T_a\)**: Temperatura ambiente del aire o agua.

Los organismos pequeños tienen una **relación superficie-volumen** muy alta, lo que significa que la convección domina sus vidas. Un insecto diminuto tiene casi siempre la misma temperatura que el aire porque no puede "retener" el calor cuando sopla el viento.

---

## 3. Evaporación (\(Q_{evap}\))
La evaporación es el "freno de emergencia" de la termorregulación. Se requiere una gran cantidad de energía para convertir el agua líquida en vapor (el calor latente de vaporización, \(\lambda\)).

La pérdida de calor por evaporación es:

$$
Q_{evap} = \dot{m}_{evap} \lambda
$$

* **\(\dot{m}_{evap}\)**: Tasa de flujo de masa de la evaporación.
* **\(\lambda\)**: Calor latente de vaporización.

Aunque los ectotermos no "sudan" como los humanos, pierden agua a través de la piel y las vías respiratorias. En calor extremo, algunas lagartijas jadean (**aleteo gular**) para acelerar el enfriamiento evaporativo. Este es el mecanismo principal que Ray Huey analiza al examinar los "costes" de la actividad a altas temperaturas.

---

## 4. Radiación (\(Q_{abs}\) y \(Q_{out}\))
Este es el factor principal. Los ectotermos funcionan principalmente con "energía solar". Absorben radiación de onda corta del sol y radiación de onda larga del cielo y del suelo.

La energía emitida por un organismo se define por la **Ley de Stefan-Boltzmann**:

$$
Q_{out} = A \epsilon \sigma T_s^4
$$

* **\(A\)**: Área de superficie radiativa (m²).
* **\(\epsilon\)**: Emisividad (qué tan "negro" es el objeto en el espectro infrarrojo).
* **\(\sigma\)**: Constante de Stefan-Boltzmann (\(5.67 \times 10^{-8} W m^{-2} K^{-4}\)).
* **\(T_s\)**: Temperatura superficial en Kelvin.

---

## Resumen
Para un ectotermo, **el comportamiento es el termostato**. Dado que no pueden quemar calorías para generar calor significativo (\(Q_{gen} \approx 0\)), deben navegar por un complejo mapa espacial de variables físicas. Son, esencialmente, físicos vivientes que resuelven constantemente la \(T_b\) (temperatura corporal) moviéndose entre el sol y la sombra, la roca y el aire.
