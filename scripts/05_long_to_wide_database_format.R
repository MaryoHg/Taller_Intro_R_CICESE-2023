## -------------------------------------------------------------------- ##
## Interconvertir: formatos "ancho" y "largo" de una base de datos en R ##
## -------------------------------------------------------------------- ##
library(tidyverse) #cargamos la librería para manipulación de datos en R: por excelencia.


## de ancho a largo:

	## 1. Cargamos nuestra base de datos: base de datos de soccer
	soccer <- readxl::read_excel(file.choose(), sheet = 1)
	soccer
	
	## 2. Convertimos a formato largo con la función: tidyr::pivot_longer()
	soccer_largo <- soccer %>%
	        tidyr::pivot_longer(cols = 2:4)
	
## de largo a ancho: regresamos al indical
	
	soccer_ancho <- soccer_largo %>% 
		tidyr::pivot_wider(values_from = "value", names_from = "name")
	
	# nota: vemos cómo regresamo a la base de datos original, i.e., soccer.
	
	
	