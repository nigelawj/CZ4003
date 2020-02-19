close all;
P = imread('images/mrttrainbland.jpg');
whos P

imhist(P, 10);
figure
imhist(P, 256);

P3 = histeq(P, 255);

figure
imhist(P3, 10);
figure
imhist(P3, 256);

P4 = histeq(P3, 255);

figure
imhist(P4, 10);
figure
imhist(P4, 256);