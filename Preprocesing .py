
# coding: utf-8

# In[11]:


import os
import sys

from os import listdir
from os.path import isfile, join
import cv2
import numpy as np
from scipy import ndimage, misc
import matplotlib.pyplot as plt


# In[28]:


import time
a=1


# In[29]:


siftPath="C:/Users/Sergio/Desktop/Seminar/Preproccess/SIFT"
hePath="C:/Users/Sergio/Desktop/Seminar/Preproccess/HE"
log1Path="C:/Users/Sergio/Desktop/Seminar/Preproccess/LoG1"
log05Path="C:/Users/Sergio/Desktop/Seminar/Preproccess/LoG05"
dogPath="C:/Users/Sergio/Desktop/Seminar/Preproccess/DoG"

datasetPath="C:/Users/Sergio/Desktop/Seminar/NIR-VIS-2.0"


# In[32]:


for file_name in os.listdir(datasetPath):
        start_time = time.time()
        folder1Path=datasetPath+"/"+file_name+"/"
        for folder1 in os.listdir(folder1Path):
            folder2Path=datasetPath+"/"+file_name+"/"+folder1+"/"
            print(folder2Path)
            for folder2 in os.listdir(folder2Path):
                folder3Path=folder2Path+folder2+"/"
                for folder3 in os.listdir(folder3Path):
                    imagePath=folder3Path+folder3
                   
                    exists =os.path.exists(siftPath+"/"+file_name+"/"+folder1+"/"+folder2)
                    if not exists:
                        os.mkdir(siftPath+"/"+file_name+"/"+folder1+"/"+folder2)
                        os.mkdir(hePath+"/"+file_name+"/"+folder1+"/"+folder2)
                        os.mkdir(log1Path+"/"+file_name+"/"+folder1+"/"+folder2)
                        os.mkdir(log05Path+"/"+file_name+"/"+folder1+"/"+folder2)
                        os.mkdir(dogPath+"/"+file_name+"/"+folder1+"/"+folder2)

                    img=cv2.imread(imagePath,0)

                    # HE 
                    HE=cv2.equalizeHist(img)
                    # LoG
                    LoG05=ndimage.gaussian_laplace(img, sigma=0.5)
                    LoG1=ndimage.gaussian_laplace(img, sigma=1)
                    # DoG
                    blur5 = cv2.GaussianBlur(img,(5,5),0)
                    blur3 = cv2.GaussianBlur(img,(3,3),0)
                    DoG = blur5 - blur3
                    # SIFT 
                    ''' descs= None
                    sift = cv2.xfeatures2d.SIFT_create()
                    (kps, descs) = sift.detectAndCompute(img, None)'''
                    
                    
                    # Paths
                    siftImage=siftPath+"/"+file_name+"/"+folder1+"/"+folder2+imagePath[-8:-4]+"SIFT.txt"
                    heImage=hePath+"/"+file_name+"/"+folder1+"/"+folder2+imagePath[-8:-4]+"HE.png"
                    log1Image=log1Path+"/"+file_name+"/"+folder1+"/"+folder2+imagePath[-8:-4]+"LoG1.png"
                    log05Image=log05Path+"/"+file_name+"/"+folder1+"/"+folder2+imagePath[-8:-4]+"LoG05.png"
                    dogImage=dogPath+"/"+file_name+"/"+folder1+"/"+folder2+imagePath[-8:-4]+"DoG.png"
                    
                    # Saves
                    cv2.imwrite(heImage,HE)
                    cv2.imwrite(log1Image,LoG1)
                    cv2.imwrite(log05Image,LoG05)
                    cv2.imwrite(log1Image,LoG1)
                    cv2.imwrite(DoG,DoG)
                    '''if (not (descs) is None):
                        np.savetxt(siftImage,descs,delimiter=',')'''

                    a=a+1;
                    if (a==20):
                        print("--- %s seconds ---" % (time.time() - start_time))



# In[31]:


"C:/Users/Sergio/Desktop/Seminar/Newfolder/"+imagePath[-8:-4]+"DoG.png"

