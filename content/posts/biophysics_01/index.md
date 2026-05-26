---
title: "The very Basics of Biophysical Ecology"
description: "Biophysical Ecology series - 01"
date: 2026-03-27
series: ["Biophysical Ecology"]
series_order: 1
categories: ["Ecology"]
tags: ["biophysics", "modelling"]
---

{{< katex >}}

# The very Basics of Biophysical Ecology

Welcome to the first entry of our series. If you've ever wondered why a lizard spends its morning motionless on a rock or why a desert beetle stands on its head in the fog, you're already looking at **Biophysical Ecology**. 

At its core, this field is about the **energy (or better, heat) budget**. For an ectotherm—an organism that relies on environmental heat sources—staying alive is a constant game of balancing energy "income" against energy "expenses." If the budget fails, the organism either freezes (metabolism stops) or cooks (proteins denature).

---

## The Fundamental Energy Balance Equation

To understand how an organism interacts with its environment, we use the steady-state energy balance equation. In the framework of Porter and Kearney, we view the animal as a thermodynamic system:

$$
Q_{solar} + Q_{IR,in} + Q_{metab} = Q_{IR,out} + Q_{conv} + Q_{cond} + Q_{evap} + Q_{resp}
$$

For a stable body temperature, the heat entering the body must equal the heat leaving it. Each term represents a different physical pathway.

### Variable Definitions:
* **\(Q_{solar}\)**: Absorbed short-wave solar radiation — the main heat source for most ectotherms
* **\(Q_{IR,in}\)**: Absorbed long-wave infrared radiation from the sky and the ground
* **\(Q_{metab}\)**: Metabolic heat production (often negligible for small ectotherms)
* **\(Q_{IR,out}\)**: Emitted long-wave infrared radiation
* **\(Q_{conv}\)**: Convective heat exchange with the surrounding fluid (air or water)
* **\(Q_{cond}\)**: Conductive heat exchange with the substrate
* **\(Q_{evap}\)**: Evaporative heat loss via water evaporation from the skin
* **\(Q_{resp}\)**: Respiratory heat loss via evaporation and convection from the lungs

Let's break down each heat transfer mechanism.

---

## 1. Convection (\(Q_{conv}\))

Convection is heat transfer between an object and a moving fluid (usually air or water). This is essentially "wind chill" in reverse — or forward.

The rate of convective heat transfer is:

$$
Q_{conv} = h_c A (T_s - T_a)
$$

* **\(h_c\)**: Convective heat transfer coefficient (W m⁻² K⁻¹) — depends on wind speed and the size and shape of the animal.
* **\(A\)**: Characteristic surface area exchanging heat (m²).
* **\(T_s\)**: Surface temperature of the animal (°C or K).
* **\(T_a\)**: Ambient temperature of the air or water (°C or K).

Small organisms have a very high **surface-area-to-volume ratio**, meaning convection dominates their lives. A tiny insect is almost always the same temperature as the air because it cannot "hold onto" heat when the wind is blowing.

**Ectotherm strategy:** Many lizards orient their bodies to manage convective heat exchange. On cool mornings, they position themselves perpendicular to the wind to minimise heat loss while basking. When overheating, they face into the wind and lift their bodies to maximise convective cooling.

---

## 2. Conduction (\(Q_{cond}\))

Conduction is the transfer of heat through direct physical contact. Think of a lizard belly-down on a hot granite slab. The heat moves from the warmer object to the cooler one via molecular collisions.

The rate of conductive heat transfer follows **Fourier's Law**:

$$
Q_{cond} = k_{sub} A_{contact} \frac{T_s - T_{sub}}{z}
$$

* **\(k_{sub}\)**: Thermal conductivity of the substrate (W m⁻¹ K⁻¹).
* **\(A_{contact}\)**: Surface area in contact with the ground (m²).
* **\(T_s - T_{sub}\)**: Temperature difference between the surface and the substrate (°C or K).
* **\(z\)**: Conduction depth — thickness of the substrate layer through which heat travels (m). In NicheMapR, this defaults to 2.5 cm.

**Ectotherm strategy:** To warm up quickly, lizards press their bodies flat against warm rocks (increasing \(A_{contact}\)). To cool down, they "stilt" — standing high on their legs to minimise contact area and let air flow beneath them.

---

## 3. Infrared radiation (\(Q_{IR,in}\) and \(Q_{IR,out}\))

Every object with a temperature above absolute zero emits thermal infrared radiation. For an ectotherm, the balance between incoming and outgoing infrared is a major part of the energy budget.

The **outgoing** infrared radiation emitted by an organism is described by the **Stefan-Boltzmann Law**:

$$
Q_{IR,out} = A \epsilon \sigma T_s^4
$$

