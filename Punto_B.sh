#!/bin/bash

# Crear particiones en /dev/sdc
sudo fdisk /dev/sdc <<EOF
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
sudo partprobe /dev/sdc

# Formatear las particiones con ext4
sudo mkfs.ext4 /dev/sdc1
sudo mkfs.ext4 /dev/sdc2
sudo mkfs.ext4 /dev/sdc3
sudo mkfs.ext4 /dev/sdc4
sudo mkfs.ext4 /dev/sdc5
sudo mkfs.ext4 /dev/sdc6
sudo mkfs.ext4 /dev/sdc7
sudo mkfs.ext4 /dev/sdc8
sudo mkfs.ext4 /dev/sdc9
sudo mkfs.ext4 /dev/sdc10

# Crear puntos de montaje
sudo mkdir -p /EXAMENES-UTN/Alumno_1
sudo mkdir -p /EXAMENES-UTN/Alumno_2
sudo mkdir -p /EXAMENES-UTN/Alumno_3
sudo mkdir -p /EXAMENES-UTN/Profesores

# Montar las particiones
sudo mount /dev/sdc1 /EXAMENES-UTN/Alumno_1/parcial_1
sudo mount /dev/sdc2 /EXAMENES-UTN/Alumno_1/parcial_2
sudo mount /dev/sdc3 /EXAMENES-UTN/Alumno_1/parcial_3
sudo mount /dev/sdc4 /EXAMENES-UTN/Alumno_2/parcial_1
sudo mount /dev/sdc5 /EXAMENES-UTN/Alumno_2/parcial_2
sudo mount /dev/sdc6 /EXAMENES-UTN/Alumno_2/parcial_3
sudo mount /dev/sdc7 /EXAMENES-UTN/Alumno_3/parcial_1
sudo mount /dev/sdc8 /EXAMENES-UTN/Alumno_3/parcial_2
sudo mount /dev/sdc9 /EXAMENES-UTN/Alumno_3/parcial_3
sudo mount /dev/sdc10 /EXAMENES-UTN/Profesores

# Agregar entradas en /etc/fstab para montaje persistente
echo "/dev/sdc1 /EXAMENES-UTN/Alumno_1/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc2 /EXAMENES-UTN/Alumno_1/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc3 /EXAMENES-UTN/Alumno_1/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc4 /EXAMENES-UTN/Alumno_2/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc5 /EXAMENES-UTN/Alumno_2/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc6 /EXAMENES-UTN/Alumno_2/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc7 /EXAMENES-UTN/Alumno_3/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc8 /EXAMENES-UTN/Alumno_3/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc9 /EXAMENES-UTN/Alumno_3/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc10 /EXAMENES-UTN/Profesores ext4 defaults 0 0" | sudo tee -a /etc/fstab
