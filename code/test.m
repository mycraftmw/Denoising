%% final test

close all;
clear all;

% Read Image;
I = imread('lena.jpg');
PicOrigin = imresize(I, [256 256]);
PicNoise = double(imnoise(PicOrigin, 'salt & pepper',0.95));
PicOrigin = double(PicOrigin);

OriGrayPic = mat2gray(PicOrigin);
NoiseGrayPic = mat2gray(PicNoise);

SAFavetime = 0;
SMFavetime = 0;
AMFavetime = 0;
PAavetime = 0;

FSIMSAFave = 0;
FSIMSMFave = 0;
FSIMAMFave = 0;
FSIMPAave = 0;

SSIMSAFave = 0;
SSIMSMFave = 0;
SSIMAMFave = 0;
SSIMPAave = 0;

H2GDSAFave = 0;
H2GDSMFave = 0;
H2GDAMFave = 0;
H2GDPAave = 0;

Iteration = 1;
for i = 1:Iteration
% Algorithms
fprintf('%d\n', i);
tic;
SAFGrayPic = imfilter(PicNoise,fspecial('average',3));
SAFavetime = toc + SAFavetime;

FSIMSAFave = FSIMSAFave + FeatureSIM(SAFGrayPic,OriGrayPic);
SSIMSAFave = SSIMSAFave + ssim(SAFGrayPic,OriGrayPic);
H2GDSAFave = H2GDSAFave + H2GD(SAFGrayPic,OriGrayPic);

tic;
SMFGrayPic = medfilt2(PicNoise,[3 3]);
SMFavetime = toc + SMFavetime;

FSIMSMFave = FSIMSMFave + FeatureSIM(SMFGrayPic,OriGrayPic);
SSIMSMFave = SSIMSMFave + ssim(SMFGrayPic,OriGrayPic);
H2GDSMFave = H2GDSMFave + H2GD(SMFGrayPic,OriGrayPic);

tic;
AMFPic = AMF(PicNoise);
AMFavetime = toc + AMFavetime;

AMFGrayPic = mat2gray(AMFPic);
FSIMAMFave = FSIMAMFave + FeatureSIM(AMFGrayPic,OriGrayPic);
SSIMAMFave = SSIMAMFave + ssim(AMFGrayPic,OriGrayPic);
H2GDAMFave = H2GDAMFave + H2GD(AMFGrayPic,OriGrayPic);

tic;
PAPic = PA(PicNoise);
PAavetime = toc + PAavetime;

PAGrayPic = mat2gray(PAPic);
FSIMPAave = FSIMPAave + FeatureSIM(PAGrayPic,OriGrayPic);
SSIMPAave = SSIMPAave + ssim(PAGrayPic,OriGrayPic);
H2GDPAave = H2GDPAave + H2GD(PAGrayPic,OriGrayPic);
end

SAFavetime = SAFavetime / Iteration;
SMFavetime = SMFavetime / Iteration;
AMFavetime = AMFavetime / Iteration;
PAavetime = PAavetime / Iteration;

FSIMSAFave = FSIMSAFave / Iteration;
FSIMSMFave = FSIMSMFave / Iteration;
FSIMAMFave = FSIMAMFave / Iteration;
FSIMPAave = FSIMPAave / Iteration;

SSIMSAFave = SSIMSAFave / Iteration;
SSIMSMFave = SSIMSMFave / Iteration;
SSIMAMFave = SSIMAMFave / Iteration;
SSIMPAave = SSIMPAave / Iteration;

H2GDSAFave = H2GDSAFave / Iteration;
H2GDSMFave = H2GDSMFave / Iteration;
H2GDAMFave = H2GDAMFave / Iteration;
H2GDPAave = H2GDPAave / Iteration;

% plot the pictures
subplot(2,4,2);
imagesc(OriGrayPic); axis off;
title('Original');
subplot(2,4,1);
imagesc(NoiseGrayPic);axis off;
title('salt&pepper noise');
subplot(2,4,3);
imagesc(SMFGrayPic);axis off;
title('SMF');
subplot(2,4,4);
imagesc(SAFGrayPic);axis off;
title('SAF');
subplot(2,4,6);
imagesc(OriGrayPic);axis off;
title('Original');
subplot(2,4,5);
imagesc(NoiseGrayPic);axis off;
title('salt&pepper noise');
subplot(2,4,7);
imagesc(AMFGrayPic);axis off;
title('AMF');
subplot(2,4,8);
imagesc(PAGrayPic);axis off;
title('PA');
colormap gray;

fprintf('\n');
% FSIM
fprintf('The average FSIM value of SAF is %0.4f\n', FSIMSAFave);
fprintf('The average FSIM value of SMF is %0.4f\n', FSIMSMFave);
fprintf('The average FSIM value of AMF  is %0.4f\n', FSIMAMFave);
fprintf('The average FSIM value of PA is %0.4f\n', FSIMPAave);

% SSIM
fprintf('The average SSIM value of SAF is %0.4f\n', SSIMSAFave);
fprintf('The average SSIM value of SMF is %0.4f\n', SSIMSMFave);
fprintf('The average SSIM value of AMF  is %0.4f\n', SSIMAMFave);
fprintf('The average SSIM value of PA is %0.4f\n', SSIMPAave);

% Histogram distance
fprintf('The average Histogram distance of SAF is %0.4f\n', H2GDSAFave);
fprintf('The average Histogram distance of SMF is %0.4f\n', H2GDSMFave);
fprintf('The average Histogram distance of AMF  is %0.4f\n', H2GDAMFave);
fprintf('The average Histogram distance of PA is %0.4f\n', H2GDPAave);

% time-used
fprintf('The average time-used of SAF is %0.4f\n', SAFavetime);
fprintf('The average time-used of SMF is %0.4f\n', SMFavetime);
fprintf('The average time-used of AMF  is %0.4f\n', AMFavetime);
fprintf('The average time-used of PA is %0.4f\n', PAavetime);
