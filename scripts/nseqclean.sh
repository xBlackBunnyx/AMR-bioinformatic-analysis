#!/bin/bash

#Cuenta el número de secuencias dentro de cada muestra

for file in *.clean.fastq.gz;
	do
		echo $file >> nseqclean.txt
		zgrep -c "^@" $file >> nseqclean.txt;
	done

