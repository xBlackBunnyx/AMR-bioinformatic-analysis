#!/bin/bash

#Cuenta la longitd media de las secuencias

for file in $(<filename.txt);
	do
		echo -e "${file}: \c" >> mean_length.txt ;\
		awk '{if(NR%4==2) {count++; bases += length}} END{print bases/count}' ${file} >> mean_length.txt
	done