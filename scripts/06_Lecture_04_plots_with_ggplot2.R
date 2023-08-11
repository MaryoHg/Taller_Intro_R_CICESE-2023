## ------------------------------------------------------- ##
## Lecture 6: Sintaxis de ggplot2: Graficando with ggplot2 ##
## ------------------------------------------------------- ##
library(tidyverse)


## 1. Loading the raw dataframe and summarizing it: choose 
	df <- utils::read.delim('./data/fisicoquimicos.csv', header = T, stringsAsFactors = T)
	str(df)
	summary(df) # some NA's appears so I must be careful with this type of data
	head(df)
	
	## Visualizar "counts" de variables categóricas (o columnas con texto que agrupan datos)
	base::table(df$Tratamiento) # indicates 3 rows per level of "Treatment"
	base::table(df$days) # indicates 18 rows per level of "Tratamiento"
	base::table(df$variable_de_respuesta)
	
	head(df)
	
	df %>% 
	        # dplyr::filter(variable_de_respuesta == "pH") %>% 
	        ggplot(mapping = aes(x = days, y = valor, color = Tratamiento)) +
	        labs(x = "Tiempo (días)", y = "") +
	        theme_bw(base_size = 20) +
	        geom_boxplot() +
	        facet_grid(cols = vars(variable_de_respuesta)) +
	        theme(panel.grid = element_blank())

## 2. Determinar estadísticos: variables (factores) que agrupan mis valores 
	# variables de respuesta: pH, total_organic_carbon, g_N_per_kg_soil
	
	data_stats <- df %>% 
		dplyr::group_by(Tratamiento, days, variable_de_respuesta) %>% # agrupo datos para estadísticos
		dplyr::summarise(N = n(), # cuántas réplicas tiene cada determinación
				 promedio = mean(valor, na.rm = TRUE), # determinar promedio por día, tratamiento y variable
				 sd = sd(valor), # desviación estándar por día, tratamiento y variable
 				 se = sd(valor)/sqrt(N), # error estándar de la media por día, tratamiento y variable
				 .groups = "drop") %>% 
	        dplyr::arrange(variable_de_respuesta, Tratamiento, days) # ordenar a discreción
	
	data_stats
	
## 3. Barplot de cada variable medida:
	
        # 3.1. Ploting Soil pH
	
	data_stats %>% 
		dplyr::filter(variable_de_respuesta == "pH") %>% 
		ggplot(mapping = aes(x = factor(days), y = promedio, fill = Tratamiento)) + 
		theme_bw(base_size = 16) +
		labs (x = "Tiempo (días)", y = "pH del suelo", title = "Dinámica del pH del suelo por 70 días") +
		geom_bar(stat = "identity", width = 0.8, position = position_dodge(0.9), alpha = 0.7) +
		geom_errorbar(aes(ymin=promedio-se, ymax=promedio+se), colour="black", width = 0.5,
			      position = position_dodge(0.9), alpha = 0.7) + ## barras del error estándar agregadas
		scale_fill_manual(name = "Tratamientos", values = c("blue", "red", "cyan")) +
		scale_y_continuous(name = "pH del suelo", limits = c(0,7), breaks = seq(0,7,1.5), expand = c(0,0)) +
		theme(panel.grid = element_blank(),
		      legend.text = element_text(size = 12, colour = "black"),
		      axis.text = element_text(size = 12, colour = "black"))
	
	## 2. Line plot
	data %>% 
		dplyr::filter(variable_medida == "pH") %>% 
		ggplot(mapping = aes(x = factor(Day), y = promedio, color = Treatment)) + 
		theme_bw(base_size = 16) +
		labs (x = "Tiempo (días)", y = "pH", title = "Dinámica del pH del suelo por 70 días") +
		geom_line(aes(group = Treatment), linewidth = 1.5) +
		geom_errorbar(aes(ymin=promedio-se, ymax=promedio+se), colour="black", width = 0.2, position = position_dodge(0.9), alpha = 0.7) +
		geom_point(mapping = aes(x = factor(Day), y = promedio, group = Treatment), color = "black", size = 3) +
		scale_color_manual(values = c("gray70", "steelblue", "orange")) +
		scale_y_continuous(name = "pH del suelo", limits = c(4,8), breaks = seq(4,8,1), expand = c(0,0)) +
		theme(panel.grid = element_blank(),
		      legend.text = element_text(size = 14, colour = "black"),
		      legend.position = c(0.8, 0.8),
		      plot.title = element_text(color = "black", size = 16, face = "bold"))
		

	## 3. Boxplot
	data_long %>% 
		dplyr::filter (variable_medida == "pH") %>%
		ggplot(aes(x=factor(Day),y=values, fill=Treatment)) +
		theme_bw(base_size = 16) +
		geom_boxplot(outlier.colour = "orange") +
		# geom_point(size = 2, position = "jitter", aes(x = factor(Day), y = values, color = Treatment)) +
		labs (x = "Tiempo (días)", y = "pH del suelo", 
		      title = "Dinámica de Carbono del suelo por 70 días") +
		scale_y_continuous(name = "pH del suelo", limits = c(4,7), breaks = seq(4,7,0.5), expand = c(0,0),
				   labels = c(4,"",5,"",6,"",7)) +
		scale_fill_manual(values = c("gray70", "steelblue", "orange")) +
		theme(panel.grid = element_blank(),
		      legend.text = element_text(size = 14, colour = "black"),
		      # legend.position = c(0.8, 0.8),
		      plot.title = element_text(color = "black", size = 16, face = "bold"),
		      axis.text = element_text(color = "black", size = 16),
		      panel.grid.major.y = element_line(linewidth = 0.3, color = "gray80", linetype = "dashed"))