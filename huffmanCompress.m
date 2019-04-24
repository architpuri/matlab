
iStart = imread('lena.jpg');
iBlock=iStart(1:4,1:4);
symbolsA= transpose(unique(iStart(1:4,1:4)));
symbols=double(symbolsA);
p=[0.1875 0.5 0.3125];
dict = huffmandict(symbols,p);
sig = randsrc(5,1,[symbols; p]);
comp = huffmanenco(sig,dict);
iOutput=size(iBlock);
valueInc=0;
for i=1:4
    for j=1:4
        if(valueInc < length(comp))
            valueInc=valueInc+1;
        iOutput(i,j)=comp(valueInc);
        elseif(i==4 && j==4)
            iOutput(i,j)=length(comp);
        else 
            iOutput(i,j)=5;
        end
    end
end

lengthImage=iOutput(4,4);
compObtained=zeros(lengthImage,1);
valueObtainedInc=1;
for i=1:4
    for j=1:4
        if(valueObtainedInc < lengthImage+1)
            compObtained(valueObtainedInc,1)=iOutput(i,j);
            valueObtainedInc=valueObtainedInc+1;
        end
    end
end
dsig = huffmandeco(compObtained,dict);
isequal(sig,dsig)
symbolsf= double(transpose(unique(dsig)));
