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
Q_{solar} + Q_{IR,in} + Q_{metab} = Q_{IR,out} + Q_{conv} + Q_{cond} + Q_{evap} + Q_{resp}
$$

Para una temperatura corporal estable, el calor que entra al cuerpo debe igualar al que sale. Cada término representa una vía física distinta.

### Definición de variables:
* **\(Q_{solar}\)**: Radiación solar de onda corta absorbida — la principal fuente de calor para la mayoría de los ectotermos
* **\(Q_{IR,in}\)**: Radiación infrarroja de onda larga absorbida del cielo y del suelo
* **\(Q_{metab}\)**: Producción de calor metabólico (a menudo insignificante en ectotermos pequeños)
* **\(Q_{IR,out}\)**: Radiación infrarroja de onda larga emitida
* **\(Q_{conv}\)**: Intercambio de calor por convección con el fluido circundante (aire o agua)
* **\(Q_{cond}\)**: Intercambio de calor por conducción con el sustrato
* **\(Q_{evap}\)**: Pérdida de calor por evaporación de agua desde la piel
* **\(Q_{resp}\)**: Pérdida de calor respiratorio por evaporación y convección desde los pulmones

Analicemos cada mecanismo de transferencia de calor.

---

## 1. Convección (\(Q_{conv}\))

La convección es la transferencia de calor entre un objeto y un fluido en movimiento (normalmente aire o agua). Esto es básicamente el "efecto de enfriamiento por viento" a la inversa — o hacia adelante.

La tasa de transferencia de calor por convección es:

$$
Q_{conv} = h_c A (T_s - T_a)
$$

* **\(h_c\)**: Coeficiente de transferencia de calor por convección (W m⁻² K⁻¹) — depende de la velocidad del viento y del tamaño y forma del animal.
* **\(A\)**: Área superficial característica de intercambio de calor (m²).
* **\(T_s\)**: Temperatura superficial del animal (°C o K).
* **\(T_a\)**: Temperatura ambiente del aire o agua (°C o K).

Los organismos pequeños tienen una **relación superficie-volumen** muy alta, lo que significa que la convección domina sus vidas. Un insecto diminuto tiene casi siempre la misma temperatura que el aire porque no puede "retener" el calor cuando sopla el viento.

**Estrategia ectoterma:** Muchas lagartijas orientan sus cuerpos para gestionar el intercambio convectivo. En mañanas frías, se colocan perpendiculares al viento para minimizar la pérdida de calor mientras toman el sol. Cuando se sobrecalientan, se enfrentan al viento y levantan sus cuerpos para maximizar el enfriamiento convectivo.

---

## 2. Conducción (\(Q_{cond}\))

La conducción es la transferencia de calor a través del contacto físico directo. Piensa en una lagartija con el vientre pegado a una losa de granito caliente. El calor se desplaza del objeto más cálido al más frío mediante colisiones moleculares.

La tasa de transferencia de calor por conducción sigue la **Ley de Fourier**:

$$
Q_{cond} = k_{sub} A_{contact} \frac{T_s - T_{sub}}{z}
$$

* **\(k_{sub}\)**: Conductividad térmica del sustrato (W m⁻¹ K⁻¹).
* **\(A_{contact}\)**: Área superficial en contacto con el suelo (m²).
* **\(T_s - T_{sub}\)**: Diferencia de temperatura entre la superficie y el sustrato (°C o K).
* **\(z\)**: Profundidad de conducción — espesor del sustrato a través del cual viaja el calor (m). En NicheMapR, el valor predeterminado es 2.5 cm.

**Estrategia ectoterma:** Para calentarse rápido, las lagartijas aplastan sus cuerpos contra las rocas cálidas (aumentando \(A_{contact}\)). Para enfriarse, se elevan sobre sus patas ("stilting") para minimizar el área de contacto y dejar que el aire fluya por debajo.

---

## 3. Radiación infrarroja (\(Q_{IR,in}\) y \(Q_{IR,out}\))

Todo objeto con temperatura superior al cero absoluto emite radiación infrarroja térmica. Para un ectotermo, el equilibrio entre la radiación infrarroja entrante y saliente es una parte importante del presupuesto energético.

La radiación infrarroja **saliente** emitida por un organismo sigue la **Ley de Stefan-Boltzmann**:

$$
Q_{IR,out} = A \epsilon \sigma T_s^4
$$

* **\(A\)**: Área de superficie radiativa (m²).
* **\(\epsilon\)**: Emisividad de la superficie — eficiencia con la que irradia infrarrojo (adimensional, típicamente cercano a 1 para superficies biológicas).
* **\(\sigma\)**: Constante de Stefan-Boltzmann (\(5.67 \times 10^{-8} \, \mathrm{W \, m^{-2} \, K^{-4}}\)).
* **\(T_s\)**: Temperatura superficial absoluta (K).

Los organismos también **absorben** radiación infrarroja de su entorno — del cielo y del suelo. Este flujo entrante \(Q_{IR,in}\) depende de la temperatura de las superficies circundantes y de la postura del organismo.

