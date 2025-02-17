#!/bin/bash

#Cuenta el número de secuencias dentro de cada muestra

for file in *.fastq.gz;
	do
		echo -e "${file}: \c" | zgrep -c "^@ERR" ${file} >> nseqraw.txt;
	done

