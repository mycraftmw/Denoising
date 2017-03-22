%% final test

% Read Image;
I = imread('code1.jpg');
I = rgb2gray(I);
noiseIm = double(imnoise(I, 'salt & pepper',0.6));
figure(1),imshow(noiseIm);
% noiseIm = imread('AMFlena0.95.jpg');
resultI = RemovalNoise(noiseIm);
figure(2),imshow(resultI);


% imshow(noiseIm);
% PicOrigin = double(PicOrigin);
% 
% OriGrayPic = mat2gray(PicOrigin);
% NoiseGrayPic = mat2gray(PicNoise);

% imSize = size(noiseIm);
% nRows = imSize(1);
% nColumns = imSize(2);
    
% noisePic = double(zeros(nRows+8, nColumns+8));
% noisePic(5:nRows+4, 5:nColumns+4) = noiseIm;
% newI = double(zeros(nRows+8, nColumns+8));
% for i=5:nRows+4
%     for j=5:nColumns+4
%         if noisePic(i,j) ~= 0 && noisePic(i,j) ~= 255
%             newI(i,j) = noisePic(i,j);
%         else
%             subMatrix = noisePic(i-1:i+1, j-1:j+1);
%             nmax = sum(subMatrix(:)==255);
%             nmin = sum(subMatrix(:)==0);         
%             if 9-nmax-nmin>0
%                 sumtotal = sum(subMatrix(:));
%                 s = sumtotal - 255*nmax;
%                 newI(i,j) = s/(9-nmax-nmin);
%             else 
%                 subMatrix = noisePic(i-2:i+2, j-2:j+2);
%                 nmax = sum(subMatrix(:)==255);
%                 nmin = sum(subMatrix(:)==0);
%                 if 25-nmax-nmin>0 
%                     sumtotal = sum(subMatrix(:));
%                     s = sumtotal - 255*nmax;
%                     newI(i,j) = s/(25-nmax-nmin);
%                 else if nmax>nmin
%                     newI(i,j) = 255;
%                     else
%                         newI(i,j) = 0;
%                     end
%                 end
%             end
%         end
%     end
% end
% newI2show = mat2gray(newI);
% imshow(newI2show);
% 
% for i = 5:nRows+4
%     for j = 5:nColumns+4
%         subMatrix = newI(i-4:i+4, j-4:j+4);
%         nmax = sum(subMatrix(:)==255);
%         nmin = sum(subMatrix(:)==0);
%         para = 0.5*(min(i+4,nRows+4)-max(i-4,5)+1)*(min(j+4,nColumns+4)-max(j-4,5)+1) + 9*((i+4-min(i+4,nRows+4))+(j+4-min(j+4,nColumns+4))+(max(i-4,5)-(i-4))+(max(j-4,5)-(j-4)))+1;
%         if (newI(i,j)==0 && nmin<para) || (newI(i,j)==255 && nmax<para)
%             sumtotal = sum(subMatrix(:));
%             s = sumtotal - 255*nmax; 
%             newI(i,j) = s/(81-nmax-nmin);
%         end
%     end
% end
% newI2show = mat2gray(newI);
% imshow(newI2show);
% resultIm = newI(5:nRows+4, 5:nColumns+4);



