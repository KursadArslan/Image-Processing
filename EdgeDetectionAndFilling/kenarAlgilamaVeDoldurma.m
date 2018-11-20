I = imread('kursad.png');
a=rgb2gray(I);
[m,n]=size(a);

for i=1:m
    for j=1:n
        if a(i,j)==255
            esik(i,j)=0;
        else
            esik(i,j)=1;
        end
    end
end
ES = [1 1 1;
      1 1 1;
      1 1 1];
  Igenis=zeros(211,250);
   for i=2:211  % Satir -1
         for j=2:250 % Sutun -1
            uclu = esik(i-1:i+1,j-1:j+1);
               
                if uclu(2,2) == ES(2,2)
                   Igenis(i-1:i+1,j-1:j+1) = ES - uclu; 
                end

end
   end
   ES =[1 1 1;
      1 1 1 ;
      1 1 1;
      ];
  Idoldurma=zeros(211,250);
   for i=2:211  % Satir -1
         for j=2:250 % Sutun -1
            uclu = esik(i-1:i+1,j-1:j+1);
               
                if uclu(2,2) == ES(2,2)
                   Idoldurma(i-1:i+1,j-1:j+1) = (ES + uclu) ; 
                end

end
   end

subplot(1,3,1),imshow(I); title('Orjinal Görüntü');
subplot(1,3,2),imshow(Igenis); title('Sýnýr Görüntüsü');
subplot(1,3,3),imshow(Idoldurma); title('Doldurma Görüntüsü');
