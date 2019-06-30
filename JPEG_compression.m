z=imread('peppers.png');
%I = rgb2gray(a);
I=0.2989*double(z(:,:,1))+0.5870*double(z(:,:,2))+0.1140*double(z(:,:,3));
L=255;
colormap([(0:L)/L;(0:L)/L;(0:L)/L]');
z=I;
%image(zg)
I=I-127;
DCT_image=(I);
c =[16,11,10,16,24,40,51,61; 12,12,14,19,26,58,60,55;14,13,16,24,40,57,69,56;14,17,22,29,51,87,80,62;18,22,37,56,68,109,103,77;24,35,55,64,81,104,113,92;49,64,78,87,103,121,120,101;72,92,95,98,112,100,103,99];
% in this picture number of rows and columns are multiple of 8 so we ignore padding
[m,n]=size(DCT_image);
k=1; %row
l=1; %column
for i=1:m/8
    for j=1:n/8
        
       my_slice = DCT_image(k:k+7,l:l+7);
       my_slice=dct2(my_slice);
       my_slice=round(my_slice./c);
       dec_slice=round(my_slice.*c);
       dec_slice=idct2(dec_slice);
       dec_matrix(k:k+7,l:l+7)=dec_slice;
       
       l=l+8;

    end
     l=1;  
     k=k+8;   
end
dec_matrix=dec_matrix+127;

diff=dec_matrix-z;
image(dec_matrix);
disp(diff);
%c=c./2;
%disp(c)




%disp(DCT_image)
