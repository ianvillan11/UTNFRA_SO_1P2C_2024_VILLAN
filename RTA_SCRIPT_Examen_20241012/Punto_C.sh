#!/bin/bash

CLAVE="riverplate2020"

# Crear grupos
sudo groupadd p1c2_2024_gAlumno
sudo groupadd p1c2_2024_gProfesores

# Crear usuarios y asignar grupos
sudo useradd -m -G p1c2_2024_gAlumno -p $(openssl passwd -1 $CLAVE) p1c2_2024_A1
sudo useradd -m -G p1c2_2024_gAlumno -p $(openssl passwd -1 $CLAVE) p1c2_2024_A2
sudo useradd -m -G p1c2_2024_gAlumno -p $(openssl passwd -1 $CLAVE) p1c2_2024_A3
sudo useradd -m -G p1c2_2024_gProfesores -p $(openssl passwd -1 $CLAVE) p1c2_2024_P1

# Crear las carpetas necesarias
sudo mkdir -p /Examenes-UTN/alumno_1
sudo mkdir -p /Examenes-UTN/alumno_2
sudo mkdir -p /Examenes-UTN/alumno_3
sudo mkdir -p /Examenes-UTN/profesores

# Ajustar permisos para las carpetas
# Para alumno_1: dueño puede hacer todo, grupo puede leer y ejecutar, otros no pueden
sudo chown p1c2_2024_A1:p1c2_2024_gAlumno /Examenes-UTN/alumno_1
sudo chmod 750 /Examenes-UTN/alumno_1

# Para alumno_2: dueño puede hacer todo, grupo y otros no pueden
sudo chown p1c2_2024_A2:p1c2_2024_gAlumno /Examenes-UTN/alumno_2
sudo chmod 700 /Examenes-UTN/alumno_2

# Para alumno_3: dueño y grupo pueden hacer todo, otros pueden leer y ejecutar
sudo chown p1c2_2024_A3:p1c2_2024_gAlumno /Examenes-UTN/alumno_3
sudo chmod 770 /Examenes-UTN/alumno_3
sudo chmod o+rx /Examenes-UTN/alumno_3

# Para profesores: dueño y grupo pueden hacer todo, otros no pueden
sudo chown p1c2_2024_P1:p1c2_2024_gProfesores /Examenes-UTN/profesores
sudo chmod 770 /Examenes-UTN/profesores

# Crear archivo validar.txt en cada carpeta con la salida de whoami
echo "=== Validar usuarios ===" > /Examenes-UTN/alumno_1/validar.txt
sudo -u p1c2_2024_A1 whoami >> /Examenes-UTN/alumno_1/validar.txt

echo "=== Validar usuarios ===" > /Examenes-UTN/alumno_2/validar.txt
sudo -u p1c2_2024_A2 whoami >> /Examenes-UTN/alumno_2/validar.txt

echo "=== Validar usuarios ===" > /Examenes-UTN/alumno_3/validar.txt
sudo -u p1c2_2024_A3 whoami >> /Examenes-UTN/alumno_3/validar.txt

echo "=== Validar usuarios ===" > /Examenes-UTN/profesores/validar.txt
sudo -u p1c2_2024_P1 whoami >> /Examenes-UTN/profesores/validar.txt

echo "Usuarios y permisos creados exitosamente."
