# Leer y procesar un archivo de números enteros, calcular estadísticos y escribir resultados.

# Función para leer números desde un archivo
leer_numeros <- function(numeros.txt) {
  if (!file.exists(numeros.txt)) {
    stop("El archivo no existe. Verifica el nombre y la ubicación.")
  }
  # Leer los datos como un vector de enteros
  numeros <- as.integer(readLines(nombre_archivo))
  return(numeros)
}

# Cargar datos desde numeros.txt
nombre_archivo <- "numeros.txt"
numeros <- leer_numeros(numeros.txt)

# Calcular estadísticos
media_numeros <- mean(numeros, na.rm = TRUE)
mediana_numeros <- median(numeros, na.rm = TRUE)
desviacion_numeros <- sd(numeros, na.rm = TRUE)

# Mostrar mensaje si hay alta variabilidad
if (desviacion_numeros > 10) {
  cat("Alta variabilidad detectada en los datos.\n")
}

# Calcular el cuadrado de cada número usando sapply()
cuadrados <- sapply(numeros, function(x) x^2)

# Escribir resultados en resultados.txt
nombre_salida <- "resultados.txt"
con <- file(nombre_salida, open = "w")
writeLines(c(
  "# Resultados del procesamiento de numeros.txt",
  paste("Media:", media_numeros),
  paste("Mediana:", mediana_numeros),
  paste("Desviación estándar:", desviacion_numeros),
  if (desviacion_numeros > 10) "Alta variabilidad detectada." else NULL,
  "",
  "# Cuadrados de los números:"
), con)

# Añadir los números al archivo de salida
writeLines(as.character(cuadrados), con)
close(con)

cat("El procesamiento se ha completado. Los resultados están en resultados.txt.\n")
