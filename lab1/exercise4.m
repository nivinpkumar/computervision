clc;
clear;
matches1 = match('scene.pgm','book.pgm');
matches2 = match('scene.pgm','books25.pgm');
matches3 = match('scene.pgm','books50.pgm');
matches4 = match('scene.pgm','books100.pgm');
matches5 = match('scene.pgm','books200.pgm');
matches6 = match('scene.pgm','books300.pgm');
matches7 = match('scene.pgm','books400.pgm');

x = [0 25 50 100 200 300 400] ;
y = [98 100 91 42 3 0 0] ;
plot(x,y,'b--')
xlabel('Shearing rate')
ylabel('Number of matching')
title('Plot of Shearing VS Matching')

