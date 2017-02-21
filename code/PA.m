function newI = PA(noiseP)
    noisePic = double(zeros(136,136));
    noisePic(5:132, 5:132) = noiseP;
    newI = double(zeros(136,136));
    for i=5:132
        for j=5:132
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

    for i = 5:132
        for j = 5:132
            subMatrix = newI(i-4:i+4, j-4:j+4);
            nmax = sum(subMatrix(:)==255);
            nmin = sum(subMatrix(:)==0);
            para = 0.5*(min(i+4,132)-max(i-4,5)+1)*(min(j+4,132)-max(j-4,5)+1) + 9*((i+4-min(i+4,132))+(j+4-min(j+4,132))+(max(i-4,5)-(i-4))+(max(j-4,5)-(j-4)))+1;
            if (newI(i,j)==0 && nmin<para) || (newI(i,j)==255 && nmax<para)
                sumtotal = sum(subMatrix(:));
                s = sumtotal - 255*nmax; 
                newI(i,j) = s/(81-nmax-nmin);
            end
        end
    end
    
    newI = newI(5:132, 5:132);

