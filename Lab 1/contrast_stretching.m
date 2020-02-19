Pc = imread('images/mrttrainbland.jpg');
whos Pc

P = rgb2gray(Pc);
imshow(P);

min(P(:)), max(P(:))

% min 13 max 204
P2 = imsubtract(P, 13);
P2 = immultiply(P2, (255/(204-13)));

% check
min(P2(:)), max(P2(:))

figure
imshow(P2);
