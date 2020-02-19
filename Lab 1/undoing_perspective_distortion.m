close all;
% Read in image
P = imread('images/book.jpg');
P = rgb2gray(P);
imshow(P);

% Get coordinates of 4 corners
[x, y] = ginput(4);
% Coordinates of the 4 corners desired in output image
% Book is 210x297; Scale - 1px : 1mm
x_im = [0;210;210;0];
y_im = [0;0;297;297];

% Au = v
A = [x(1) y(1) 1    0    0    0 -x_im(1)*x(1) -x_im(1)*y(1);
     0    0    0    x(1) y(1) 1 -y_im(1)*x(1) -y_im(1)*y(1);
     x(2) y(2) 1    0    0    0 -x_im(2)*x(2) -x_im(2)*y(2);
     0    0    0    x(2) y(2) 1 -y_im(2)*x(2) -y_im(2)*y(2);
     x(3) y(3) 1    0    0    0 -x_im(3)*x(3) -x_im(3)*y(3);
     0    0    0    x(3) y(3) 1 -y_im(3)*x(3) -y_im(3)*y(3);
     x(4) y(4) 1    0    0    0 -x_im(4)*x(4) -x_im(4)*y(4);
     0    0    0    x(4) y(4) 1 -y_im(4)*x(4) -y_im(4)*y(4);];
v = [x_im(1);
     y_im(1);
     x_im(2);
     y_im(2);
     x_im(3);
     y_im(3);
     x_im(4);
     y_im(4);];
u = A \ v;
U = reshape([u;1], 3, 3)';
w = U*[x'; y'; ones(1,4)];
w = w ./ (ones(3,1) * w(3,:));

T = maketform('projective', U');
P2 = imtransform(P, T, 'XData', [0 210], 'YData', [0 297]);
figure();
imshow(P2);
