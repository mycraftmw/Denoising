function mmValue = CalNeighbor(noisePic, x, y, means)
%CalNeighbor: Calculate neighbors of Point(x, y)

means = sort(means);
Iter = numel(means);
nmax = 0;
nmin = 0;
for i = 1:Iter
    candidates = [];
    switch means(i)
        case 1
            candidates = [nan 1 nan;
                            1 1 1;
                          nan 1 nan];
            candidates = candidates .* noisePic(x-1:x+1, y-1:y+1);
        case 2
            candidates = noisePic(x-1:x+1, y-1:y+1);
        case 3
            candidates = [nan nan 1 nan nan;
                            nan 1 1 1 nan;
                              1 1 1 1 1;
                            nan 1 1 1 nan;
                          nan nan 1 nan nan];
            candidates = candidates .* noisePic(x-2:x+2, y-2:y+2);
        case 4
            candidates = noisePic(x-2:x+2, y-2:y+2);
        case 5
            candidates = [nan nan nan nan 1 nan nan nan nan;
                            nan nan nan 1 1 1 nan nan nan;
                              nan nan 1 1 1 1 1 nan nan;
                                nan 1 1 1 1 1 1 1 nan;
                                  1 1 1 1 1 1 1 1 1;
                                nan 1 1 1 1 1 1 1 nan;
                              nan nan 1 1 1 1 1 nan nan;
                            nan nan nan 1 1 1 nan nan nan;
                          nan nan nan nan 1 nan nan nan nan;];
            candidates = candidates .* noisePic(x-4:x+4, y-4:y+4);
    end
    nmax = sum(candidates(:)==255);
    nmin = sum(candidates(:)==0);
    tmp = isnan(candidates);
    all = sum(tmp(:)==0);
    if all-nmax-nmin>0
        mmValue = (nansum(candidates(:)) - 255*nmax)/(all-nmax-nmin);
        return;
    end
end

if nmax > nmin
    mmValue = 255;
else
    mmValue = 0;
end


% % 1
% OutR = [noisePic(i-1,j),noisePic(i+1,j),noisePic(i,j-1),noisePic(i,j+1)];
% nmax = sum(OutR(:)==255);
% nmin = sum(OutR(:)==0);
% if 4-nmax-nmin>0
%     sumtotal = sum(OutR(:));
%     s = sumtotal - 255*nmax;
%     mmValue = s/(4-nmax-nmin);
% else
%     % 2
%     subMatrix = noisePic(i-1:i+1, j-1:j+1);
%     nmax = sum(subMatrix(:)==255);
%     nmin = sum(subMatrix(:)==0);         
%     if 9-nmax-nmin>0
%         sumtotal = sum(subMatrix(:));
%         s = sumtotal - 255*nmax;
%         mmValue = s/(9-nmax-nmin);
%     else
%         % 3
%         OutR = [noisePic(i-2,j),noisePic(i+2,j),noisePic(i,j-2),noisePic(i,j+2)];
%         nmax = sum(OutR(:)==255);
%         nmin = sum(OutR(:)==0); 
%         if 4-nmax-nmin>0
%            sumtotal = sum(OutR(:));
%            s = sumtotal - 255*nmax;
%            mmValue = s/(4-nmax-nmin);
%         else
%             % 4
%             subMatrix = noisePic(i-2:i+2, j-2:j+2);
%             nmaxs = sum(subMatrix(:)==255);
%             nmins = sum(subMatrix(:)==0);
%             if 25-nmaxs-nmins>0 
%                 sumtotal = sum(subMatrix(:));
%                 s = sumtotal - 255*nmaxs;
%                 mmValue = s/(25-nmaxs-nmins);
%             else
%                 % 5
%                 OutR = [noisePic(i-4,j),noisePic(i-3,j-1),noisePic(i-3,j),noisePic(i-3,j+1),noisePic(i+4,j),noisePic(i+3,j-1),noisePic(i+3,j),noisePic(i+3,j+1),noisePic(i,j-4),noisePic(i-1,j-3),noisePic(i,j-3),noisePic(i+1,j-3),noisePic(i,j+4),noisePic(i-1,j+3),noisePic(i,j+3),noisePic(i+1,j+3)];
%                 nmax = sum(OutR(:)==255);
%                 nmin = sum(OutR(:)==0); 
%                 if 16-nmax-nmin>0
%                    sumtotal = sum(OutR(:));
%                    s = sumtotal - 255*nmax;
%                    mmValue = s/(16-nmax-nmin);
%                  else
%                      if nmaxs > nmins
%                          mmValue = 255;
%                      else
%                          mmValue = 0;
%                      end
%                  end
%             end
%         end
%     end
% end
% end
                     
    





