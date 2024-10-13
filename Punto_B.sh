#!/bin/bash

# Crear particiones en /dev/sdc
sudo fdisk /dev/sde <<EOF
d
1
d
2
d
3
d
4
n
p
1

+1G
n
p
2

+1G
n
p
3

+1G
n
p
4

n
e
5

n
l
1

+1G
n
l
2

+1G
n
l
3

+1G
n
l
4

+1G
n
l
5

+1G
n
l
6

+1G
n
l
7

+1G
n
l
8

+1G
n
l
9

+1G
n
l
10

+1G
w
EOF

# Forzar al kernel a leer la tabla de particiones
sudo partprobe /dev/sde

# Formatear las particiones con ext4
sudo mkfs.ext4 /dev/sde1
sudo mkfs.ext4 /dev/sde2
sudo mkfs.ext4 /dev/sde3
sudo mkfs.ext4 /dev/sde4
sudo mkfs.ext4 /dev/sde5
sudo mkfs.ext4 /dev/sde6
sudo mkfs.ext4 /dev/sde7
sudo mkfs.ext4 /dev/sde8
sudo mkfs.ext4 /dev/sde9
sudo mkfs.ext4 /dev/sde10

# Crear puntos de montaje
sudo mkdir -p /EXAMENES-UTN/Alumno_1
sudo mkdir -p /EXAMENES-UTN/Alumno_2
sudo mkdir -p /EXAMENES-UTN/Alumno_3
sudo mkdir -p /EXAMENES-UTN/Profesores

# Montar las particiones
sudo mount /dev/sde1 /EXAMENES-UTN/Alumno_1/parcial_1
sudo mount /dev/sde2 /EXAMENES-UTN/Alumno_1/parcial_2
sudo mount /dev/sde3 /EXAMENES-UTN/Alumno_1/parcial_3
sudo mount /dev/sde4 /EXAMENES-UTN/Alumno_2/parcial_1
sudo mount /dev/sde5 /EXAMENES-UTN/Alumno_2/parcial_2
sudo mount /dev/sde6 /EXAMENES-UTN/Alumno_2/parcial_3
sudo mount /dev/sde7 /EXAMENES-UTN/Alumno_3/parcial_1
sudo mount /dev/sde8 /EXAMENES-UTN/Alumno_3/parcial_2
sudo mount /dev/sde9 /EXAMENES-UTN/Alumno_3/parcial_3
sudo mount /dev/sde10 /EXAMENES-UTN/Profesores

# Agregar entradas en /etc/fstab para montaje persistente
echo "/dev/sde1 /EXAMENES-UTN/Alumno_1/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sde2 /EXAMENES-UTN/Alumno_1/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sde3 /EXAMENES-UTN/Alumno_1/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sde4 /EXAMENES-UTN/Alumno_2/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sde5 /EXAMENES-UTN/Alumno_2/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sde6 /EXAMENES-UTN/Alumno_2/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sde7 /EXAMENES-UTN/Alumno_3/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sde8 /EXAMENES-UTN/Alumno_3/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sde9 /EXAMENES-UTN/Alumno_3/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sde10 /EXAMENES-UTN/Profesores ext4 defaults 0 0" | sudo tee -a /etc/fstab
