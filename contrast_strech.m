i=imread('screenshot.jpg');
i1=rgb2gray(i);
%i1=[1 5 8 9 55 46 78 45 254;1 1 58 98 23 125 128 200 254];
[m1,n1]=size(i1);
i2=zeros(m1,n1);
greyScale=zeros(256,1);
for x=1:m1
    for y=1:n1
    greyScale(i1(x,y))=greyScale(i1(x,y))+1;
    end
end
rMin=1;
for x=1:256
    if(greyScale(x,1)==0)
        rMin=rMin+1;
    else
        break;
    end
end

rMax=256;
for x=256:1
    if(greyscale(x,1)==0)
        rMax=rMax-1;
    else
        break;
    end
end
sMin=0;
sMax=255;
s=zeros(256,1);

for r=rMin:rMax
    s(r)=((255)/(rMax-rMin))*(r-rMin);
end

for x=1:m1
    for y=1:n1
    i2(x,y)=s(i1(x,y))-1;
    end
end

imshow(i1),title('original');
figure();
imhist(i1),title('original');
figure();
imshow(uint8(i2)),title('new');
figure();
imhist(uint8(i2));
