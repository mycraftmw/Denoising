function newI = AMF(noiseP)

noisePic = double(zeros(260,260));
noisePic(3:258, 3:258) = noiseP;
newI = double(zeros(260,260));
for i = 3:258
    for j = 3:258
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

newI = newI(3:258, 3:258);