## trabajando con el código base de ggplot2
base::library(tidyverse)
setwd("/Users/mariohg/Documents/GitHub/Taller_Intro_R_CICESE-2023") # defino mi dir


# 1. Leyendo mi base de datos: fisicoquimicos

        mar_db <- utils::read.delim(file = 'data/fisicoquimicos.csv')
        head(mar_db)
        tail(mar_db)
        str(mar_db)
        summary(mar_db)
        
        base::table(mar_db$Tratamiento)
        base::table(mar_db$variable_de_respuesta)
                
# haciendo mi primer gráfico:
                head(mar_db)
                
                miboxplot <- ggplot2::ggplot(data = mar_db) +
                        theme_bw() +
                        geom_boxplot(mapping = aes(x = days, y = valor)) +
                        labs (x = "Tiempo (days)", y = "Valores",
                              title = "Dinámica de suelos contaminados con hidrocarburos",
                              subtitle = "Muestras de suelo mexicano")
                
                head(mar_db)
                table(mar_db$Tratamiento)
                summary(db_pH)

                # este gráfico es con filtro positivo de datos                
                mar_db %>% # aquí leo mi base de datos y uno then para poder concatenar ordenes
                        dplyr::filter(variable_de_respuesta == "pH") %>% # aquí filtro datos de pH (únicamente)
                        ggplot() + #aquí abro la funcio de ggplot para iniciar las capas del gráfico
                        theme_bw() + # este es el tema simple de ggplot, hay otros, checar y jugar con ellos
                        geom_boxplot(mapping = aes(x=days, y=valor, color=Tratamiento)) + # función "geom", usé boxplot
                        labs (x = "Tiempo (days)", y = "valores de pH del suelo", # aquí pongo los nombres de los ejes
                              title = "Dinámica de suelos contaminados con hidrocarburos", # este es el título del gráfico
                              subtitle = "Muestras de suelo mexicano") + # subtitulo del gráfico
                        #a partir de aquí inicia la personalización del gráfico, todo dentro de "theme(funcion1(), funcion2(), funcion3())"
                        theme(
                                axis.text = element_text(face = "bold", colour = "red", size = 20),
                              panel.grid = element_blank(),
                              #panel.border = element_blank(),
                              axis.title = element_text(face = "bold", colour = "blue", size = 20)
                              )
                
                # graficando todos con facet_grid:
                # este gráfico es con filtro positivo de datos                
                mar_db %>% # aquí leo mi base de datos y uno then para poder concatenar ordenes
                        ggplot() + #aquí abro la funcio de ggplot para iniciar las capas del gráfico
                        theme_dark() + # este es el tema simple de ggplot, hay otros, checar y jugar con ellos
                        geom_boxplot(mapping = aes(x=days, y=valor, color=Tratamiento)) + # función "geom", usé boxplot
                        labs (x = "Tiempo (days)", y = "valores de pH del suelo", # aquí pongo los nombres de los ejes
                              title = "Dinámica de suelos contaminados con hidrocarburos", # este es el título del gráfico
                              subtitle = "Muestras de suelo mexicano") + # subtitulo del gráfico
                        #a partir de aquí inicia la personalización del gráfico, todo dentro de "theme(funcion1(), funcion2(), funcion3())"
                        theme(
                                axis.text = element_text(colour = "black", size = 16),
                                panel.grid = element_blank(),
                                #panel.border = element_blank(),
                                axis.title = element_text(colour = "black", size = 16)
                        ) +
                        #facet_grid(cols = vars(variable_de_respuesta))
                        facet_grid(rows = vars(variable_de_respuesta), scales = "free_y") +
                        scale_color_manual(name = "Treatment", values = miscolores)
                
                 miscolores <- c("#F08080", "red", "#FFC0CB")
                miscolores 
                airquality <- airquality
                
                head(mar_db)
