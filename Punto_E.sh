#!/bin/bash

# Definir la ruta del repositorio
REPO_PATH=~/RTA_ARCHIVOS_Examen_<2024-10-13>

# Crear la carpeta si no existe
mkdir -p "$REPO_PATH"

# Archivo donde se guardará la información
OUTPUT_FILE="$REPO_PATH/Filtro_Basico.txt"

# Limpiar el archivo si ya existe
> "$OUTPUT_FILE"

# Extraer total de memoria RAM y agregar al archivo
echo "Total de memoria RAM:" >> "$OUTPUT_FILE"
grep '^MemTotal:' /proc/meminfo >> "$OUTPUT_FILE"

# Extraer información del fabricante del chasis y agregar al archivo
echo "Fabricante del chasis:" >> "$OUTPUT_FILE"
sudo dmidecode -t chassis | grep 'Manufacturer:' >> "$OUTPUT_FILE"

# Mostrar el contenido del archivo como confirmación
cat "$OUTPUT_FILE"
