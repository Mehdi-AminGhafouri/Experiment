clear;
clc;

lena = imread('Lena.png');% lead the image
img = double(rgb2gray(lena)); % convert it to double
[X,Y] = size(img); % get size of image
Mask1 = double([ % create sobel horizontal edge finder mask
    1,2,1
    0,0,0
    -1,-2,-1
    ]);
Mask2 = double([% create sobel vertical edge finder mask
    1,0,-1
    2,0,-2
    1,0,-1
    ]);

% because we use this mask for calculating value of the center pixcel of mask
% we will loose 2 pixcel from each side top/bottom/left/right
lenaA = zeros(X-4,Y-4); % our horizontal output will be a little smaller
for k=2:(X-2)
    for p=2:(Y-2)
        matrix = Mask1.*img(k-1:k+1, p-1:p+1);  
        avg = sum(matrix(:)); 
        lenaA(k-1,p-1) = avg; 
     
    end
end

lenaB = zeros(X-4,Y-4); % our vertical output will be a little smaller
for k=2:(X-2)
    for p=2:(Y-2)
        matrix = Mask2.*img(k-1:k+1, p-1:p+1);  
        avg = sum(matrix(:)); 
        lenaB(k-1,p-1) = avg; 
                
    end
end

%absolute magnitude of the gradient at each point
lenaFinal = sqrt(lenaA.^2 + lenaB.^2);

%--- faster version absolute magnitude ----------
% lenaFinal = abs(lenaA) + abs(lenaB);

figure(1);
imshow(uint8(img));
title('lena');


figure(2);
imshow(uint8(lenaFinal));
title('lena absolute magnitude');

