##---------------------------------------------------------------------##
## CONOCIENDO MI AMBIENTE EN R: PAQUETERÍAS, VERSIONES Y CÓMO CITARLOS ##
##---------------------------------------------------------------------##
##-------------------------------##
## CONOCER MI SESIÓN POR DEFECTO:
##-------------------------------##

## ¿QUÉ PAQUETERÍAS SE CARGAN POR DEFAULT?
	## Imprime la versión de R y su información, el sistema operativo, 
	## y los paquetes cargados

	sessionInfo()


## ¿Cómo obtengo ayuda de una paquetería o de una función de una paquetería?
	
	help(base) #ayuda de una paquetería
	help(plot, package = "base") # ayuda de la funcion "plot" del paquete "base".
	help(plot) #ayuda para una función de una paquetería

	?ggplot
	?plot
	?sessionInfo()

## Conocer la versión instalada:
	
	packageVersion('base')
	packageVersion('ggplot2')


## ¿Cómo citar una paquetería?
	
	citation()				# cómo citar R base
	citation(package = "ggplot2")		# cómo citar el paquete ggplot2

	
	
##-------------------------##	
## INSTALAR UNA PAQUETERÍA ##	
##-------------------------##

	## ¿Dónde están mis paquetes intalados por default?
	.libPaths()
	
	## Comando para instalar una librería o paquetería: forma default y automática
	?install.packages()
	install.packages("ggplot2", dep = T)				# método simple
	utils::install.packages(pkgs = "ggplot2", dependencies = T)	# método detallado.
	
	## Comando para configurar un lugar diferente a donde quiero que se instale un paquete
	utils::install.packages(pkgs = "ggplot2", dependencies = T, lib = '/home/mario/R')
	
	
	
	
##----------------------------------##	
## DENTRO DE UNA PAQUETERÍA CARGADA ##	
##----------------------------------##

	base::
	utils::
	ggplot2::theme

	## Pregunta: ¿Cuántas funciones tiene cada paquetería?





