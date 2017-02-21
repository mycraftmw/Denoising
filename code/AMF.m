function newI = AMF(noiseP)

tic;
noisePic = double(zeros(132,132));
noisePic(3:130, 3:130) = noiseP;
newI = double(zeros(132,132));
for i = 3:130
    for j = 3:130
         subMatrix = noisePic(i-1:i+1, j-1:j+1);
         maxp = max(subMatrix(:));
         minp = min(subMatrix(:)); 
         medianp = median(subMatrix(:));
         if maxp ~= medianp && minp ~= medianp
             if noisePic(i,j) ~= maxp && noisePic(i,j) ~= minp
                 newI(i,j) = noisePic(i,j);
             else
                 newI(i,j) = medianp;
             end
         else
             subMatrix = noisePic(i-2:i+2, j-2:j+2);
             maxp = max(subMatrix(:));
             minp = min(subMatrix(:)); 
             medianp = median(subMatrix(:));
             if maxp ~= medianp && minp ~= medianp
                if noisePic(i,j) ~= maxp && noisePic(i,j) ~= minp
                    newI(i,j) = noisePic(i,j);
                else
                    newI(i,j) = medianp;
                end
             else
                 newI(i,j) = noisePic(i,j);
             end
         end
    end
end

newI = newI(3:130, 3:130);
fprintf('AMF ');
toc;