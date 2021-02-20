clear
clc

boardSize = 400;
boardScale = boardSize/8;
A = [ 
    0 , 255 , 0 , 255 , 0 , 255 , 0 , 255
    255 , 0 , 255 , 0 , 255 , 0 , 255 , 0
    0 , 255 , 0 , 255 , 0 , 255 , 0 , 255
    255 , 0 , 255 , 0 , 255 , 0 , 255 , 0
    0 , 255 , 0 , 255 , 0 , 255 , 0 , 255
    255 , 0 , 255 , 0 , 255 , 0 , 255 , 0
    0 , 255 , 0 , 255 , 0 , 255 , 0 , 255
    255 , 0 , 255 , 0 , 255 , 0 , 255 , 0
];
I = uint8(A);
chessBoard = imresize(I,boardScale,'nearest'); % 'nearest' or 'box'
imshow(chessBoard)