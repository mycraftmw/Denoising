%% different test sets

%% (a)RemovalNoise function
I = imread('cameraman.tif');
% origin image figure(1)
figure(1),imshow(I);
noiseIm = double(imnoise(I, 'salt & pepper',0.9));
noiseI2show = mat2gray(noiseIm);
% noise image figure(2)
figure(2),imshow(noiseI2show);
resultIm = RemovalNoise(noiseIm);
result2show = mat2gray(resultIm);
% denoise image figure(3)
figure(3),imshow(result2show);

%% (b)Gaussian low_pass
I = imread('cameraman.tif');
% origin image figure(1)
figure(1),imshow(I);
noiseIm = double(imnoise(I, 'salt & pepper',0.3));
noiseI2show = mat2gray(noiseIm);
% noise image figure(2)
figure(2),imshow(noiseI2show);
gaussianFilter = fspecial('gaussian');
resultIm = imfilter(noiseIm, gaussianFilter);
result2show = mat2gray(resultIm);
% denoise image figure(3)
figure(3),imshow(result2show);

%% (c)work on real images
IOriginal = imread('example-IR.jpg');
I = rgb2gray(IOriginal);
figure(1),imshow(I,'border','tight','InitialMagnification','fit');                                              
set (gcf,'Position',[0,0,256,256]);
axis normal;

noiseIm = double(imnoise(I, 'salt & pepper',0.1));
I2show = mat2gray(noiseIm);
%imwrite(I2show,'cameraman50ori.png');
figure(2),imshow(I2show,'border','tight','InitialMagnification','fit');
set (gcf,'Position',[0,0,256,256]);
axis normal;

resultI = RemovalNoise(noiseIm);
resultI2show = mat2gray(resultI);
%imwrite(resultI2show,'cameraman50ori.png');
figure(3)
imshow(resultI2show,'border','tight','InitialMagnification','fit');
set (gcf,'Position',[0,0,256,256]);
axis normal;

%% (d)show the transform images, fft
I = imread('cameraman.tif');
% origin image figure(1)
figure(1),imshow(I);
A = fft2(double(I));
% origin image after fft figure(2)
figure(2),imagesc(log(abs(fftshift(A)))), colormap gray;
noiseIm = double(imnoise(I, 'salt & pepper',0.5));
noiseI2show = mat2gray(noiseIm);
%noise image_salt & pepper, figure(3)
figure(3),imshow(noiseI2show);
A = fft2(noiseIm);
%noise image_salt & pepper after fft, figure(4)
figure(4),imagesc(log(abs(fftshift(A)))), colormap gray;
%noise image_gaussian, figure(5)
noiseIm2 = double(imnoise(I, 'gaussian'));
noiseI2show2 = mat2gray(noiseIm2);
figure(5),imshow(noiseI2show2);
%noise image_gaussian after fft, figure(4)
A = fft2(noiseIm2);
figure(6),imagesc(log(abs(fftshift(A)))), colormap gray;
%imwrite(noiseI2show,'cameraman50ori.png');



