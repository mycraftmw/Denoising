function SSIM = calSSIM(oriPic,newPic)
    avgOri = sum(oriPic(:))/(128*128);
    avgNew = sum(newPic(:))/(128*128);
    
    stdOri = std(oriPic(:));
    stdNew = std(newPic(:));
    covON = cov(oriPic,newPic);
    
    C1 = 0.001*0.001*255*255;
    C2 = 0.002*0.002*255*255;
    C3 = C2/2;
    
    L = (2*avgOri*avgNew + C1)/ (avgOri^2 + avgNew^2 + C1);
    C = (2*stdOri*stdNew + C2)/ (stdOri^2 + stdNew^2 + C2);
    S = (covON(1,2) + C3)/(stdOri*stdNew + C3);

    SSIM = L*C*S;
end