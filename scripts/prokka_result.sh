#!/bin/bash

#Movemos los archivos que nos interesan de ejecutar prokka y les cambiamos el nombre según la muestra

mkdir 07_prokka_result #Creamos la carpeta para guardar los resultados

for dir in $(<prokka_dir.txt);
   do
	cp ${dir}/PROKKA_*.gff 07_prokka_result/$(basename "$dir")
   done