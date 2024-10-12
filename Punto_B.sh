#!/bin/bash

# Crear 10 particiones de 1GB en /dev/sdc
sudo fdisk /dev/sdc << EOF
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


+1G
n
p
5


+1G
n
p
6


+1G
n
p
7


+1G
n
p
8


+1G
n
p
9


+1G
n
p
10


w
EOF

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

# Montar las particiones
sudo mount /dev/sdc1 /EXAMENES-UTN/Alumno_1/parcial_1
sudo mount /dev/sdc2 /EXAMENES-UTN/Alumno_1/parcial_2
sudo mount /dev/sdc3 /EXAMENES-UTN/Alumno_1/parcial_3
sudo mount /dev/sdc4 /EXAMENES-UTN/Alumno_1/parcial_4
sudo mount /dev/sdc5 /EXAMENES-UTN/Alumno_1/parcial_5
sudo mount /dev/sdc6 /EXAMENES-UTN/Alumno_1/parcial_6
sudo mount /dev/sdc7 /EXAMENES-UTN/Alumno_1/parcial_7
sudo mount /dev/sdc8 /EXAMENES-UTN/Alumno_1/parcial_8
sudo mount /dev/sdc9 /EXAMENES-UTN/Alumno_1/parcial_9
sudo mount /dev/sdc10 /EXAMENES-UTN/Alumno_1/parcial_10

# Agregar entradas en /etc/fstab para montaje persistente
echo "/dev/sdc1 /EXAMENES-UTN/Alumno_1/parcial_1 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc2 /EXAMENES-UTN/Alumno_1/parcial_2 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc3 /EXAMENES-UTN/Alumno_1/parcial_3 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc4 /EXAMENES-UTN/Alumno_1/parcial_4 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc5 /EXAMENES-UTN/Alumno_1/parcial_5 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc6 /EXAMENES-UTN/Alumno_1/parcial_6 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc7 /EXAMENES-UTN/Alumno_1/parcial_7 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc8 /EXAMENES-UTN/Alumno_1/parcial_8 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc9 /EXAMENES-UTN/Alumno_1/parcial_9 ext4 defaults 0 0" | sudo tee -a /etc/fstab
echo "/dev/sdc10 /EXAMENES-UTN/Alumno_1/parcial_10 ext4 defaults 0 0" | sudo tee -a /etc/fstab
