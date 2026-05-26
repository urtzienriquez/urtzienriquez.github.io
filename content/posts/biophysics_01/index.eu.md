---
title: "Ekologia Biofisikoaren Oinarri-oinarrizkoak"
description: "Ekologia Biofisikoaren saioa - 01"
date: 2026-03-27
series: ["Ekologia Biofisikoa"]
series_order: 1
categories: ["Ecology"]
tags: ["biophysics", "modelling"]
---

{{< katex >}}

# Ekologia Biofisikoaren Oinarri-oinarrizkoak

Ongi etorri gure saileko lehen artikulura. Inoiz galdetu badiozu zeure buruari zergatik pasatzen duen musker batek goiz osoa harri baten gainean mugitu gabe, edo zergatik jartzen den basamortuko kakarraldo bat buruz behera behe lainotan, **Ekologia Biofisikoa** aztertzen ari zara jada.

Funtsean, arlo honek **energia-balantzea (edo, hobeto esanda, bero-balantzea)** aztertzen du. Ektotermo batentzat —inguruko bero-iturrien mende dagoen organismoa— bizirik irautea energia-"sarreren" eta energia-"gastuen" arteko oreka mantentzeko joko jarraitua da. Balantzeak huts egiten badu, organismoa izoztu (metabolismoa gelditu) edo egosi (proteinak desnaturalizatu) egiten da.

---

## Energia-balantzearen Oinarrizko Ekuazioa

Organismo batek bere ingurunearekin nola jokatzen duen ulertzeko, egoera egonkorreko energia-balantzearen ekuazioa erabiltzen dugu. Porter eta Kearney-ren esparruan, animalia sistema termodinamiko gisa ikusten dugu:

$$
Q_{solar} + Q_{IR,in} + Q_{metab} = Q_{IR,out} + Q_{conv} + Q_{cond} + Q_{evap} + Q_{resp}
$$

Gorputz-tenperatura egonkorra mantentzeko, gorputzean sartzen den beroak irteten denaren berdina izan behar du. Termino bakoitzak bide fisiko bat adierazten du.

### Aldagaien definizioak:
* **\(Q_{solar}\)**: Xurgatutako uhin motzeko eguzki-erradiazioa — ektotermo gehienen bero-iturri nagusia
* **\(Q_{IR,in}\)**: Zerutik eta lurretik xurgatutako uhin luzeko erradiazio infragorria
* **\(Q_{metab}\)**: Metabolismoak sortutako beroa (askotan arbuiagarria ektotermo txikietan)
* **\(Q_{IR,out}\)**: Igorritako uhin luzeko erradiazio infragorria
* **\(Q_{conv}\)**: Inguruko fluidoarekin (airea edo ura) konbekzio bidezko bero-trukea
* **\(Q_{cond}\)**: Sustratuarekiko kondukzio bidezko bero-trukea
* **\(Q_{evap}\)**: Azaletik ura lurruntzearen bidezko bero-galera
* **\(Q_{resp}\)**: Biriketatik lurruntze eta konbekzio bidezko arnasketa-bero galera

Azter ditzagun bero-transferentziako mekanismo bakoitza.

---

## 1. Konbekzioa (\(Q_{conv}\))

Konbekzioa objektu baten eta fluido higikor baten (normalean airea edo ura) arteko bero-transferentzia da. Hau, funtsean, "haizearen hozte-efektua" da, alderantziz — edo zuzenean.

Konbekzio bidezko bero-transferentziaren tasa hau da:

$$
Q_{conv} = h_c A (T_s - T_a)
$$

* **\(h_c\)**: Konbekzio bidezko bero-transferentzia-koefizientea (W m⁻² K⁻¹) — haizearen abiaduraren eta animaliaren tamaina eta formaren mende dago.
* **\(A\)**: Bero-trukerako gainazal-eremu karakteristikoa (m²).
* **\(T_s\)**: Animaliaren gainazaleko tenperatura (°C edo K).
* **\(T_a\)**: Airearen edo uraren giro-tenperatura (°C edo K).

Organismo txikiek **gainazal/bolumen erlazio** oso altua dute, eta horrek esan nahi du konbekzioa dela nagusi beraien bizitzan. Intsektu txiki batek airearen tenperatura bera du ia beti, ezin duelako beroari "eutsi" haizeak jotzen duenean.

