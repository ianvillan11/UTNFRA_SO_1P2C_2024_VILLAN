#!/bin/bash

# Crear el directorio si no existe
mkdir -p ../RTA_ARCHIVOS_Examen_20241008/

# Cambiar al directorio creado
cd ../RTA_ARCHIVOS_Examen_20241008/ || exit 1  # Salir si el cd falla

# Obtener información
IP_PUBLICA=$(curl -s ifconfig.me)
USUARIO=$(whoami)
HASH_USUARIO=$(openssl passwd -6 "$USUARIO")
URL_REPO=$(git config --get remote.origin.url)

# Crear el archivo y escribir en él
echo "Mi IP Publica es: $IP_PUBLICA" > Filtro_Avanzado.txt
echo "Mi usuario es: $USUARIO" >> Filtro_Avanzado.txt
echo "El Hash de mi Usuario es: $HASH_USUARIO" >> Filtro_Avanzado.txt
echo "La URL de mi repositorio es: $URL_REPO" >> Filtro_Avanzado.txt
