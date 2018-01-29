from keras.models import load_model
from PIL import Image
import numpy as np
import cv2
from scipy.spatial import distance


model = load_model('/home/sergio/Downloads/modelWe.h5')


file = open('/home/sergio/Downloads/annotationsRaw.txt','r')
a=0
for line in file:
    fields = line.split("\t")
    imPath=fields[0]
    imPath2=fields[1]
    imPath2=imPath2[:-1]

    im=cv2.imread(imPath)
    im = cv2.resize(im,(224,224))
    im = im.transpose((2,0,1))
    im = np.expand_dims(im, axis=0)
    out= model.predict(im)

    
    im2=cv2.imread(imPath2)
    im2 = cv2.resize(im2,(224,224))
    im2 = im2.transpose((2,0,1))
    im2 = np.expand_dims(im2, axis=0)
    out2= model.predict(im2)

    out=out/np.linalg.norm(out)
    out2=out2/np.linalg.norm(out2)
    dst = distance.euclidean(out,out2)
    if a<500 :
       print('1',end=' ')
       print(dst)
       a=a+1
    else:
       print('0',end=' ')
       print(dst)

