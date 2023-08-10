## -------------------------------------------------------- ##
## CONOCIENTO MI BASE DE DATOS: ¿QUÉ TENGO EN MI DATAFRAME? ##
## -------------------------------------------------------- ##
library(tidyverse, warn.conflicts = F)


	## 1. Importamos nuestra base de datos IRIS: ¡ES UN TSV! (corroborarlo!)
	iris <- xlsx::read.xlsx(file.choose(), sheetIndex = 1) # seleccione iris
	#iris <- utils::read.delim(file.choose(), sep = '\t') # seleccione tsv
	
	head(iris) # primeas líneas, o "cabeza", de la base de datos
	tail (iris) # últimas líneas, o cola, de la base de datos.
	str(iris) # estructura de la base de datos
	summary(iris) # resumen de la base de datos
	
	
## -------------------------- ##
## Estadísticos con un factor ##
## -------------------------- ##
	
	iris %>% 
	        dplyr::group_by(Species) %>% 
	        dplyr::summarise(N = n(),
	                         longitud_promedio = mean(longitud_cm, na.rm = TRUE),
	                         sd = sd(longitud_cm),
	                         sem = sd(longitud_cm)/sqrt(N),
	                         .groups = 'drop')


## -------------------------- ##
## Estadísticos con un factor ##
## -------------------------- ##
	
	iris %>% 
	        dplyr::group_by(Species, variables_medida) %>% 
	        dplyr::summarise(N = n(),
	                         longitud_promedio = mean(longitud_cm, na.rm = TRUE),
	                         sd = sd(longitud_cm),
	                         sem = sd(longitud_cm)/sqrt(N),
	                         .groups = 'drop')
	