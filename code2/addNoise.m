IOriginal = imread('example-IR.jpg');
I = rgb2gray(IOriginal);
noiseIm = double(imnoise(I, 'salt & pepper',0.9));
imshow(noiseIm);