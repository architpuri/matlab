iStart = imread('lena.jpg');
iBlock=zeros(4,4);
for i=1:4
    for j=1:4
        iBlock(i,j) = iStart(i,j);
    end
end
symbols=161:163;
p=[0.1875 0.5 0.3125];
dict = huffmandict(symbols,p);
sig = randsrc(5,1,[symbols; p]);
comp = huffmanenco(sig,dict);
iOutput=size(iBlock);
%dsig = huffmandeco(comp,dict);
%isequal(sig,dsig)
valueInc=0;
for i=1:4
    for j=1:4
        if(valueInc < length(comp))
            valueInc=valueInc+1;
        iOutput(i,j)=comp(valueInc);
        else
            iOutput(i,j)=5;
        end
    end
end
