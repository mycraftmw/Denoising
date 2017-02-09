%% try median filter and mean filter on salt and pepper noise.

close all; clear all

I = imread('cameraman.tif');
pic = imnoise(I, 'salt & pepper',0.9);
picInSize = double(imresize(pic, [128 128]));
picOrigin = double(imresize(I, [128 128]));


%% newI1--method1
%% first set up a blank matrix, then calculate the value and move it in.       
%% check the pixel is corrupted or not
%% if the pixel is not influenced by noise, then remain the original value.
%% else calculate the mean value except for all maxes and mins from the
%% original pic.(if no pixel left then take the neighbor value)

newI1 = double(zeros(128,128));
for i=1:128
    for j=1:128
        if i==1 || i==128 || j==1|| j==128
            newI1(i,j) = picInSize(i,j);
        else
            subMatrix = picInSize([i-1 i i+1], [j-1 j j+1]);
            maxSub = max(subMatrix(:));
            minSub = min(subMatrix(:));

            if maxSub == picInSize(i,j) || minSub == picInSize(i,j)
                nmax = sum(subMatrix(:)==maxSub);
                nmin = sum(subMatrix(:)==minSub);
                sumtotal = sum(subMatrix(:));
                s = sumtotal - maxSub*nmax - minSub*nmin;
                if 9-nmax-nmin>0
                    newI1(i,j) = s/(9-nmax-nmin);
                else
                    newI1(i,j) = (newI1(i-1,j-1)+newI1(i-1,j)+newI1(i,j-1))/3;
                end
            else
                newI1(i,j) = picInSize(i,j);
            end
        end
    end
end

%%%%%%%%%%%%%%%%%%%%%%%%
newI1 = PA(picInSize);

newI2 = double(zeros(128,128));
for i=1:128
    for j=1:128
        if i~=1 && i~=2 && i~=127 && i~=128 && j~=1 && j~=128 && j~=2 && j~=127
           if picInSize(i,j) ~= 0 && picInSize(i,j) ~= 255
               newI2(i,j) = picInSize(i,j);
           else
               subMatrix = picInSize(i-1:i+1, j-1:j+1);
               nmax = sum(subMatrix(:)==255);
               nmin = sum(subMatrix(:)==0);
               sumtotal = sum(subMatrix(:));
               s = sumtotal - 255*nmax;
               if 9-nmax-nmin>0
                    newI2(i,j) = s/(9-nmax-nmin);
               else 
                    subMatrix = picInSize(i-2:i+2, j-2:j+2);
                    nmax = sum(subMatrix(:)==255);
                    nmin = sum(subMatrix(:)==0);
                    sumtotal = sum(subMatrix(:));
                    s = sumtotal - 255*nmax;
                   if 25-nmax-nmin>0
                       newI2(i,j) = s/(25-nmax-nmin);
                   else if nmax>nmin
                       newI2(i,j) = 255;
                   else
                       newI2(i,j) = 0;
                       end
                   end
               end
           end
        end
    end
end


for i = 5:124
    for j = 5:124
        subMatrix = newI2(i-4:i+4, j-4:j+4);
        nmax = sum(subMatrix(:)==255);
        nmin = sum(subMatrix(:)==0);
        if (newI2(i,j)==0 && nmin< 42) || (newI2(i,j)==255 && nmax<42)
           sumtotal = sum(subMatrix(:));
           s = sumtotal - 255*nmax; 
           newI2(i,j) = s/(81-nmax-nmin);
        end
    end
end
          




sumline = sum(newI1(1,:));
nmax = sum(newI1(1,:)==255);
nmin = sum(newI1(1,:)==0);
newI1(1,:) = (sumline-255*nmax)/(128-nmax-nmin);
sumline = sum(newI1(128,:));
nmax = sum(newI1(128,:)==255);
nmin = sum(newI1(128,:)==0);
newI1(128,:) = (sumline-255*nmax)/(128-nmax-nmin);
sumline = sum(newI1(:,1));
nmax = sum(newI1(:,1)==255);
nmin = sum(newI1(:,1)==0);
newI1(:,1) = (sumline-255*nmax)/(128-nmax-nmin);
sumline = sum(newI1(:,128));
nmax = sum(newI1(:,128)==255);
nmin = sum(newI1(:,128)==0);
newI1(:,128) = (sumline-255*nmax)/(128-nmax-nmin);

sumline = sum(picInSize(1,:));
nmax = sum(picInSize(1,:)==255);
nmin = sum(picInSize(1,:)==0);
newI2(1,:) = (sumline-255*nmax)/(128-nmax-nmin);
sumline = sum(picInSize(128,:));
nmax = sum(picInSize(128,:)==255);
nmin = sum(picInSize(128,:)==0);
newI2(128,:) = (sumline-255*nmax)/(128-nmax-nmin);
sumline = sum(picInSize(:,1));
nmax = sum(picInSize(:,1)==255);
nmin = sum(picInSize(:,1)==0);
newI2(:,1) = (sumline-255*nmax)/(128-nmax-nmin);
sumline = sum(picInSize(:,128));
nmax = sum(picInSize(:,128)==255);
nmin = sum(picInSize(:,128)==0);
newI2(:,128) = (sumline-255*nmax)/(128-nmax-nmin);
sumline = sum(picInSize(2,:));
nmax = sum(picInSize(2,:)==255);
nmin = sum(picInSize(2,:)==0);
newI2(2,:) = (sumline-255*nmax)/(128-nmax-nmin);
sumline = sum(picInSize(127,:));
nmax = sum(picInSize(127,:)==255);
nmin = sum(picInSize(127,:)==0);
newI2(127,:) = (sumline-255*nmax)/(128-nmax-nmin);
sumline = sum(picInSize(:,2));
nmax = sum(picInSize(:,2)==255);
nmin = sum(picInSize(:,2)==0);
newI2(:,2) = (sumline-255*nmax)/(128-nmax-nmin);
sumline = sum(picInSize(:,127));
nmax = sum(picInSize(:,127)==255);
nmin = sum(picInSize(:,127)==0);
newI2(:,127) = (sumline-255*nmax)/(128-nmax-nmin);

        
newPic1 = mat2gray(newI1);
newPic2 = mat2gray(newI2);
noisePic = mat2gray(picInSize);
oriPic = mat2gray(picOrigin);
h1 = fspecial('average',3);
faverage = imfilter(picInSize,h1);
fmedian = medfilt2(picInSize,[3 3]);

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
title('new method1');
subplot(2,4,8);
imagesc(newPic2);axis off;
title('new method2');
colormap gray;

%PSNR1 = calPSNR(oriPic, newPic1)
%IEF1 = calIEF(oriPic, noisePic, newPic1)
%SSIM = calSSIM(oriPic, newPic1)
%diff = newI2-newI1
