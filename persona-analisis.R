#install.packages("arules")
library(arules)
data_persona <-read.csv('/home/jesfrin/Documentos/maestria/4to trimestre/mineria-de-datos/tareas/tarea2/PERSONA_BDP.csv', sep = ",")

data_persona <- data_persona[, !colnames(data_persona) %in% c("PEA")]
data_persona <- data_persona[, !colnames(data_persona) %in% c("POCUPA")]
data_persona <- data_persona[, !colnames(data_persona) %in% c("PEI")]

colnames(data_persona)


total_filas <- nrow(data_persona)
subset_filas <- round(total_filas * 0.20)

#muestra aleatoria del 25% de las filas
set.seed(123)  
data_persona_subset <- data_persona[sample(1:total_filas, subset_filas), ]
colnames(data_persona_subset)

# Uso de subconjunto para el análisis
reglas <- apriori(data_persona_subset, parameter = list(support = 0.2, confidence = 0.5))


inspect(reglas[0:100])
inspect(reglas[0:150])



