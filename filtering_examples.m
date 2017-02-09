im=imread('einstein.jpg');
im=double(im)/255.0;

% Remove the black border
% im=im(2:end-1,2:end-1);

% Show the original image
figure(1)
imagesc(im); colormap gray
title('Original image')
figure(2)

% Median filtering
n=3; % Size of mask when n=3: 3x3 mask
figure(3)
imagesc(medfilt2(im,[n,n])); colormap gray
title('Median filtering')

% Mean filtering
filt=ones(13,13);
filt=filt/sum(filt(:));
figure(4)
imagesc(imfilter(im,filt)); colormap gray
title('Mean filtering')

% Mean filtering - how is the border handled?
filt=ones(31,31);
filt=filt/sum(filt(:));
figure(5)
subplot(1,3,1)
imshow(imfilter(im,filt,'replicate'),[0,1]); colormap gray
subplot(1,3,2)
imshow(imfilter(im,filt,'circular'),[0,1]); colormap gray
subplot(1,3,3)
imshow(imfilter(im,filt,'symmetric'),[0,1]); colormap gray

% Gaussian filtering
sigma=3; % Sigma in Gaussian distribution
figure(6)
imagesc(imgaussfilt(im,sigma)); colormap gray
title('Gaussian filtering')

% Laplace filtering
filt=[1 1 1; 1 -8 1; 1 1 1];
figure(7)
imagesc(imfilter(im,filt)); colormap gray
title('Laplace filtering')

% Sobel filtering
filt=[-1 -1 -1; 0 0 0; 1 1 1]';
figure(8)
imagesc(imfilter(im,filt)); colormap gray
title('Sobel filtering, x-direction')

% Sobel filtering Gradient magnitude
filt1=[1 1 1; 0 0 0; -1 -1 -1];
filt2=[1 1 1; 0 0 0; -1 -1 -1]';
figure(9)
imagesc((imfilter(im,filt1).^2+imfilter(im,filt2).^2).^(1/2)); colormap gray
title('Sobel filtering gradient magnitude')

% Bilateral filtering
% bfilter2 downloaded from mathwork file exchange: https://se.mathworks.com/matlabcentral/fileexchange/12191
w     = 5;       % bilateral filter half-width of Gaussian (5 : 11x11 mask)
sigma = [3 0.05]; % bilateral filter standard deviations spatial:3, intensity:0.1
figure(10)
imagesc(bfilter2(im,w,sigma)); colormap gray
title('Bilateral filtering')

% Gauss gradients
% gaussgradient downloaded from mathwork file exchange: https://se.mathworks.com/matlabcentral/fileexchange/8060
sigma= 1;
[imx,imy]=gaussgradient(im,sigma);
figure(11)
imagesc(imx); colormap gray
title('Gauss gradient, x-direction')

figure(12)
imagesc(((imx).^2+(imy).^2).^(1/2)); colormap gray
title('Gauss gradient, gradient magnitude')
