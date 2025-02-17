#!/bin/bash

#Unimos todas las tablas generadas en una sola

for sample in $(<seqs.txt);
   do
	tail -n+2 ${sample}_summary_table.txt >> all_samples_summary_table.txt #Unimos todas las tablas
   done
#Añadimos el encabezado
sed -i "1i$(head -n  1 ERR131800_summary_table.txt)" all_samples_summary_table.txt