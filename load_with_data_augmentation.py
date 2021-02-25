# load data With data augmentation 
from keras.preprocessing.image import ImageDataGenerator
import glob
import cv2
import numpy as np
from keras.preprocessing import image
from keras.utils import to_categorical

datagen = ImageDataGenerator(
        featurewise_center=False,  # set input mean to 0 over the dataset
        samplewise_center=False,  # set each sample mean to 0
        featurewise_std_normalization=False,  # divide inputs by std of the dataset
        samplewise_std_normalization=False,  # divide each input by its std
        zca_whitening=False,  # apply ZCA whitening
        rotation_range = 10,  # randomly rotate images in the range (degrees, 0 to 180)
        zoom_range = 0.2, # Randomly zoom image 
        width_shift_range=0.1,  # randomly shift images horizontally (fraction of total width)
        height_shift_range=0.1,  # randomly shift images vertically (fraction of total height)
        horizontal_flip = True,  # randomly flip images
        vertical_flip=False)  # randomly flip images
        
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
        x = image.img_to_array(img) #convert PIL image to array type
        x = x.reshape((1,) + x.shape) # for generate more image from this image we should reshape it in 4D (1 * X * Y * channel)
        counter = 0 #for stop generator we need to count how many extra image created by our generator
        for batch in datagen.flow(x, batch_size=1): # generate image
          img2 = image.smart_resize(batch[0],(224, 224)) #resize it without loosing aspect ratio
          Xtrain.append(img2) #append train data
          Ytrain.append(label)#append test data
          counter = counter + 1
          if counter >= 2: # we create only 2 image from existing image
            break # if counter >= 2 wich mean we create 0 and 1 image so we break

Xtrain = np.array(Xtrain)
Ytrain = np.array(Ytrain)
Ytrain = to_categorical(Ytrain) # convert label for classification
# for deep learning classification we need :
#class 0 we need [1  ,0  ,0] for label
#class 1 we need [0  ,1  ,0] for label
#class 2 we need [0  ,0  ,1] for label
