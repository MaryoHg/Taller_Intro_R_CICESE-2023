## ------------------------------------- ##
## Instalar paqueterías en mi ambiente R ##
##-------------------------------------- ##
.libPaths() # coloca aquí tu ruta: 


## 1. Instalar paqueterías desde el repositorio CRAN: 

	?install.packages()
	install.packages(c('RColorBrewer', 'Rmisc', 'tidyverse', 'devtools', 'readxl', 'xlsx'), dependencies = TRUE)

## 2. Instalar paqueterías desde Github
	## Con devtools:: package
	if (!requireNamespace("devtools", quietly = TRUE)){install.packages("devtools")}
	devtools::install_github("jbisanz/qiime2R")

## 3. Con la paquetería remote::
	## Note: remotes:: package is a lightweight version of devtools function install_github() function
	## Note 2: They both do the same exactly

	remotes::install_github("vegandevs/vegan")
	remotes::install_github("nrennie/ggflowchart")


## 4. Instalando desde el repositorio Bioconductor: at <https://www.bioconductor.org/install/>
	## installing BiocManager package()
	if (!require("BiocManager", quietly = TRUE))
		install.packages("BiocManager") # BiocManager::install(version = "3.17")
	
	## Package install with BiocManager() - an example
	BiocManager::install("ComplexHeatmap")	# paquete para hacer heatmaps complejos
	BiocManager::install("ALDEx2")		# paquete para análisis composicional de datos (secuenciamiento masivo).
	
	
## ----------------------------------- ##
## Cargar paqueterías en mi ambiente R ##
##------------------------------------ ##
	# Cargamos una librería para que R pueda disponer de sus funciones.
        # Si una librería no esta "cargada", corremos el riesgo de no encontrar la función deseada.
	
	library(tidyverse)
	library(qiime2R)
	library(RColorBrewer)
	library(devtools)
	library(ComplexHeatmap)