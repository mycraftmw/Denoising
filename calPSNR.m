function PSNR = calPSNR(oriPic, newPic);
    M1 = oriPic - newPic;
    M2 = M1.^2;
    sum4test = sum(M2(:));
    PSNR = 10*(log10(255*255*128*128)-log10(sum4test));
end