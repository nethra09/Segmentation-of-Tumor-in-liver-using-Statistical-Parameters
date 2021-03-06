clc;
clear all;
close all;
[I1,map]=imread('liver17e2.jpg');
J=ones(6,6);
R=rgb2gray(I1);
 A=imresize(R,[128 128]);
 
   %A=double(R1/255);
   figure(1);imshow(A)
   
   B=A;
   figure(2);imshow(B)
   k=1;
    count=0;
     count1=0;
     
for i=2:127
    for j=2:127
        
       temp1(k,:)=[A(i-1,j-1) A(i-1,j) A(i-1,j+1) A(i,j-1) A(i,j) A(i,j+1) A(i+1,j-1) A(i+1,j) A(i+1,j+1)];
        p(k)=mean(temp1(k,:));
        % a(k)=median(temp1(k,:));
        %t=(mean(p))/2;
        if((p(k)>98)&&(p(k)<128))
        
      %if((a(k)>102)&&(a(k)<128))
          B(i,j)=0;
           count=count+1;
         
      else
          B(i,j)=255;
           count1=count1+1;
       
      end  
       k=k+1; 
    end  
end


figure(3);imshow(B)

C=medfilt2(B);
figure(4);imshow(C)
a1=fspecial('average',[2,2]);
D=filter2(a1,C);
figure(5);imshow(D)
E=medfilt2(D);
figure(6);imshow(E)
G=imdilate(E,J);
figure(7);imshow(G)
F=imerode(G,J);
figure(8);imshow(F)
V=F;
for i=1:128
    for j=1:128
if(F(i,j)<=100)
    V(i,j)=0;
else
    V(i,j)=255;
end
    end
end
figure(9);imshow(V)
%U=ones(128,128);
figure(10);imshow(A)
cot=0;
cot1=0;
for i=1:128
  for j=1:128

if(V(i,j)==0)
    cot=cot+1;
    A(i,j)
   U(i,j)=A(i,j);
  % U(i,j)=255;
else
   U(i,j)=0;
   cot1=cot1+1;
  
end
  end
end
figure(11);imshow(U)
%U1=gray2rgb(double(U));
s=strel('disk',1,0);%Structuring element
F1=imerode(B,s);
figure(12);imshow(F1)
Z=B-F1;
figure(13);imshow(Z)
threshold = graythresh(U);
bw = im2bw(U,threshold);
figure(14);imshow(bw)
bw = bwareaopen(bw,30);
se = strel('disk',2);
bw = imclose(bw,se);

bw= imfill(bw,'holes');

figure(15);imshow(bw)
[B2,L] = bwboundaries(bw,'noholes');


imshow(label2rgb(L, @jet, [.5 .5 .5]))
hold on
for k = 1:length(B2)
  boundary = B2{k};
  plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
end

cot2=0;
cot3=0;
for i=1:127
  for j=1:127

    
   if(bw(i,j)==0)
   
   d(i,j)=U(i,j);
   else
       d(i,j)=255;
   
  % U(i,j)=255;
   end
  
end
  
end

figure(16);imshow(d)

