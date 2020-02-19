close all;
%% Gaussian Noise
% sigma = 1
h1 = fspecial('gaussian', 5, 1);
h1 = (h1/sum(h1(:)));
mesh(h1)

% sigma = 2
h2 = fspecial('gaussian', 5, 2);
h2 = (h2/sum(h2(:)));
figure
mesh(h2)

% read image (gaussian noise)
P = imread('images/ntugn.jpg');
figure
imshow(P);

% filter image
% 3x3
P2 = conv2(P, h1, 'same');
P2 = uint8(P2);
figure
imshow(P2);

% 5x5
P3 = conv2(P, h2, 'same');
P3 = uint8(P3);
figure
imshow(P3);

%% Speckle Noise
% read image (speckle noise)
P4 = imread('images/ntusp.jpg');
figure
imshow(P4);

% filter image
% 3x3
P5 = conv2(P4, h1, 'same');
P5 = uint8(P5);
figure
imshow(P5);

% 5x5
P6 = conv2(P4, h2, 'same');
P6 = uint8(P6);
figure
imshow(P6);

