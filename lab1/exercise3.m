clc;
clear;
matches1 = match('scene.pgm','book.pgm');
matches2 = match('scene.pgm','bookr10.pgm');
matches3 = match('scene.pgm','bookr20.pgm');
matches4 = match('scene.pgm','bookr30.pgm');
matches5 = match('scene.pgm','bookr40.pgm');
matches6 = match('scene.pgm','bookr50.pgm');
matches7 = match('scene.pgm','bookr60.pgm');
matches8 = match('scene.pgm','bookr70.pgm');
matches9 = match('scene.pgm','bookr80.pgm');
matches10 = match('scene.pgm','bookr90.pgm');
matches11 = match('scene.pgm','bookr180.pgm');
matches12 = match('scene.pgm','bookr270.pgm');

x = [0 10 20 30 40 50 60 70 80 90 180 270] ;
y = [98 103 98 100 102 95 107 101 100 102 102 107] ;
plot(x,y,'b--')
xlabel('Rotation')
ylabel('Number of matching')
title('Plot of Rotation VS Matching')
