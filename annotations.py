import os
import sys

from os import listdir
from os.path import isfile, join
import numpy as np

pathNIR1="/home/sergio/Downloads/Seminar/Preproccess/Raw/s1/NIR_128x128/"
pathVIS1="/home/sergio/Downloads/Seminar/Preproccess/Raw/s1/VIS_128x128/"

pathNIR2="/home/sergio/Downloads/Seminar/Preproccess/Raw/s2/NIR_128x128/"
pathVIS2="/home/sergio/Downloads/Seminar/Preproccess/Raw/s2/VIS_128x128/"

'''pathNIR3="/home/sergio/Downloads/Seminar/Preproccess/LoG05/s3/NIR_128x128/"
pathVIS3="/home/sergio/Downloads/Seminar/Preproccess/LoG05/s3/VIS_128x128/"

pathNIR4="/home/sergio/Downloads/Seminar/Preproccess/LoG05/s4/NIR_128x128/"
pathVIS4="/home/sergio/Downloads/Seminar/Preproccess/LoG05/s4/VIS_128x128/"
'''
a=0
# Positive Classes
for file_name in os.listdir(pathNIR1):
    for image in os.listdir(pathNIR1+file_name+"/"):
        for image2 in os.listdir(pathVIS1+file_name+"/"):
            if a<500:
                print(pathNIR1+file_name+"/"+image,end='	')
                print(pathVIS1+file_name+"/"+image2)
                #print(a) 
                a=a+1              
a=0
# Negative Classes
for file_name in os.listdir(pathNIR1):
    for image in os.listdir(pathNIR1+file_name+"/"):
        for folder2 in os.listdir(pathVIS2+"/"):
        	for image2 in os.listdir(pathVIS2+"/"+folder2):
	            if a<500:
	                print(pathNIR1+file_name+"/"+image,end='	')
	                print(pathVIS2+folder2+"/"+image2)
	                #print(a) 
	                a=a+1


            