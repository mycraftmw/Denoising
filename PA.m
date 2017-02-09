function newI = PA(noisePic)
    newI = double(zeros(128,128));
    for i=3:126
        for j=3:126
           if noisePic(i,j) ~= 0 && noisePic(i,j) ~= 255
               newI(i,j) = noisePic(i,j);
           else
               subMatrix = noisePic(i-1:i+1, j-1:j+1);
               nmax = sum(subMatrix(:)==255);
               nmin = sum(subMatrix(:)==0);         
               if 9-nmax-nmin>0
                  sumtotal = sum(subMatrix(:));
                  s = sumtotal - 255*nmax;
                  newI(i,j) = s/(9-nmax-nmin);
                  %noisePic(i,j) = newI(i,j);
               else 
                  subMatrix = noisePic(i-2:i+2, j-2:j+2);
                  nmax = sum(subMatrix(:)==255);
                  nmin = sum(subMatrix(:)==0);
                  if 25-nmax-nmin>0 
                     sumtotal = sum(subMatrix(:));
                     s = sumtotal - 255*nmax;
                     newI(i,j) = s/(25-nmax-nmin);
                     %noisePic(i,j) = newI(i,j);
                   else if nmax>nmin
                       newI(i,j) = 255;
                       %noisePic(i,j) = newI(i,j);
                   else
                       newI(i,j) = 0;
                       %noisePic(i,j) = newI(i,j);
                       end
                   end
               end
           end
        end
    end

    for i = 5:124
        for j = 5:124
            subMatrix = newI(i-4:i+4, j-4:j+4);
            nmax = sum(subMatrix(:)==255);
            nmin = sum(subMatrix(:)==0);
            if (newI(i,j)==0 && nmin< 42) || (newI(i,j)==255 && nmax<42)
                sumtotal = sum(subMatrix(:));
                s = sumtotal - 255*nmax; 
                newI(i,j) = s/(81-nmax-nmin);
            end
        end
    end

