#!/bin/bash

#Media del tamaño de los contigs para cada muestra

for file in $(<sizecontigsname.txt);
	do
		awk '{total += $1; count++} END {print total/count}' ${file} >> meancontigs.txt
	done