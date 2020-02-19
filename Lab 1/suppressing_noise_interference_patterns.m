close all;
%% read image
P = imread('images/pckint.jpg');
imshow(P);

F = fft2(P);
%imagesc(abs(fftshift(F)));

% compute power spectrum S
S = real(F);
figure
imagesc(fftshift(real(S.^0.1)));
colormap('default');

figure
imagesc(real(S.^0.1));
colormap('default');

% d.
F_new = F;
[x, y] = ginput(2);
% (x, y) => F(y, x)
for i = 1: length(x)
    for j=-2:2
        for k=-2:2
            fprintf('At pixel: (%d, %d)\n', round(x(i))+j, round(y(i))+k);
            F_new(round(y(i))+k, round(x(i))+j) = 0;
        end
    end
end
% Recompute power spectrum
S_new = real(F_new);
figure
imagesc(fftshift(real(S_new.^0.1)));
colormap('default');

% Display the result
P_new = uint8(ifft2(F_new));
figure
imshow(real(P_new));

%% FReE ThE PrIMAtE!1!!1
Primate = imread('images/primatecaged.jpg');
Primate = rgb2gray(Primate);
figure
imshow(Primate);

Fp = fft2(Primate);

% compute power spectrum Sp
Sp = abs(real(Fp));
figure
imagesc(fftshift(real(Sp.^0.1)));
colormap('default');

figure
imagesc(log(real(Sp.^0.1)));
colormap('default');

% d.
Fp_new = Fp;
[x, y] = ginput(4);
% (x, y) => F(y, x)
for i = 1: length(x)
    for j=-2:2
        for k=-2:2
            fprintf('At pixel: (%d, %d)\n', round(x(i))+j, round(y(i))+k);
            Fp_new(round(y(i))+k, round(x(i))+j) = 0;
        end
    end
end
% Recompute power spectrum
Sp_new = real(Fp_new);
figure
imagesc(fftshift(real(Sp_new.^0.1)));
colormap('default');

% Display the result
Primate_new = uint8(ifft2(Fp_new));
figure
imshow(real(Primate_new));

