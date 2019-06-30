z=imread('peppers.png');
%image(z);
I=0.2989*double(z(:,:,1))+0.5870*double(z(:,:,2))+0.1140*double(z(:,:,3));
L=255;
colormap([(0:L)/L;(0:L)/L;(0:L)/L]');
%image(I);
z=fft2(I);
%image(z); %error
zlog=log(1+abs(z));
M=max(max(zlog));
%image(255*zlog/M);
thresh=[0.3,0.0001,0.5];
my_distortion=[0,0,0];
for i=1:3
    subplot(2,2,i)
    Zthresh=(abs(z)>(thresh(i)*M)).*z;
    zthresh=real(ifft2(Zthresh));
    image(zthresh);
    title(thresh(i));
end

for j=1:3
    Zthresh=(abs(z)>(thresh(j)*M)).*z;
    zthresh=real(ifft2(Zthresh));
    my_distortion(j)=100*norm(I-zthresh,'fro')^2/norm(I,'fro')^2; 
    
end

disp(my_distortion);

%--------------------------------------------------------------------------
%compute compression ratio 
%in = imfinfo(''crystal.bmp');
%imwrite(f,'crystal1.jpg');
%k=imfinfo('crystal.jpg');
%ib=in.FileSize;
%cb=k.FileSize;
%cr=ib/cb

