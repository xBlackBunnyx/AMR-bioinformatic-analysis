#!/bin/bash

#Cambia el nombre del resultado de bowtie2

rename _filtered.fastq.1.gz .filtered_R1.fastq.gz ERR*_filtered.fastq.1.gz #Cambia los R1
rename _filtered.fastq.2.gz .filtered_R2.fastq.gz ERR*_filtered.fastq.2.gz #Cambia los R2