**Estrategia ectoterma:** Las lagartijas nocturnas pierden calor hacia el cielo despejado mediante emisión infrarroja. En noches nubladas, las nubes reflejan la radiación infrarroja de vuelta, reduciendo la pérdida de calor y manteniendo a la lagartija más cálida — un fenómeno análogo al efecto invernadero.

---

## 4. Radiación solar (\(Q_{solar}\))

Esta es la fuente de energía principal para la mayoría de los ectotermos. La radiación solar llega como luz solar directa, luz difusa del cielo y radiación reflejada por el suelo y la vegetación.

El calor solar absorbido es:

$$
Q_{solar} = A_d a S
$$

* **\(A_d\)**: Área proyectada del animal expuesta al sol — la sombra que proyecta (m²).
* **\(a\)**: Absortividad solar — fracción de la energía solar entrante que se absorbe (adimensional, equivale a \(1 - \text{albedo}\)).
* **\(S\)**: Flujo de radiación solar entrante (W m⁻²).

**Estrategia ectoterma:** Una lagartija de color oscuro absorbe más energía solar que una de color claro — la diferencia puede ser de varios grados de temperatura corporal. Muchas especies pueden cambiar de color (cambio fisiológico de color) para regular su ganancia solar. La postura también importa: aplanar el cuerpo maximiza el área proyectada \(A_d\) para un calentamiento rápido, mientras que alinearse con los rayos solares la minimiza.

---

## 5. Evaporación (\(Q_{evap}\))

La evaporación es el "freno de emergencia" de la termorregulación. Se requiere una gran cantidad de energía para convertir agua líquida en vapor — el calor latente de vaporización.

La pérdida de calor por evaporación depende del gradiente de densidad de vapor entre la piel y el aire:

$$
Q_{evap} = A \, h_d \, (\rho_{skin} - \rho_{air}) \, \Delta H_{vap}
$$

* **\(A\)**: Área superficial de evaporación (m²).
* **\(h_d\)**: Coeficiente de transferencia de masa (m s⁻¹).
* **\(\rho_{skin}\)**: Densidad de vapor de agua en la piel (kg m⁻³).
* **\(\rho_{air}\)**: Densidad de vapor de agua del aire circundante (kg m⁻³).
* **\(\Delta H_{vap}\)**: Calor latente de vaporización (J kg⁻¹).

Aunque los ectotermos no "sudan" como los humanos, pierden agua a través de la piel y las vías respiratorias. La fracción de piel que actúa como superficie de agua libre (a menudo llamada **pct_wet** en los modelos) es un rasgo fisiológico clave que determina cuánto enfriamiento evaporativo es posible.

**Estrategia ectoterma:** En calor extremo, algunas lagartijas jadean (**aleteo gular**) para aumentar el enfriamiento evaporativo a través de las superficies húmedas de la boca y la garganta. Este es el mecanismo principal que Ray Huey analiza al examinar los "costes" de la actividad a altas temperaturas. Los anfibios dependen aún más de la evaporación: una rana de piel húmeda puede mantener su temperatura corporal por debajo de la temperatura del aire mediante enfriamiento evaporativo, pero a costa de una pérdida constante de agua.

---

## 6. Metabolismo (\(Q_{metab}\))

Todos los organismos producen calor como subproducto del metabolismo celular. Para los ectotermos pequeños, este calor suele ser insignificante en comparación con los flujos ambientales (típicamente menos del 5% del total). Para los endotermos (aves y mamíferos), es la fuente de calor dominante que mantiene una temperatura corporal estable y elevada.

La producción de calor metabólico sigue una relación alométrica-Arrhenius general:

$$
Q_{metab} = f(M, T_b, \text{actividad})
$$

* **\(M\)**: Masa corporal (kg).
* **\(T_b\)**: Temperatura corporal (°C o K).
* **actividad**: Estado comportamental — reposo, actividad o digestión.

La tasa metabólica aumenta con el tamaño corporal pero a un ritmo menos que lineal (proporcional a \(M^{0.75}\) en la mayoría de los organismos) y aumenta exponencialmente con la temperatura corporal mediante el factor de Boltzmann-Arrhenius.

**Estrategia ectoterma:** Aunque el calor metabólico es insignificante para la termorregulación, el *coste metabólico* de la actividad importa enormemente para el presupuesto energético. Una lagartija que busca alimento gasta mucha más energía que una en reposo — y cuanto más calor hace, más rápido consume sus reservas energéticas.

---

## Resumen

Para un ectotermo, **el comportamiento es el termostato**. Dado que no pueden quemar calorías para generar calor significativo, deben navegar por un complejo mapa espacial de variables físicas — sol, sombra, viento, rocas y agua — para encontrar el equilibrio adecuado. Son, esencialmente, físicos vivientes que resuelven constantemente su ecuación de balance de calor moviéndose entre microambientes.

La ecología biofísica nos proporciona las herramientas para cuantificar este proceso, convirtiendo el comportamiento animal en un problema físico resoluble.
