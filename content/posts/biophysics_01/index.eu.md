---
title: "Ekologia Biofisikoaren Oinarri-oinarrizkoak"
description: "Ekologia Biofisikoaren saioa - 01"
date: 2026-03-27
series: ["Ekologia Biofisikoa"]
series_order: 1
tags: ["biophysics", "ecology"]
---

{{< katex >}}

# Ekologia Biofisikoaren Oinarri-oinarrizkoak

Ongi etorri gure saileko lehen artikulura. Inoiz galdetu badiozu zeure buruari zergatik pasatzen duen musker batek goiz osoa harri baten gainean mugitu gabe, edo zergatik jartzen den basamortuko kakarraldo bat buruz behera behe lainotan, **Ekologia Biofisikoa** aztertzen ari zara jada.

Funtsean, arlo honek **energia-balantzea (edo, hobeto esanda, bero-balantzea)** aztertzen du. Ektotermo batentzat —inguruko bero-iturrien mende dagoen organismoa— bizirik irautea energia-"sarreren" eta energia-"gastuen" arteko oreka mantentzeko joko jarraitua da. Balantzeak huts egiten badu, organismoa izoztu (metabolismoa gelditu) edo egosi (proteinak desnaturalizatu) egiten da.

---

## Energia-balantzearen Oinarrizko Ekuazioa

Organismo batek bere ingurunearekin nola jokatzen duen ulertzeko, egoera egonkorreko energia-balantzearen ekuazioa erabiltzen dugu. Porter eta Kearney-ren esparruan, animalia sistema termodinamiko gisa ikusten dugu:

$$
Q_{abs} + Q_{gen} = Q_{out} + Q_{conv} + Q_{evap} + Q_{cond} + S
$$

### Aldagaien definizioak:
* **\(Q_{abs}\)**: Xurgatutako erradiazio osoa (uhin motzeko eguzki-erradiazioa + uhin luzeko erradiazio infragorria)
* **\(Q_{gen}\)**: Metabolismoak sortutako beroa (askotan arbuiagarria ektotermo txikietan)
* **\(Q_{out}\)**: Gainazalak igortzen duen uhin luzeko erradiazio garbia
* **\(Q_{conv}\)**: Fluidoarekin (airea/ura) konbekzio bidezko bero-trukea
* **\(Q_{evap}\)**: lurruntze bidezko bero-galera latentea
* **\(Q_{cond}\)**: Sustratuarekiko kondukzio bidezko trukea
* **\(S\)**: Bero-biltegiratzea (tenperatura-aldaketaren tasa)

Animalia batek gorputz-tenperatura egonkorra mantentzeko, **\(S\) zero izan behar da**. Azter ditzagun puntu horretara eramaten gaituzten bero-transferentziako mekanismo nagusiak.

---

## 1. Kondukzioa (\(Q_{cond}\))
Kondukzioa kontaktu fisiko zuzenaren bidezko bero-transferentzia da. Pentsatu granitozko harri bero baten gainean sabela itsatsita duen musker batengan. Beroa tenperatura altuagoa duen objektutik tenperatura baxuagoa duenera igarotzen da talka molekularren bidez.

Kondukzio bidezko bero-transferentziaren tasa **Fourier-en Legeak** arautzen du:

$$
Q_{cond} = k_{sub} A_{contact} \frac{T_s - T_{sub}}{z}
$$

* **\(k_{sub}\)**: Sustratuaren konduktibitate termikoa.
* **\(A_{contact}\)**: Lurrarekin kontaktuan dagoen gainazal-eremua.
* **\(T_s - T_{sub}\)**: Gainazalaren eta sustratuaren arteko tenperatura-gradientea.

**Ektotermoaren estrategia:** Azkar berotzeko, muskerrek kontaktu-eremua (\(A_{contact}\)) handitzen dute gorputza harri beroen kontra zapalduz. Hozteko, ordea, hanka gainean altxa daitezke ("stilting") aire-tarte bat sortzeko.

---

## 2. Konbekzioa (\(Q_{conv}\))
Konbekzioa objektu baten eta fluido higikor baten (normalean airea edo ura) arteko bero-transferentzia da. Hau, funtsean, "haizearen hozte-efektua" da, alderantziz (edo zuzenean).

Deskribapen matematikoa honela sinplifikatu ohi da:

$$
Q_{conv} = h_c A (T_s - T_a)
$$

* **\(h_c\)**: Konbekzio-koefizientea (haizearen abiaduraren eta animaliaren tamaina/formaren mende dago).
* **\(T_s\)**: Animaliaren gainazaleko tenperatura.
* **\(T_a\)**: Giro-tenperatura (airearena edo urarena).

Organismo txikiek **gainazal/bolumen erlazio** oso altua dute, eta horrek esan nahi du konbekzioa dela nagusi beraien bizitzan. Intsektu txiki batek airearen tenperatura bera du ia beti, ezin duelako beroari "eutsi" haizeak jotzen duenean.

---

## 3. Lurruntzea (\(Q_{evap}\))
Lurruntzea termoerregulazioaren "larrialdietako balazta" da. Energia kantitate handia behar da ur likidoa lurrun bihurtzeko (lurrunketako bero latentea, \(\lambda\)).

Lurruntze bidezko bero-galera hau da:

$$
Q_{evap} = \dot{m}_{evap} \lambda
$$

* **\(\dot{m}_{evap}\)**: Lurruntzearen masa-fluxuaren tasa.
* **\(\lambda\)**: Lurrunketako bero latentea.

Ektotermoek gizakiok bezala "izerdirik" egiten ez badute ere, ura galtzen dute azaletik eta arnasbideetatik. Muturreko beroarekin, musker batzuek arnasestuka jardungo dute (**eztarriko mugimendu azkarrak** edo *gular fluttering*) hozte ebaporatiboa bizkortzeko. Hau da Ray Huey-k tenperatura altuko aktibitatearen "kostuak" aztertzean erabiltzen duen mekanismo nagusia.

---

## 4. Erradiazioa (\(Q_{abs}\) eta \(Q_{out}\))
Hau da faktore garrantzitsuena. Ektotermoak, batez ere, "eguzki-energiaz" dabiltza. Eguzkiaren uhin motzeko erradiazioa eta zeruaren zein lurraren uhin luzeko erradiazioa xurgatzen dute.

Organismo batek igortzen duen energia **Stefan-Boltzmann-en Legeak** definitzen du:

$$
Q_{out} = \epsilon \sigma T_s^4
$$

* **\(\epsilon\)**: Emisibitatea (objektua infragorriaren espektroan zein "beltza" den).
* **\(\sigma\)**: Stefan-Boltzmann-en konstantea (\(5.67 \times 10^{-8} W m^{-2} K^{-4}\)).
* **\(T_s\)**: Gainazaleko tenperatura Kelvin unitatetan.

---

## Laburpena
Ektotermo batentzat, **portaera da termostatoa**. Bero esanguratsua sortzeko kaloriarik erre ezin dutenez (\(Q_{gen} \approx 0\)), aldagai fisikoen mapa konplexu batean nabigatu behar dute. Funtsean, fisikari bizidunak dira, eta etengabe ari dira \(T_b\) (gorputz-tenperatura) ebazten, eguzkiaren eta itzalaren, edo harriaren eta airearen artean mugituz.