**Ektotermoaren estrategia:** Musker askok beren gorputzak orientatzen dituzte konbekzio bidezko trukea kudeatzeko. Goiz hotzetan, haizearekiko perpendikular kokatzen dira bero-galera minimizatzeko eguzkia hartzen duten bitartean. Gehiegi berotzean, haizeari begira jartzen dira eta gorputzak altxatzen dituzte hozte konbektiboa maximizatzeko.

---

## 2. Kondukzioa (\(Q_{cond}\))

Kondukzioa kontaktu fisiko zuzenaren bidezko bero-transferentzia da. Pentsatu granitozko harri bero baten gainean sabela itsatsita duen musker batengan. Beroa objektu berotik hotzenera igarotzen da talka molekularren bidez.

Kondukzio bidezko bero-transferentziaren **Fourier-en Legeak** arautzen du:

$$
Q_{cond} = k_{sub} A_{contact} \frac{T_s - T_{sub}}{z}
$$

* **\(k_{sub}\)**: Sustratuaren konduktibitate termikoa (W m⁻¹ K⁻¹).
* **\(A_{contact}\)**: Lurrarekin kontaktuan dagoen gainazal-eremua (m²).
* **\(T_s - T_{sub}\)**: Gainazalaren eta sustratuaren arteko tenperatura-diferentzia (°C edo K).
* **\(z\)**: Kondukzio-sakonera — beroa bidaiatzen duen sustrato-geruzaren lodiera (m). NicheMapR-en, lehenetsitako balioa 2.5 cm da.

**Ektotermoaren estrategia:** Azkar berotzeko, muskerrek gorputzak harri beroen kontra zapaltzen dituzte (\(A_{contact}\) handituz). Hozteko, hanka gainean altxatzen dira ("stilting") kontaktu-eremua minimizatzeko eta haizea azpitik igarotzeko.

---

## 3. Erradiazio infragorria (\(Q_{IR,in}\) eta \(Q_{IR,out}\))

Tenperatura zero absolutuaren gainetik duen edozein objektuk erradiazio infragorri termikoa igortzen du. Ektotermo batentzat, sartzen eta irteten den erradiazio infragorriaren arteko oreka funtsezkoa da.

Organismoak igorritako erradiazio infragorria **Stefan-Boltzmann-en Legeak** deskribatzen du:

$$
Q_{IR,out} = A \epsilon \sigma T_s^4
$$

* **\(A\)**: Erradiazio-gainazalaren eremua (m²).
* **\(\epsilon\)**: Gainazalaren emisibitatea — infragorria igortzeko duen eraginkortasuna (adimentsionala, 1etik hurbil gainazal biologikoetan).
* **\(\sigma\)**: Stefan-Boltzmann-en konstantea (\(5.67 \times 10^{-8} \, \mathrm{W \, m^{-2} \, K^{-4}}\)).
* **\(T_s\)**: Gainazaleko tenperatura absolutoa (K).

Organismoek inguruneko erradiazio infragorria ere **xurgatzen** dute — goiko zerutik eta beheko lurretik. \(Q_{IR,in}\) sarrerako fluxu hau inguruko gainazalen tenperaturaren eta organismoaren jarreraren araberakoa da.

**Ektotermoaren estrategia:** Gaueko muskerrek beroa galtzen dute zeru argira erradiazio infragorriaren bidez. Gau hodeitsuetan, hodeiek erradiazioa islatzen dute atzera, bero-galera murriztuz eta muskerra epelago mantenduz — berotegi-efektuaren antzeko fenomenoa.

---

## 4. Eguzki-erradiazioa (\(Q_{solar}\))

Hau da ektotermo gehienen energia-iturri nagusia. Eguzki-erradiazioa eguzki-argi zuzena, zeruko argi difusoa eta lurrak eta landarediak islatutako erradiazioa bezala iristen da.

Xurgatutako eguzki-beroa hau da:

$$
Q_{solar} = A_d a S
$$

* **\(A_d\)**: Animaliaren eguzkiara proiektatutako eremua — egiten duen itzala (m²).
* **\(a\)**: Eguzki-absortibitatea — sarrerako eguzki-energiaren xurgatzen den frakzioa (adimentsionala, \(1 - \text{albedo}\)).
* **\(S\)**: Sarrerako eguzki-erradiazio fluxua (W m⁻²).

**Ektotermoaren estrategia:** Kolore iluneko musker batek musker argi batek baino eguzki-energia gehiago xurgatzen du — aldea gorputz-tenperaturako hainbat gradu izan daiteke. Espezie askok kolorea aldatu dezakete (kolore-aldaketa fisiologikoa) eguzki-irabazia erregulatzeko. Jarrerak ere garrantzia du: gorputza zapaltzeak \(A_d\) eremu proiektatua maximizatzen du beroketa azkarreko, eta eguzki-izpiekin lerrokatzeak minimizatu egiten du.

