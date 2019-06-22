% Copyright (c) 2017  Majid Shabani.
% 97shabani@gmail.com



function bin2file(Binary,FileName)
%Write the file:
%Binary=binn;
%FileName='new.txt';
FID = fopen(FileName, 'wb+');
if FID < 0
   error([ErrID, ':WriteFile'], ['Cannot write file: ', FileName]);
end
l=length(Binary);
m=mod(l,8);
%l2=(l-m);
l=l-m;
Binary=Binary(1:l);
l=length(Binary)/8;
bits = reshape(Binary,8,l);
bits=bits';
asc=bin2dec(bits);
asc2=uint8(asc);
fwrite(FID, asc2, 'uint8');
fclose(FID);
end
