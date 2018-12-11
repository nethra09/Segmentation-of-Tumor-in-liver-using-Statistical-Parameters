clc
clear all;
close all;
%cd images
%%%% step1 Reading the input sirce image
% I=uigetfile('.jpg','select the source image');
% I=imread('liver5.jpg');
I=uigetfile('.jpg','select the source image');
I=imread(I);
f=imresize(I,[512 512]);
cd ..
 figure,imshow(I);title('INPUT SOURCE IMAGE');
%%% step2 extracting the green channel component
  R=I(:,:,1);
 f=I(:,:,2);
  B=I(:,:,3);
  figure,imshow(f);title('GREEN CHANNEL COMPONENT');
 d=medfilt2(f);
 figure;imshow(d);title('filtered');

[r c]=size(d);

for x=1:r
    for y=1:c

        if (d(x,y)>=130)
            d1(x,y)=255;
        else
            d1(x,y)=0;
        end
    end
end
figure;imshow(d1);title('removing skin');
for x=1:r
    for y=1:c
        
        if (d1(x,y)==0)
           q(x,y)=d(x,y);
        else
          q(x,y)=0;
        end
    end
end
figure;imshow(q);title('masking');
for x=1:r
    for y=1:c
        
        if (q(x,y)>=100 && q(x,y)<=160)
            i(x,y)=255;
        else
          i(x,y)=0;
        end
    end
end
figure;imshow(i);title('thresholding');
 se = strel('disk',7);
    AA6=imerode(i,se);
    figure;
    imshow(AA6,[]);
    AA7=imreconstruct(AA6,i);
    figure;
    imshow(AA7,[]);
    I4=imfill(AA7,'holes');
figure,imshow(I4);
  
    
%   AA8=imdilate(I4,se);
%   figure;
%   imshow(AA8,[]);
%   k=bwareaopen(AA8,50);
% figure;imshow(k);title('area open');