---

## 5. Lurruntzea (\(Q_{evap}\))

Lurruntzea termoerregulazioaren "larrialdietako balazta" da. Energia kantitate handia behar da ur likidoa lurrun bihurtzeko — lurrunketako bero latentea.

Lurruntze bidezko bero-galera azalaren eta airearen arteko lurrun-dentsitate gradientearen araberakoa da:

$$
Q_{evap} = A \, h_d \, (\rho_{skin} - \rho_{air}) \, \Delta H_{vap}
$$

* **\(A\)**: Lurruntze-gainazalaren eremua (m²).
* **\(h_d\)**: Masa-transferentzia koefizientea (m s⁻¹).
* **\(\rho_{skin}\)**: Ur-lurrunaren dentsitatea azalean (kg m⁻³).
* **\(\rho_{air}\)**: Ur-lurrunaren dentsitatea inguruko airean (kg m⁻³).
* **\(\Delta H_{vap}\)**: Lurrunketako bero latentea (J kg⁻¹).

Ektotermoek gizakiok bezala "izerdirik" egiten ez badute ere, ura galtzen dute azaletik eta arnasbideetatik. Ur libreko gainazal gisa jokatzen duen azalaren frakzioa (ereduetan **pct_wet** deitua) ezaugarri fisiologiko giltzarria da, zenbat hozte ebaporatibo posible den zehazten duena.

**Ektotermoaren estrategia:** Muturreko beroarekin, musker batzuek arnasestuka jarduten dute (**eztarriko mugimendu azkarrak** edo *gular fluttering*) aho eta eztarriko gainazal hezeen bidez hozte ebaporatiboa bizkortzeko. Hau da Ray Huey-k tenperatura altuko aktibitatearen "kostuak" aztertzean erabiltzen duen mekanismo nagusia. Anfibioek are gehiago menpe dute lurruntzetik: azal hezeko igel batek bere gorputz-tenperatura airearen tenperaturaren azpitik mantendu dezake hozte ebaporatiboaren bidez, baina etengabeko ur-galeraren kostuarekin.

---

## 6. Metabolismoa (\(Q_{metab}\))

Organismo guztiek beroa sortzen dute zelula-metabolismoaren azpiproduktu gisa. Ektotermo txikientzat, bero hori arbuiagarria da normalean inguruko fluxuekin alderatuta (normalean guztizkoaren %5 baino gutxiago). Endotermoentzat (hegaztiak eta ugaztunak), aldiz, bero-iturri nagusia da, gorputz-tenperatura egonkorra eta altua mantentzen duena.

Bero metabolikoaren ekoizpenak erlazio alometriko-Arrhenius orokor bati jarraitzen dio:

$$
Q_{metab} = f(M, T_b, \text{jarduera})
$$

* **\(M\)**: Gorputz-masa (kg).
* **\(T_b\)**: Gorputz-tenperatura (°C edo K).
* **jarduera**: Portaeraren egoera — atsedena, jarduna edo digestioa.

Tasa metabolikoa gorputz-tamainarekin handitzen da baina erritmo lineala baino motelagoan (\(M^{0.75}\)-ren proportzionala organismo gehienetan), eta gorputz-tenperaturarekin esponentzialki handitzen da Boltzmann-Arrhenius faktorearen bidez.

**Ektotermoaren estrategia:** Bero metabolikoa arbuiagarria den arren termoerregulaziorako, jardueraren *kostu metabolikoak* izugarrizko garrantzia du energia-balantzerako. Bazka egiten duen musker batek atseden dagoen batek baino askoz energia gehiago gastatzen du — eta zenbat eta beroago egon, orduan eta azkarrago agortzen ditu bere energia-erreserbak.

---

## Laburpena

Ektotermo batentzat, **portaera da termostatoa**. Bero esanguratsua sortzeko kaloriarik erre ezin dutenez, aldagai fisikoen mapa konplexu batean nabigatu behar dute — eguzkia, itzala, haizea, harriak eta ura — oreka egokia aurkitzeko. Funtsean, fisikari bizidunak dira, eta etengabe ari dira bero-balantzearen ekuazioa ebazten mikrohabitateen artean mugituz.

Ekologia biofisikoak prozesu hori kuantifikatzeko tresnak ematen dizkigu, animalien portaera problema fisiko ebatzi bihurtuz.
