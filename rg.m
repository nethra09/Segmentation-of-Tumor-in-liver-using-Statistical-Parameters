%Consider an image composed of small, no overlapping blobs. Segmenting the
%blobs based on region growing.

%function regrow(x)
%f1=imread('cameraman.tif');



clc;
clear all;
close all;

%%%% step1 Reading the input source image
I=uigetfile('*.*','select the source image');
I=imread(I);
I=imresize(I,[512 512]);
cd ..
figure,imshow(I);title('INPUT SOURCE IMAGE');
%%% step2 extracting the green channel component
R=I(:,:,1);
f=I(:,:,2);
B=I(:,:,3);
figure,imshow(f);title('GREEN CHANNEL COMPONENT');
figure,imshow(f),title('Original Image');

%I1=R(1:256,1:128);
%I2=R(1:256,129:256);
%figure,imshow(mat2gray(I1))               
%figure,imshow(mat2gray(I2))
%figure,imhist(I1);
%figure,imhist(I2);
f=double(f);
s=236;
t=30;  
if numel(s)==1
    si=f==s;
    s1=s;
else
    si=bwmorph(s,'shrink',Inf);
    j=find(si);
    s1=f(j);
end
ti=false(size(f));

for k=1:length(s1)
    sv=s1(k);
    s=abs(f-sv)<=t;
    ti=ti|s;
    
end
figure,imshow(ti);
figure,imshow(si);
[g nr]=bwlabel(imreconstruct(si,ti));
figure,imshow(g),title('Segmented Image - Region Growing');
display('No: of regions');
k= medfilt2(g,[9 9]);
figure;
imshow(k);title('after median filtering');

se= strel('disk',1);
% % p= imopen(k,se); 
% % figure;
% % imshow(p);
m=imclose(k,se);
figure;
imshow(m);
title('after closing');%pixval on;


 fi=imfill(m,'holes');
 figure;imshow(fi);title('after filling');



datastats(fi(:))
%nr
%end