i1=imread('lenaa.jpg');
[m1,n1]=size(i1);
m2=300;
n2=300;
i2=zeros(m2,n2);
cx=n2/n1;
cy=m2/m1;
for x=1:n2
    for y=1:m2
        v=x/cx;
        w=y/cy;
        v=round(v);
        w=round(w);
        i2(x,y)=i1(v,w);
        
    end
end

imshow(i1),title('original');

imshow(uint8(i2)),title('new');
imwrite(uint8(i2),'LENA.jpg');