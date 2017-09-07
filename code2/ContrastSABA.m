
close all;
clear all;

% Read Image;
I = imread('lena.jpg');
% Open File
fid = fopen('ContrastResult-lena.txt','w');

for noisedensity= 0.1:0.1:0.9
fprintf(fid,'noise density %g\n', noisedensity);
disp(noisedensity);

PicOrigin = I;
% PicOrigin = imresize(I, [256 256]);
PicNoise = double(imnoise(PicOrigin, 'salt & pepper',noisedensity));
PicOrigin = double(PicOrigin);

AaveTime = 0;   % SMF
BaveTime = 0;   % AMF
CaveTime = 0;   % AMF+BM3D
DaveTime = 0;   % AMMAF

AaveFSIM = 0;
BaveFSIM = 0;
CaveFSIM = 0;
DaveFSIM = 0;

AaveSSIM = 0;
BaveSSIM = 0;
CaveSSIM = 0;
DaveSSIM = 0;

AavePSNR = 0;
BavePSNR = 0;
CavePSNR = 0;
DavePSNR = 0;

Iteration = 10;
for i = 1:Iteration
% Algorithms
disp(i)

tic;
APic = medfilt2(PicNoise,[3 3]);
AaveTime = toc + AaveTime;
AaveFSIM = AaveFSIM + FeatureSIM(APic,PicOrigin);
AaveSSIM = AaveSSIM + ssim(APic,PicOrigin);
AavePSNR = AavePSNR + psnr(APic,PicOrigin,255);

tic;
BPic = AMF(PicNoise);
BaveTime = toc + BaveTime;
BaveFSIM = BaveFSIM + FeatureSIM(BPic,PicOrigin);
BaveSSIM = BaveSSIM + ssim(BPic,PicOrigin);
BavePSNR = BavePSNR + psnr(BPic,PicOrigin,255);

tic;
CPic = AMF(PicNoise);
CaveTime = toc + CaveTime;
[bmpsnr, bmtime, CPic] = myBM3D(PicOrigin, CPic);
CaveTime = bmtime + CaveTime;

CaveFSIM = CaveFSIM + FeatureSIM(CPic,PicOrigin);
CaveSSIM = CaveSSIM + ssim(CPic*255,PicOrigin);
CavePSNR = CavePSNR + bmpsnr;

tic;
DPic = RemovalNoise(PicNoise,[2 4]);
DaveTime = toc + DaveTime;
DaveFSIM = DaveFSIM + FeatureSIM(DPic,PicOrigin);
DaveSSIM = DaveSSIM + ssim(DPic,PicOrigin);
DavePSNR = DavePSNR + psnr(DPic,PicOrigin,255);

end

AaveTime = AaveTime / Iteration;
BaveTime = BaveTime / Iteration;
CaveTime = CaveTime / Iteration;
DaveTime = DaveTime / Iteration;

AaveFSIM = AaveFSIM / Iteration;
BaveFSIM = BaveFSIM / Iteration;
CaveFSIM = CaveFSIM / Iteration;
DaveFSIM = DaveFSIM / Iteration;

AaveSSIM = AaveSSIM / Iteration;
BaveSSIM = BaveSSIM / Iteration;
CaveSSIM = CaveSSIM / Iteration;
DaveSSIM = DaveSSIM / Iteration;

AavePSNR = AavePSNR / Iteration;
BavePSNR = BavePSNR / Iteration;
CavePSNR = CavePSNR / Iteration;
DavePSNR = DavePSNR / Iteration;

fprintf(fid,'\n');

% time-used
fprintf(fid,'The average time-used of A is %0.4f\n', AaveTime);
fprintf(fid,'The average time-used of B is %0.4f\n', BaveTime);
fprintf(fid,'The average time-used of C is %0.4f\n', CaveTime);
fprintf(fid,'The average time-used of D is %0.4f\n', DaveTime);
fprintf(fid,'\n');
% FSIM
fprintf(fid,'The average FSIM value of A is %0.4f\n', AaveFSIM);
fprintf(fid,'The average FSIM value of B is %0.4f\n', BaveFSIM);
fprintf(fid,'The average FSIM value of C is %0.4f\n', CaveFSIM);
fprintf(fid,'The average FSIM value of D is %0.4f\n', DaveFSIM);
fprintf(fid,'\n');
% SSIM
fprintf(fid,'The average SSIM value of A is %0.4f\n', AaveSSIM);
fprintf(fid,'The average SSIM value of B is %0.4f\n', BaveSSIM);
fprintf(fid,'The average SSIM value of C is %0.4f\n', CaveSSIM);
fprintf(fid,'The average SSIM value of D is %0.4f\n', DaveSSIM);
fprintf(fid,'\n');
% PSNR
fprintf(fid,'The average PSNR value of A is %0.4f\n', AavePSNR);
fprintf(fid,'The average PSNR value of B is %0.4f\n', BavePSNR);
fprintf(fid,'The average PSNR value of C is %0.4f\n', CavePSNR);
fprintf(fid,'The average PSNR value of D is %0.4f\n', DavePSNR);
fprintf(fid,'\n--------------------------------------------------\n');

end