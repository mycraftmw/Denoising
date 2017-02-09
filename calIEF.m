function IEF = calIEF(oriPic, noisePic, newPic)
    M1 = noisePic - oriPic;
    M2 = M1.^2;
    M3 = newPic - oriPic;
    M4 = M3.^2;
    sum1 = sum(M2(:));
    sum2 = sum(M4(:));
    IEF = sum1/sum2;
end