#!/usr/bin/env python
import os

#Ponemos el directorio donde están los archivos
directory = os.fsencode('/home/lmartindorta/TFM/rawseq')

for file in os.listdir(directory):
    filename = os.fsdecode(file) #Selecciona los archivos que son
    if filename.endswith(".fastq"): #Elige los archivos que queremos
        fastqc filename
        continue
    else: #Evita el bloqueo del bucle
        continue