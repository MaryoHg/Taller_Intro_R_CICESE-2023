##------------------------------------------------------##
## Convirtiendo una base de datos a diferentes formatos ##
##------------------------------------------------------##
library (xlsx) #cargamos la librería

	## 1. leemos una base de datos
        mis_datos <- utils::read.delim(file.choose(), sep = ",") # lee mi base de datos csv

	## 2. Guardo mi base de datos con el formato o separador que yo desee
        
                ?write.csv() # ver ayuda de la función
	
	        write.table(x = mis_datos, sep = ",", file = "data/mis_datos.csv")
		write.table(x = mis_datos, sep = "\t",file = "data/mis_datos.tsv")
	        write.table(x = mis_datos, sep = "", file = "data/mis_datos.txt")
	
	## 3. Deseo guardarlo como un archivo de Microsoft Excel: cuidado con la extensión del archivo
	        ?xlsx::write.xlsx()
	        xlsx::write.xlsx(x = mis_datos, sheetName = "mis_datos", file = 'data/mis_datos.xlsx')
	