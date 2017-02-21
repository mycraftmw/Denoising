%% final test

close all;

I = imread('lena.jpg');
picOrigin = imresize(I, [128 128]);
picInSize = double(imnoise(picOrigin, 'salt & pepper',0.9));
picOrigin = double(picOrigin);

newI1 = AMF(picOrigin);
newI2 = PA(picOrigin);
        
newPic1 = mat2gray(newI1);
newPic2 = mat2gray(newI2);
noisePic = mat2gray(picInSize);
oriPic = mat2gray(picOrigin);
tic;
h1 = fspecial('average',3);
fprintf('average ');
toc;
faverage = imfilter(picInSize,h1);
tic;
fmedian = medfilt2(picInSize,[3 3]);
fprintf('median ');
toc;
subplot(2,4,2);
imagesc(oriPic); axis off;
title('Original');
subplot(2,4,1);
imagesc(noisePic);axis off;
title('salt&pepper noise');
subplot(2,4,3);
imagesc(fmedian);axis off;
title('median');
subplot(2,4,4);
imagesc(faverage);axis off;
title('old mean');
subplot(2,4,6);
imagesc(oriPic);axis off;
title('Original');
subplot(2,4,5);
imagesc(noisePic);axis off;
title('salt&pepper noise');
subplot(2,4,7);
imagesc(newPic1);axis off;
title('AMF');
subplot(2,4,8);
imagesc(newPic2);axis off;
title('PA');
colormap gray;

psnrAMF = psnr(newI1,picOrigin);
psnrPA = psnr(newI2,picOrigin);
fprintf('The PSNR value AMF  is %0.4f\n', psnrAMF);
fprintf('The PSNR value PA is %0.4f\n', psnrPA);
ssimAMF = ssim(newI1,picOrigin);
ssimPA = ssim(newI2,picOrigin);
fprintf('The SSIM value AMF  is %0.4f\n', ssimAMF);
fprintf('The SSIM value PA is %0.4f\n', ssimPA);
