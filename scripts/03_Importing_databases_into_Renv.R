## ------------------------------------------- ##
## Importando bases de datos al ambiente de R  ##
## ------------------------------------------- ##


## 1. Definir mi directorio de trabajo: ¿Identificas cuál es la ruta de tu directorio de trabajo para este taller?

	base::setwd("") # completa esta información.



## 2. Leyendo de forma comando-interactiva con: utils::read.delim()

	data <- read.delim(file.choose(), sep = "") # lee txt
	data <- read.delim(file.choose(), sep = "\t") # lee tsv
	data <- read.delim(file.choose(), sep = ",") # lee csv


	
## 3. Funciones para importar bases de datos al ambiente R:

	## Usando la base de R

	?utils::read.csv()	## to load a csv dataframe, including from the internet
	
	?utils::read.delim()	## to load a tsv, or any dataframe
	
	?utils::read.table()	## to load a tsv, or text, or any dataframe
	
	?utils::read.delim()	## to load a tsv, or any dataframe


	## Otras paquetería

	readr::read_csv()
	readr::read_delim()

	
## 4. Leyendo e importando bases de datos desde Microsoft Excel (exclusivamente)
	
	?xlsx::read.xlsx()
	?readxl::read_excel()
	?gdata::read.xls()
	
	
	
## 5. Otro tipo de base de datos o archivos de otros programas:

	haven::read_sas()              # lee una base de datos originaria del programa SAS

	haven::read_spss()             # lee una base de datos originaria del programa SPSS

	foreign::read.spss()           # lee una base de datos originaria del programa SPSS

	foreign::read.mtp()            # lee una base de datos originaria del programa minitab

	?foreign::read.dta()           # lee una base de datos originaria del programa STATA - archivo binario.
	
	
## ---------------------------------------------------------------------- ##
## Actividad: carga las 3 bases de datos, indicando el separador correcto ##
## ---------------------------------------------------------------------- ##
	
	## From the internet: a csv file
	## Including from the web:
	df <- utils::read.csv(file = 'https://raw.githubusercontent.com/OHI-Science/data-science-training/master/data/gapminder_wide.csv')
	
	## Reading all types of dataframes with a single function:
	data1 <- read.delim(file = 'data/file.tsv', sep = '\t')
	data2 <- read.delim(file = 'data/file.csv', sep = ',')
	data3 <- read.delim(file = 'data/file.txt', sep = '')
	
	str(data1)
	
	
##
	