% Copyright (c) 2017 Majid Shabani
% 97shabani@gmail.com
%

clc;
clear all;
close all;

 

x = imread('Baboon.png');        % cover message
y1 = imread('goldhill.tif');     % message image
y = imresize(y1,size(x));

n =input('Enter the no of LSB bits to be subsituted- '); 

S = uint8(bitor(bitand(x,bitcmp(2^n-1,'uint8')),bitshift(y,n-8))); %Stego
E = uint8(bitand(255,bitshift(S,8-n))); %Extracted

origImg = double(y);   %message image
distImg = double(E);   %extracted image

[M N] = size(origImg);
distImg1=imresize(distImg,[M N]);
error = origImg - distImg1;
MSE = sum(sum(error .* error)) / (M * N);
if(MSE > 0)
    PSNR = 10*log10(M*N./MSE);
else
    PSNR = 99;
end
disp('PSNR of message image to extracted image is')
disp(abs(PSNR))
disp('MSE is')
disp(abs(MSE))



subplot(2, 3, 1),imshow(x);title('1.Cover image')
subplot(2, 3, 2),imshow(y);title('2.Message to be hide')
subplot(2, 3, 3),imshow((abs(S)),[]);title('3.Stegnographic image')
subplot(2, 3, 4),imshow(real(E),[]); title('4.Extracted image')

subplot(2, 3, 5),imhist(x); title('Histogram of cover image')
subplot(2, 3, 6),imhist(S); title('Histogram of stego image')




