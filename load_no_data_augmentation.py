# load data Normally
import glob
import cv2
import numpy as np
from keras.preprocessing import image
from keras.utils import to_categorical
        
classes = ["Covid", "Normal", "Viral Pneumonia"] # write the folder names
Xtrain = []
Ytrain = []
for i, c in enumerate(classes):
    print("loading", c)
    filenames = glob.glob("drive/My Drive/dataset/train/{}/*.*".format(c)) # collect all images in folder 
    #-- warning: the folder should contain only images files
    n = len(filenames)
    label = i
    for j, f in enumerate(filenames): #for each image inside folder
        img = cv2.imread(f, cv2.IMREAD_COLOR) # load image
        img = cv2.cvtColor(img, cv2.COLOR_BGR2RGB) # change channels to RGB
        #-- note: openCV (cv2) load image with format of BGR - its better to convert it to RGB
        img2 = image.smart_resize(img,(224, 224)) #resize it without loosing aspect ratio
        img2 = image.img_to_array(img2) #convert PIL image to array type
        Xtrain.append(img2) #append train data
        Ytrain.append(label)#append test data

Xtrain = np.array(Xtrain)
Ytrain = np.array(Ytrain)
Ytrain = to_categorical(Ytrain) # convert label for classification
# for deep learning classification we need :
#class 0 we need [1  ,0  ,0] for label
#class 1 we need [0  ,1  ,0] for label
#class 2 we need [0  ,0  ,1] for label
