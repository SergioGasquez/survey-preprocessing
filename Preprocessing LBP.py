
# coding: utf-8

# In[1]:


from LBP import LBP
import os
import sys

from os import listdir
from os.path import isfile, join
import cv2

lbpPath="C:/Users/Sergio/Desktop/Seminar/Preproccess/LBP/"
datasetPath="C:/Users/Sergio/Desktop/Seminar/NIR-VIS-2.0" 


# In[3]:


import time
a=1


# In[ ]:


for file_name in os.listdir(datasetPath):
        start_time = time.time()
        folder1Path=datasetPath+"/"+file_name+"/"
        for folder1 in os.listdir(folder1Path):
            folder2Path=datasetPath+"/"+file_name+"/"+folder1+"/"
            for folder2 in os.listdir(folder2Path):
                folder3Path=folder2Path+folder2+"/"
                for folder3 in os.listdir(folder3Path):
                    imagePath=folder3Path+folder3
                   
                    #print(lbpPath+"/"+file_name+"/"+folder1+"/"+folder2)
                    exists =os.path.exists(lbpPath+"/"+file_name+"/"+folder1+"/"+folder2)
                    #print (exists)
                    if not exists:
                        os.mkdir(lbpPath+"/"+file_name+"/"+folder1+"/"+folder2)
                    
                    #print(imagePath)
                    
                    imageLBP=LBP(imagePath)
                    lbpImage=lbpPath+file_name+"/"+folder1+"/"+folder2+imagePath[-8:-4]+"LBP.png"
                    #print(lbpImage)
                    cv2.imwrite(lbpImage,imageLBP)
                    a=a+1;
                    if (a==20):
                        print("--- %s seconds ---" % (time.time() - start_time))



