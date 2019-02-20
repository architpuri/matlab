i1=imread('lenaa.jpg');
[m1,n1]=size(i1);
m2=300;
n2=300;
i2=zeros(m2,n2);
cy=n2/n1;
cx=m2/m1;
for x=1:n2
    for y=1:m2
    x0=x/cx;
    y0=y/cy;
    u0=floor(x0);
    v0=floor(y0);
    if(u0==0)
        u0=1;
    end
    if(v0==0)
        v0=1;
    end
    a=x0-u0;
    b=y0-v0;
    A=i1(u0,v0);
    if(v0+1>n1 && u0+1>m1)
        B=i1(u0,v0);
        C=i1(u0,v0);
        D=i1(u0,v0);
    elseif(v0+1>n1 && u0+1<=m1)
        B=i1(u0,v0);
        C=i1(u0+1,v0);
        D=i1(u0+1,v0);
    else
            B=i1(u0,v0+1);
            C=i1(u0,v0);
            D=i1(u0,v0+1);
    end
    i2(x,y)=(a-1)*(b-1)*A+a*(1-b)*B+(1-a)*b*C+a*b*D;
    end
end
imshow(i1),title('original');
figure();
imshow(uint8(i2)),title('new');
imwrite(uint8(i2),'LENAji.jpg');

