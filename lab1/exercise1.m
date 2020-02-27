clc;
clear;
[I,keys,loc] = sift("scene.pgm");
whos
showkeys(I,loc);
matches1 = match('scene.pgm','book.pgm');
matches2 = match('scene.pgm','basmati.pgm');
matches3 = match('street.png','streetlarge.png');
matches3a = match('street.png','detail1.png');
matches3b = match('street.png','detail2.png');
matches3c = match('street.png','detail3.png');
matches3d = match('street.png','detail4.png');
matches3e = match('street.png','detail5.png');
matches4a = match('streetlarge.png','detail1.png');
matches4b = match('streetlarge.png','detail2.png');
matches4c = match('streetlarge.png','detail3.png');
matches4d = match('streetlarge.png','detail4.png');
matches4e = match('streetlarge.png','detail5.png');