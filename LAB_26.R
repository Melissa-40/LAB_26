#############################################
#LABORATORIO: Tidy data (datos ordenados) 1 #
#############################################
#Prerrequisitos
#instalar paquete tidyverse
install.packages("tidyverse")

library(tidyverse)

   
#instalar paquete de datos
install.packages("remotes")

remotes::install_github("cienciadedatos/datos")


install.packages("datos")

#Cargar paquete tidyverse
library(tidyverse)

#Cargar paquete de datos
library(datos)

#tabla 1 hasta tabla 4b
#ver datos como tibble 
datos::tabla1
datos::tabla2
datos::tabla3
datos::tabla4a
datos::tabla4b

#ver datos como dataframe 
df1<-data.frame(tabla1)
df2<-data.frame(tabla2)
df3<-data.frame(tabla3)
df4a<-data.frame(tabla4a)
df4b<-data.frame(tabla4b)

#exportar los dataframes originales
write.csv(df1,file="df1.csv")
write.csv(df2,file="df2.csv")
write.csv(df3,file="df3.csv")
write.csv(df4a,file="df4a.csv")
write.csv(df4b,file="df4b.csv")

library(dplyr)
install.packages("tidyr")
library(tidyr)
# Ordenar datos con la tabla4a (PIVOTAR)
t4a_PIVOTANTE=tabla4a %>% 
  pivot_longer(cols=c("1999", "2000"), names_to="anio", values_to="casos")

# Exportar resultado: tabla ordenada
write.csv(t4a_PIVOTANTE, file = "t4a_PIVOTANTE.csv")

install.packages("remotes")
utils::contrib.url(repos = , "source")

install.packages("remotes", repos = "https://cloud.r-project.org")

options(repos = c(CRAN = "https://cloud.r-project.org"))

install.packages("remotes")

options(download.file.method = "libcurl")


######PARTE 2######
####################
#                  #
#     Tidy data    #
#                  #
####################


#EJERCICIO 2: PIVOTAR Y UNIR TABLAS
#PARTE 2
# ver tabla4b

# 1. Pivotar tabla 4b "A LO LARGO"
t4b_PIVOTANTE = tabla4b %>% 
  pivot_longer(cols = c(`1999`, `2000`), names_to = "anio", values_to = "población")

# Unir tablas ordenadas
union_t4=left_join(t4a_PIVOTANTE, t4b_PIVOTANTE)

# Exportar resultado: tabla4a + tabla4b (ordenada)
write.csv(union_t4, file = "union_t4.csv")

#EJERCICIO 3: DATOS ANCHOS CON TABLA 2
# 1. Pivotar tabla 2 "A LO ANCHO"
#VER TABLA 2 
# Ordenar datos con la tabla 2 (PIVOTAR a lo ANCHO)
t2_ancha=tabla2 %>% pivot_wider(names_from = tipo, values_from = cuenta)

# Exportar resultado: tabla ordenada
write.csv(t2_ancha, file = "t2_ancha.csv")
