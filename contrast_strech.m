X=imread('screenshot.jpg');
X=rgb2gray(X);
figure(1)
a=min(X(:));
b=max(X(:));
Y=(X-a)*(255/(b-a));
subplot(1,4,1);
imshow(X);
title('ORIGINAL IMAGE');
subplot(1,4,2);
imhist(X);
title('HISTOGRAM');
subplot(1,4,3);
imshow(Y);
title('CONTRAST STRETCHED IMAGE');
subplot(1,4,4);
imhist(Y);
title('HISTOGRAM');
