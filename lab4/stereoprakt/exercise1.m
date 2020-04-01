clc;
clear;
I1 = imread("tsukuba1.png");
I2 = imread("tsukuba2.png");
imshow(I1);
figure
imshow(I2);
disparityRange = [-6 10];
disparityMap = disparity(rgb2gray(I1),rgb2gray(I2),'BlockSize',...
    15,'DisparityRange',disparityRange);
figure 
imshow(disparityMap,disparityRange);
title('Disparity Map');
colormap(gca,jet) 
colorbar