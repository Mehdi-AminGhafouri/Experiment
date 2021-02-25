
% // Load Images---------------------------------------
% // our images are 400*300 so we create an array of images and labels with proper size
x = 400;
y = 300;
images = zeros(1,x,y);
images_lb = zeros(1,1);


% // read images from folder-----------------------------------------------------------------------------------------------------
% // we get the all data names inside FolderName in current directory
data ='FolderName'; 
lb = ls(data);
labels = lb(3:end,:); % // first 2 item are from folder settings so we dont need them
[a1,b1] = size(labels(:,1)); % // we get maximum number of files (ex: 60 file in this folder)
[a2,b2] = size(labels(1,:)); % // we get maximum length of all file names (ex: 24 character file name)



% // find the length of each name file-----------------------------------------------------------------------------------------------------
  
label_lengths = zeros(a1,1); % // so we have a1 (number) of files and we need to find out how many character each file name have
for k=1:a1 % // for each file
    counter = 0;
    for k2=1:b2 % // for the length of characters in name of thet file
        if label_lengths(k,1) == 0  % // if the file dosent set before
            if double(labels(k,k2))~= 32 % // if the name of the file dosent reach SPACE
                counter = counter+1; 
            end
        end
    end
    label_lengths(k,1) = counter; % // we sign the length of these file to length array
end


% // load all images per each class folder-----------------------------------------------------------------------------------------------------
counter = 1;
for k=1:size(labels(:,1)) % // for each file
    address = [data,'/',labels(k,:)]; % // adress is = "FolderName/ClassName"
    lb = ls(address); % // we load all data of inside current class folder
    imgList = lb(3:end,:); % // we get the list of images of class folder
    
    for k2=1:size(imgList(:,1)) % // for each image
        img_dir = [data,'/',labels(k,1:label_lengths(k,1)),'/',imgList(k2,:)]; % // load image from : "FolderName/ClassName/imageName"
        img = imread(img_dir); % // read image
        img = double(rgb2gray(img)); % // convert image to gray
        images(counter,:,:) = imresize(img,[x,y]); // resize image and add it into images list 
        % //-- warrning: you may loose aspect ratio if your image wont be 4:3 ratio
        % //-- note: in  images(counter,:,:)  if counter image existed it will overwite if not existed befor assign as new item in array 
        images_lb(counter,1)= k; % // assign the number of folder as Class label ( ex: 2 is the label of second folderClass )
        counter = counter + 1;
    end
end
