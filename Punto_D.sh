#!/bin/bash

# Crear la estructura de directorios
mkdir -p ~/Estructura_Asimetrica/correo/{cartas_{1..100},carteros_{1..10}}
mkdir -p ~/Estructura_Asimetrica/clientes/cartas_{1..100}

# Validar la creación de la estructura usando tree
if command -v tree &> /dev/null; then
    echo "Estructura creada:"
    tree ~/Estructura_Asimetrica/ --noreport | pr -T -s' ' -w 80 --column 4
else
    echo "El comando 'tree' no está instalado. Por favor, instálalo para visualizar la estructura."
fi
