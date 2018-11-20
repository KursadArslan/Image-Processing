I=imread('cameraman.tif');
I=imnoise(I);
subplot(4,2,1),imshow(I),title('Orjinal+Gürültü');
cf=fftshift(fft2(I));
 
subplot(4,2,2),imshow(mat2gray(log(1+abs(cf)))),title('FT1');
 
[x,y]=meshgrid(-128:127,-128:127);
z=sqrt(x.^2+y.^2);
c=(z<15);
cf1=cf.*c;  % Konvolusyon
 
subplot(4,2,4),imshow(mat2gray(log(1+abs(cf1)))),title('FT2');
 
s=ifft2(cf1);
 
subplot(4,2,3),imshow(mat2gray((1+abs(s)))),title('Bulanik');
c=(z<50);
cf1=cf.*c;

subplot(4,2,6),imshow(mat2gray(log(1+abs(cf1)))),title('Uzaysal FD');
s=ifft2(cf1);
 
subplot(4,2,5),imshow(mat2gray((abs(s)))),title('Filtrelenmiþ');
  % Yuksel Geciren
I=imread('cameraman.tif');
[x,y]=meshgrid(-128:127,-128:127);
z=sqrt(x.^2+y.^2);
c=(z>15);
cf= fftshift(fft2(I));
cfh=cf.*c;
subplot(4,2,8),imshow(mat2gray(log(1+abs(cfh)))),title('Yuksek FT');

cfhi=ifft2(cfh);

subplot(4,2,7),imshow(uint8(abs(cfhi))),title('Yuksek FT Goruntu');
 
 
 
 