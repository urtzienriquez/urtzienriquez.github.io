---
title: "C-ren historia laburra"
author: Urtzi Enriquez-Urzelai
date: 2026-11-10
series: ["C Tutorials"]
series_order: 1
showPagination: false
summary: "Nondik dator C, nola bihurtu zen ia guztiaren azpian dagoen lenguaia, eta zergatik merezi duen oraindik ikastea."
categories: ["Programming"]
tags: ["C", "history"]
---

C-n koderik idatzi aurretik, sail hau historia pixka batekin hastea ideia ona iruditu zitzaidan. C-k 50 urte baino gehiago ditu, eta hala ere oraindik nonahi dago; beraz, merezi du jakitea nondik datorren.

## BCPLtik Bra eta Cra

Istorioa 60ko hamarkadaren amaieran hasten da. 1967an, Martin Richardsek **BCPL** diseinatu zuen, konpiladoreak idazteko lenguaia sinple bat. Bell Laborategietan, Ken Thompsonek BCPL hartu eta are gehiago sinplifikatu zuen, lenguaia txikiago bat sortuz: **B** (1969). Lenguaia hori bere ordenagailuen memoria txikian sartzen zen.

Baina Bk arazo bat zuen: ez zuen datu-motarik. Dena makinaren "hitz" bat zen, eta horrek ondo funtzionatzen zuen ordenagailu zaharretan, baina ez PDP-11 berrian, byte bakoitza banan-banan helbideratu baitzezakeen. 1971 eta 1973 artean, Dennis Ritchiek B zabaldu zuen datu-motekin (`char`, `int` eta, geroago, egiturak) eta benetako konpiladore batekin. Emaitzari lehenik "New B" deitu zitzaion, eta gero, besterik gabe, **C**.

## Unix C-n berridatzia

C ez zen hutsetik sortu: **Unix** idazteko sortu zen. Thompsonek eta Ritchiek Unixen lehen bertsioak mihiztadura-lenguaian (assembly) idatzi zituzten, eta horrek sistema makina zehatz bati lotzen zion. 1973an, Unixen nukleoaren zatirik handiena C-n berridatzi zuten. Garai hartarako nahiko erabaki ausarta izan zen, sistema eragileak abiadura dela-eta mihiztadura-lenguaian idaztea espero baitzen.

Erabaki bikaina izan zen. Unix maila nahiko altuko lenguaia batean idatzita zegoenez, makina berrietara eraman zitekeen, haientzat C konpiladore bat idatzi eta berriro konpilatuz. Unix eta C elkarrekin zabaldu ziren unibertsitate eta enpresetan 70eko hamarkadan, eta bakoitzak bestea ezaguna egiten lagundu zuen.

## K&R eta "hello, world"

1978an, Brian Kernighanek eta Dennis Ritchiek *The C Programming Language* argitaratu zuten, **K&R** izenez ezagutzen den liburu labur eta argia. Hamarkada bat baino gehiagoz, liburu hau izan zen lenguaiaren definizio ofiziala (de facto). Zure lehen programak "hello, world" inprimatzeko ohitura ere zabaldu zuen:

```c
main()
{
    printf("hello, world\n");
}
```

Gaur egungo konpiladore batek hasieran `#include <stdio.h>` gehitzeko eta `int main(void)` idazteko eskatuko lizuke, baina ia 50 urte geroago ere C bezala ezagutzen da!

## Estandarizazioa

C zabaldu ahala, konpiladore bakoitza bere luzapenak gehitzen hasi zen, eta konpiladore baterako idatzitako kodeak ez zuen beti beste batean funtzionatzen. Hori konpontzeko, Estatu Batuetako Estandarren Institutu Nazionalak (ANSI) estandar bat argitaratu zuen 1989an (**C89**), eta ISOk hurrengo urtean onartu zuen (**C90**). Ordutik, lenguaia poliki eta kontuz eboluzionatu da estandar berrien bidez: **C99**, **C11**, **C17** eta, berrikiago, **C23**. Bertsio bakoitzak gauza erabilgarriak gehitzen ditu (adibidez, `//` iruzkinak, zenbaki oso mota berriak edo multithreading-erako euskarri hobea), kode zaharrak funtzionatzen jarraitzen duela bermatuz.

## Ondarea

Zaila da C-k izan duen eragina gehiegi azpimarratzea. Bere sintaxia (giltzak, `for` begiztak, `++` eta abar) C++, Objective-C, Java, C#, JavaScript eta Go lenguaiek hartu zuten, beste askoren artean. Thompsonek eta Ritchiek Turing Saria jaso zuten 1983an, Unixen egindako lanagatik.

C da, gainera, egunero erabiltzen dugun software gehienaren oinarria. Linux nukleoa C-n idatzita dago, baita Pythonen erreferentziazko inplementazioa (CPython), R interpretearen zatirik handiena eta Juliaren exekuzio-ingurunearen (runtime) zati handi bat ere.

## Zergatik ikasi C gaur egun?

Batez ere R edo Julia erabiltzen ditugun zientzialarientzat, C beharrezkoa ez dela irudi dezake. Baina hura ikasteak memoria, datu-motak eta konpilazioa benetan nola dabiltzan erakusten dizu, eta horrek edozein lenguaiatan kode azkarragoa idazten laguntzen du. Eta R edo Julia nahikoa azkarrak ez direnean, zati motela C-n idatz dezakezu eta Rtik (`.Call` erabiliz) edo Juliatik (`ccall` erabiliz) deitu.

Horra doa sail hau. Hurrengo sarreretan, C kodea idazten, konpilatzen eta exekutatzen hasiko gara. Adi egon!
