%% final test

close all;
clear all;

% Read Image;
I = imread('cameraman.tif');
PicOrigin = imresize(I, [256 256]);
noisedensity = 0.95;
PicNoise = double(imnoise(PicOrigin, 'salt & pepper',noisedensity));
PicOrigin = double(PicOrigin);

OriGrayPic = mat2gray(PicOrigin);
NoiseGrayPic = mat2gray(PicNoise);

figure(1)
imshow(NoiseGrayPic,'border','tight','InitialMagnification','fit');
set (gcf,'Position',[0,0,256,256]);
axis normal;
saveas(1,['D:\code\repository\Denoising\report\','cameraman',num2str(noisedensity),'.jpg']);

% SAFavetime = 0;
% SMFavetime = 0;
% AMFavetime = 0;
% PAavetime = 0;
% 
% FSIMSAFave = 0;
% FSIMSMFave = 0;
% FSIMAMFave = 0;
% FSIMPAave = 0;
% 
% SSIMSAFave = 0;
% SSIMSMFave = 0;
% SSIMAMFave = 0;
% SSIMPAave = 0;
% 
% H2GDSAFave = 0;
% H2GDSMFave = 0;
% H2GDAMFave = 0;
% H2GDPAave = 0;
% 
% Iteration = 1;
% for i = 1:Iteration
% % Algorithms
% fprintf('%d\n', i);
% tic;
% SAFGrayPic = imfilter(PicNoise,fspecial('average',3));
% SAFavetime = toc + SAFavetime;
% 
% FSIMSAFave = FSIMSAFave + FeatureSIM(SAFGrayPic,OriGrayPic);
% SSIMSAFave = SSIMSAFave + ssim(SAFGrayPic,OriGrayPic);
% H2GDSAFave = H2GDSAFave + H2GD(SAFGrayPic,OriGrayPic);
% 
% tic;
% SMFGrayPic = medfilt2(PicNoise,[3 3]);
% SMFavetime = toc + SMFavetime;
% 
% FSIMSMFave = FSIMSMFave + FeatureSIM(SMFGrayPic,OriGrayPic);
% SSIMSMFave = SSIMSMFave + ssim(SMFGrayPic,OriGrayPic);
% H2GDSMFave = H2GDSMFave + H2GD(SMFGrayPic,OriGrayPic);
% 
% tic;
% AMFPic = AMF(PicNoise);
% AMFavetime = toc + AMFavetime;
% 
% AMFGrayPic = mat2gray(AMFPic);
% FSIMAMFave = FSIMAMFave + FeatureSIM(AMFGrayPic,OriGrayPic);
% SSIMAMFave = SSIMAMFave + ssim(AMFGrayPic,OriGrayPic);
% H2GDAMFave = H2GDAMFave + H2GD(AMFGrayPic,OriGrayPic);
% 
% tic;
% PAPic = PA(PicNoise);
% PAavetime = toc + PAavetime;
% 
% PAGrayPic = mat2gray(PAPic);
% FSIMPAave = FSIMPAave + FeatureSIM(PAGrayPic,OriGrayPic);
% SSIMPAave = SSIMPAave + ssim(PAGrayPic,OriGrayPic);
% H2GDPAave = H2GDPAave + H2GD(PAGrayPic,OriGrayPic);
% end
% 
% SAFavetime = SAFavetime / Iteration;
% SMFavetime = SMFavetime / Iteration;
% AMFavetime = AMFavetime / Iteration;
% PAavetime = PAavetime / Iteration;
% 
% FSIMSAFave = FSIMSAFave / Iteration;
% FSIMSMFave = FSIMSMFave / Iteration;
% FSIMAMFave = FSIMAMFave / Iteration;
% FSIMPAave = FSIMPAave / Iteration;
% 
% SSIMSAFave = SSIMSAFave / Iteration;
% SSIMSMFave = SSIMSMFave / Iteration;
% SSIMAMFave = SSIMAMFave / Iteration;
% SSIMPAave = SSIMPAave / Iteration;
% 
% H2GDSAFave = H2GDSAFave / Iteration;
% H2GDSMFave = H2GDSMFave / Iteration;
% H2GDAMFave = H2GDAMFave / Iteration;
% H2GDPAave = H2GDPAave / Iteration;
% 
% % plot the pictures
% subplot(2,4,2);
% imagesc(OriGrayPic); axis off;
% title('Original');
% subplot(2,4,1);
% imagesc(NoiseGrayPic);axis off;
% title('salt&pepper noise');
% subplot(2,4,3);
% imagesc(SMFGrayPic);axis off;
% title('SMF');
% subplot(2,4,4);
% imagesc(SAFGrayPic);axis off;
% title('SAF');
% subplot(2,4,6);
% imagesc(OriGrayPic);axis off;
% title('Original');
% subplot(2,4,5);
% imagesc(NoiseGrayPic);axis off;
% title('salt&pepper noise');
% subplot(2,4,7);
% imagesc(AMFGrayPic);axis off;
% title('AMF');
% subplot(2,4,8);
% imagesc(PAGrayPic);axis off;
% title('PA');
% colormap gray;

% figure(1)
% imshow(mat2gray(SAFGrayPic),'border','tight','InitialMagnification','fit');
% set (gcf,'Position',[0,0,256,256]);
% axis normal;
% figure(2)
% imshow(mat2gray(SMFGrayPic),'border','tight','InitialMagnification','fit');
% set (gcf,'Position',[0,0,256,256]);
% axis normal;
% figure(3)
% imshow(mat2gray(AMFGrayPic),'border','tight','InitialMagnification','fit');
% set (gcf,'Position',[0,0,256,256]);
% axis normal;
% figure(4)
% imshow(mat2gray(PAGrayPic),'border','tight','InitialMagnification','fit');
% set (gcf,'Position',[0,0,256,256]);
% axis normal;
% saveas(1,['D:\code\repository\Denoising\report\','SAFcameraman',num2str(noisedensity),'.jpg']);
% saveas(2,['D:\code\repository\Denoising\report\','SMFcameraman',num2str(noisedensity),'.jpg']);
% saveas(3,['D:\code\repository\Denoising\report\','AMFcameraman',num2str(noisedensity),'.jpg']);
% saveas(4,['D:\code\repository\Denoising\report\','PAcameraman',num2str(noisedensity),'.jpg']);

% fprintf('\n');
% % FSIM
% fprintf('The average FSIM value of SAF is %0.4f\n', FSIMSAFave);
% fprintf('The average FSIM value of SMF is %0.4f\n', FSIMSMFave);
% fprintf('The average FSIM value of AMF is %0.4f\n', FSIMAMFave);
% fprintf('The average FSIM value of PA is %0.4f\n', FSIMPAave);
% 
% % SSIM
% fprintf('The average SSIM value of SAF is %0.4f\n', SSIMSAFave);
% fprintf('The average SSIM value of SMF is %0.4f\n', SSIMSMFave);
% fprintf('The average SSIM value of AMF is %0.4f\n', SSIMAMFave);
% fprintf('The average SSIM value of PA is %0.4f\n', SSIMPAave);
% 
% % Histogram distance
% fprintf('The average Histogram distance of SAF is %0.4f\n', H2GDSAFave);
% fprintf('The average Histogram distance of SMF is %0.4f\n', H2GDSMFave);
% fprintf('The average Histogram distance of AMF is %0.4f\n', H2GDAMFave);
% fprintf('The average Histogram distance of PA is %0.4f\n', H2GDPAave);
% 
% % time-used
% fprintf('The average time-used of SAF is %0.4f\n', SAFavetime);
% fprintf('The average time-used of SMF is %0.4f\n', SMFavetime);
% fprintf('The average time-used of AMF is %0.4f\n', AMFavetime);
% fprintf('The average time-used of PA is %0.4f\n', PAavetime);


