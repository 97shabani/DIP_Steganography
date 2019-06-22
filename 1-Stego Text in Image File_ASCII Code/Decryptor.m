% Copyright (c) 2017  Majid Shabani.
% 97shabani@gmail.com

close all; 
clear all;
encimg = imread('encrypted.png');   %read encrypted image
orgimg = imread('originalg.png');   %read originalg image

encimg16 = uint16(encimg);    %16 bit conversion
orgimg16 = uint16(orgimg);    %16 bit conversion

[encimg16_row, encimg16_col]=size(encimg16);

exit=0;c=1;
%decrypting loop
for i=1:encimg16_row
    for j=1:encimg16_col
        if(encimg16(i,j)>=orgimg16(i,j))
            tmp=encimg16(i,j)-orgimg16(i,j);
        else
            tmp=256+encimg16(i,j)-orgimg16(i,j);
        end
        
        if(tmp~=0)
            txt(c)=uint8(tmp);
            c=c+1;
        else
            exit=1;
            break;
        end
    end
    if(exit==1)
        break;
    end
end

dectxt=fopen('Decrypted.txt','w'); %creat text file for write decrypted data 
for i=1:c-1
    fprintf(dectxt,'%c',txt(i)); %writing to decrypted.txt file
end
disp('Created Decrypted Text File And Fnished.')

