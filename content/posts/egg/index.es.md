---
title: "Publicado el artículo huevo!"
description: "paper publication"
date: 2023-04-23
tags: ["artículo", "biofísica", "fisiología", "modelado"]
---

Los huevos son una etapa vulnerable porque son sensibles a las condiciones térmicas e hídricas y, sin embargo, no pueden evitar conductualmente los entornos estresantes. Un modelo mecanístico general del desarrollo de los huevos en nidos naturales requiere que las predicciones microclimáticas de temperatura, humedad, radiación (si están sobre el suelo) y potencial hídrico (si están enterrados en el suelo) se integren con modelos de intercambio de calor y agua del huevo y el metabolismo del proceso de desarrollo. Aunque ya existen todas las piezas necesarias para tal modelo, no se habían integrado hasta ahora en un marco de modelado general.

Hemos desarrollado dicha integración utilizando el paquete NicheMapR para el modelado mecanístico de nichos. Específicamente, tomamos un modelo general existente de intercambio de agua en huevos y lo conectamos con el modelo de microclima en NicheMapR para simular los entornos térmicos e hídricos del nido, incluyendo los efectos del potencial hídrico del suelo en el intercambio de líquido y vapor, y la conductividad térmica del suelo mediada por la humedad en el intercambio de calor. Posteriormente, utilizamos el modelo de Presupuesto Energético Dinámico (DEB) dentro del modelo de ectotermos de NicheMapR como motor mecanístico para el proceso de desarrollo, lo que permite el cálculo explícito de la dinámica de la producción de calor metabólico y todos los aspectos del intercambio de masas.

Ilustramos este marco de modelado utilizando datos de laboratorio y de campo existentes sobre reptiles, insectos y aves. Demostramos que puede captar las observaciones de laboratorio sobre el intercambio de agua y la producción de calor metabólico, y cómo puede utilizarse para mapear el desarrollo potencial y la absorción de agua en condiciones naturales a escala continental.

El marco de modelado puede utilizarse para interpretar experimentos de laboratorio y permite realizar inferencias sólidas sobre las limitaciones abióticas en el desarrollo de los huevos en nidos naturales bajo los cambios ambientales del pasado, presente y futuro.

Enlace al artículo: [https://besjournals.onlinelibrary.wiley.com/doi/full/10.1111/2041-210X.14018](https://besjournals.onlinelibrary.wiley.com/doi/full/10.1111/2041-210X.14018)

