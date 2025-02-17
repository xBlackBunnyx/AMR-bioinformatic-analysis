#!/bin/bash

#Script para hacer el fastqc en rawseq

for file in ./00_raw_data/*.fastq.gz;
	do fastqc ${file};
	done