* **\(A\)**: Radiative surface area (m²).
* **\(\epsilon\)**: Emissivity of the surface — how efficiently it radiates infrared (dimensionless, typically near 1 for biological surfaces).
* **\(\sigma\)**: Stefan-Boltzmann constant (\(5.67 \times 10^{-8} \, \mathrm{W \, m^{-2} \, K^{-4}}\)).
* **\(T_s\)**: Absolute surface temperature (K).

Organisms also **absorb** infrared radiation from their surroundings — from the sky above and the ground below. This incoming flux \(Q_{IR,in}\) depends on the temperature of the surrounding surfaces and the organism's posture.

**Ectotherm strategy:** Nocturnal lizards lose heat to the clear night sky through infrared emission. On cloudy nights, the clouds reflect infrared back down, reducing heat loss and keeping the lizard warmer — a phenomenon analogous to a greenhouse.

---

## 4. Solar radiation (\(Q_{solar}\))

This is the primary power source for most ectotherms. Solar radiation arrives as direct sunlight, diffuse sky light, and radiation reflected off the ground and vegetation.

The absorbed solar heat is:

$$
Q_{solar} = A_d a S
$$

* **\(A_d\)**: Projected area of the animal exposed to the sun — the shadow it casts (m²).
* **\(a\)**: Solar absorptivity — the fraction of incoming solar energy absorbed (dimensionless, equals \(1 - \text{albedo}\)).
* **\(S\)**: Incoming solar radiation flux (W m⁻²).

**Ectotherm strategy:** A dark-coloured lizard absorbs more solar energy than a light-coloured one — the difference can be several degrees of body temperature. Many species can change colour (physiological colour change) to regulate their solar gain. Posture also matters: flattening the body maximises the projected area \(A_d\) for rapid warming, while aligning with the sun's rays minimises it.

---

## 5. Evaporation (\(Q_{evap}\))

Evaporation is the "emergency brake" of thermoregulation. It takes a massive amount of energy to turn liquid water into vapour — the latent heat of vaporisation.

The heat lost via evaporation depends on the vapour density gradient between the skin and the air:

$$
Q_{evap} = A \, h_d \, (\rho_{skin} - \rho_{air}) \, \Delta H_{vap}
$$

* **\(A\)**: Evaporative surface area (m²).
* **\(h_d\)**: Mass transfer coefficient (m s⁻¹).
* **\(\rho_{skin}\)**: Water vapour density at the skin (kg m⁻³).
* **\(\rho_{air}\)**: Water vapour density of the surrounding air (kg m⁻³).
* **\(\Delta H_{vap}\)**: Latent heat of vaporisation (J kg⁻¹).

While ectotherms don't "sweat" like humans, they lose water through their skin and respiratory tracts. The fraction of skin acting as a free-water surface (often called **pct_wet** in models) is a key physiological trait that determines how much evaporative cooling is possible.

**Ectotherm strategy:** In extreme heat, some lizards pant (**gular fluttering**) to ramp up evaporative cooling via their moist mouth and throat surfaces. This is the primary mechanism Ray Huey discusses when examining the "costs" of high-temperature activity. Amphibians rely even more on evaporation: a wet-skinned frog can keep its body temperature below the air temperature through evaporative cooling, but at the cost of constant water loss.

---

## 6. Metabolism (\(Q_{metab}\))

All organisms produce heat as a by-product of cellular metabolism. For small ectotherms, this heat is usually negligible compared to environmental fluxes (typically less than 5% of the total). For endotherms (birds and mammals), it is the dominant heat source that maintains a stable, elevated body temperature.

The metabolic heat production follows a general allometric-Arrhenius relationship:

$$
Q_{metab} = f(M, T_b, \text{activity})
$$

* **\(M\)**: Body mass (kg).
* **\(T_b\)**: Body temperature (°C or K).
* **activity**: Behavioural state — resting, active, or digesting.

Metabolic rate increases with body size but at a slower-than-linear rate (proportional to \(M^{0.75}\) in most organisms) and increases exponentially with body temperature via the Boltzmann-Arrhenius factor.

**Ectotherm strategy:** While metabolic heat is negligible for thermoregulation, the *metabolic cost* of activity matters enormously for the energy budget. A foraging lizard spends far more energy than a resting one — and the hotter it gets, the faster it burns through its energy reserves.

---

## Summary

For an ectotherm, **behaviour is the thermostat**. Because they cannot burn calories to generate significant heat, they must navigate a complex spatial map of physical variables — sun, shade, wind, rocks, and water — to find the right balance. They are essentially living physicists, constantly solving their heat budget equation by moving between microenvironments.

Biophysical ecology gives us the tools to quantify this process, turning animal behaviour into a solvable physical problem.
