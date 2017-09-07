function similarity = testH2G(Pic1,Pic2)
[Count1,~] = imhist(Pic1);
[Count2,~] = imhist(Pic2);
Sum1 = sum(Count1);Sum2 = sum(Count2);
Sumup = sqrt(Count1.*Count2); % mat
SumDown = sqrt(Sum1*Sum2);
Sumup = sum(Sumup);
similarity = 1-sqrt(1-Sumup/SumDown);