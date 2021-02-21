Edge Detection with sobel - convoution - matlab
====================================
there are many algorithm and masks that show us the image edges i try to code them and put them in one place both for matlab and python for all researcher and student as a refrence - i add other algorithm in future

i use Lena image 512*125

![lena](https://github.com/Mehdi-AminGhafouri/University/blob/edge_detection/sobel/Lena.png)


SOBEL:
------
the main idea is using convolution with 2 mask and then magnitude them for final result
in convolution we move the mask over the image and apply it to the selected pixel for all pixel in image
there are two mask first show horizontal edges and second show vertical edges the we apply the mask on image with convolution

![two filter](https://github.com/Mehdi-AminGhafouri/University/blob/edge_detection/sobel/extra/sobel_two_filter.png)

in sobel we should mix two output from each convolution in a special way 

![two filter](https://github.com/Mehdi-AminGhafouri/University/blob/edge_detection/sobel/extra/sobel_mix_two_filter.png)


the horizontal and vertical result :

![two filter](https://github.com/Mehdi-AminGhafouri/University/blob/edge_detection/sobel/extra/result_mask.png)


the final output result is:

![two filter](https://github.com/Mehdi-AminGhafouri/University/blob/edge_detection/sobel/extra/result.png)

Usage:
------
use this projects as a samples and a start state for your project or homework
you can run .m file with matlab and .py file with any python IDE




Authors:
--------
* Origianl Author: Mehdi A.Ghafouri
* https://github.com/Mehdi-AminGhafouri
* https://www.linkedin.com/in/mehdi-a-ghafouri/
* https://www.researchgate.net/profile/Mehdi_Aghafouri

