#!/bin/bash

#Script para analizar los archivos limpios en cleanseq

for file in ./01_clean_reads/*.fastq.gz;
	do
		fastqc ${file};
	done
