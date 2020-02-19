close all;
%% Gaussian Noise
% read image
P = imread('images/ntugn.jpg');

% filter image 
% 3x3
P2 = medfilt2(P); % Default filter size is 3x3
imshowpair(P, P2, 'montage');

% 5x5
P3 = medfilt2(P, [5, 5]);
figure
imshowpair(P2, P3, 'montage');

%% Speckle Noise
% read image
P4 = imread('images/ntusp.jpg');

% filter image
% 3x3
P5 = medfilt2(P4); % Default filter size is 3x3
figure
imshowpair(P4, P5, 'montage');

% 5x5
P6 = medfilt2(P4, [5, 5]);
figure
imshowpair(P5, P6, 'montage');