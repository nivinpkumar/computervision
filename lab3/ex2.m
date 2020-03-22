clc;
clear;
I = imread("rectangle.tif");
[x,y] = scanpoints(I);
savescanpoints('par_lines1.dat',x,y);
