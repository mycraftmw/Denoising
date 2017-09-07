
close all;
clear all;

% Read Image;
I = imread('cameraman.tif');
% Open File
fid = fopen('ContrastResult.txt','w');

for noisedensity= 0.1:0.1:0.9
fprintf(fid,'noise density %g\n', noisedensity);
disp(noisedensity);

PicOrigin = imresize(I, [256 256]);
PicNoise = double(imnoise(PicOrigin, 'salt & pepper',noisedensity));
PicOrigin = double(PicOrigin);

AaveTime = 0;
BaveTime = 0;
CaveTime = 0;
DaveTime = 0;
EaveTime = 0;
% 
% AaveFSIM = 0;
% BaveFSIM = 0;
% CaveFSIM = 0;
% DaveFSIM = 0;
% EaveFSIM = 0;
% 
% AaveSSIM = 0;
% BaveSSIM = 0;
% CaveSSIM = 0;
% DaveSSIM = 0;
% EaveSSIM = 0;
% 
% AaveH2GD = 0;
% BaveH2GD = 0;
% CaveH2GD = 0;
% DaveH2GD = 0;
% EaveH2GD = 0;

AavePSNR = 0;
BavePSNR = 0;
CavePSNR = 0;
DavePSNR = 0;
EavePSNR = 0;

Iteration = 100;
for i = 1:Iteration
% Algorithms
disp(i)

tic;
APic = RemovalNoise(PicNoise,[1 2 3 4 5]);
AaveTime = toc + AaveTime;
% AaveFSIM = AaveFSIM + FeatureSIM(APic,PicOrigin);
% AaveSSIM = AaveSSIM + ssim(APic,PicOrigin);
% AaveH2GD = AaveH2GD + H2GD(APic,PicOrigin);
AavePSNR = AavePSNR + psnr(APic,PicOrigin,255);

tic;
BPic = RemovalNoise(PicNoise,[1 2 3 4]);
BaveTime = toc + BaveTime;
% BaveFSIM = BaveFSIM + FeatureSIM(BPic,PicOrigin);
% BaveSSIM = BaveSSIM + ssim(BPic,PicOrigin);
% BaveH2GD = BaveH2GD + H2GD(BPic,PicOrigin);
BavePSNR = BavePSNR + psnr(BPic,PicOrigin,255);

tic;
CPic = RemovalNoise(PicNoise,[1 2 3]);
CaveTime = toc + CaveTime;
% CaveFSIM = CaveFSIM + FeatureSIM(CPic,PicOrigin);
% CaveSSIM = CaveSSIM + ssim(CPic,PicOrigin);
% CaveH2GD = CaveH2GD + H2GD(CPic,PicOrigin);
CavePSNR = CavePSNR + psnr(CPic,PicOrigin,255);

tic;
DPic = RemovalNoise(PicNoise,[2 3 4]);
DaveTime = toc + DaveTime;
% DaveFSIM = DaveFSIM + FeatureSIM(DPic,PicOrigin);
% DaveSSIM = DaveSSIM + ssim(DPic,PicOrigin);
% DaveH2GD = DaveH2GD + H2GD(DPic,PicOrigin);
DavePSNR = DavePSNR + psnr(DPic,PicOrigin,255);

tic;
EPic = RemovalNoise(PicNoise,[2 4]);
EaveTime = toc + EaveTime;
% EaveFSIM = EaveFSIM + FeatureSIM(EPic,PicOrigin);
% EaveSSIM = EaveSSIM + ssim(EPic,PicOrigin);
% EaveH2GD = EaveH2GD + H2GD(EPic,PicOrigin);
EavePSNR = EavePSNR + psnr(EPic,PicOrigin,255);

end

% AaveTime = AaveTime / Iteration;
% BaveTime = BaveTime / Iteration;
% CaveTime = CaveTime / Iteration;
% DaveTime = DaveTime / Iteration;
% EaveTime = EaveTime / Iteration;
% 
% AaveFSIM = AaveFSIM / Iteration;
% BaveFSIM = BaveFSIM / Iteration;
% CaveFSIM = CaveFSIM / Iteration;
% DaveFSIM = DaveFSIM / Iteration;
% EaveFSIM = EaveFSIM / Iteration;
% 
% AaveSSIM = AaveSSIM / Iteration;
% BaveSSIM = BaveSSIM / Iteration;
% CaveSSIM = CaveSSIM / Iteration;
% DaveSSIM = DaveSSIM / Iteration;
% EaveSSIM = EaveSSIM / Iteration;
% 
% AaveH2GD = AaveH2GD / Iteration;
% BaveH2GD = BaveH2GD / Iteration;
% CaveH2GD = CaveH2GD / Iteration;
% DaveH2GD = DaveH2GD / Iteration;
% EaveH2GD = EaveH2GD / Iteration;

AavePSNR = AavePSNR / Iteration;
BavePSNR = BavePSNR / Iteration;
CavePSNR = CavePSNR / Iteration;
DavePSNR = DavePSNR / Iteration;
EavePSNR = EavePSNR / Iteration;

fprintf(fid,'\n');

% % time-used
% fprintf(fid,'The average time-used of A is %0.4f\n', AaveTime);
% fprintf(fid,'The average time-used of B is %0.4f\n', BaveTime);
% fprintf(fid,'The average time-used of C is %0.4f\n', CaveTime);
% fprintf(fid,'The average time-used of D is %0.4f\n', DaveTime);
% fprintf(fid,'The average time-used of E is %0.4f\n', EaveTime);
% fprintf(fid,'\n');
% % FSIM
% fprintf(fid,'The average FSIM value of A is %0.4f\n', AaveFSIM);
% fprintf(fid,'The average FSIM value of B is %0.4f\n', BaveFSIM);
% fprintf(fid,'The average FSIM value of C is %0.4f\n', CaveFSIM);
% fprintf(fid,'The average FSIM value of D is %0.4f\n', DaveFSIM);
% fprintf(fid,'The average FSIM value of E is %0.4f\n', EaveFSIM);
% fprintf(fid,'\n');
% % SSIM
% fprintf(fid,'The average SSIM value of A is %0.4f\n', AaveSSIM);
% fprintf(fid,'The average SSIM value of B is %0.4f\n', BaveSSIM);
% fprintf(fid,'The average SSIM value of C is %0.4f\n', CaveSSIM);
% fprintf(fid,'The average SSIM value of D is %0.4f\n', DaveSSIM);
% fprintf(fid,'The average SSIM value of E is %0.4f\n', EaveSSIM);
% fprintf(fid,'\n');
% % Histogram distance
% fprintf(fid,'The average Histogram distance of A is %0.4f\n', AaveH2GD);
% fprintf(fid,'The average Histogram distance of B is %0.4f\n', BaveH2GD);
% fprintf(fid,'The average Histogram distance of C is %0.4f\n', CaveH2GD);
% fprintf(fid,'The average Histogram distance of D is %0.4f\n', DaveH2GD);
% fprintf(fid,'The average Histogram distance of E is %0.4f\n', EaveH2GD);
% fprintf(fid,'\n');
% PSNR
fprintf(fid,'The average PSNR value of A is %0.4f\n', AavePSNR);
fprintf(fid,'The average PSNR value of B is %0.4f\n', BavePSNR);
fprintf(fid,'The average PSNR value of C is %0.4f\n', CavePSNR);
fprintf(fid,'The average PSNR value of D is %0.4f\n', DavePSNR);
fprintf(fid,'The average PSNR value of E is %0.4f\n', EavePSNR);
fprintf(fid,'\n--------------------------------------------------\n');
end
