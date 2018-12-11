clc;
clear all;
close all;
[I1,map]=imread('liver5.jpg');
imshow(I1);
x=input('white is 1 and nonwhite is 0');
if(x==1)
   

% J=ones(3,3);
s=strel('disk',4);
R=rgb2gray(I1);
A=imresize(R,[128 128]);
 
   %A=double(R1/255);
   figure(1);imshow(A)
   
   B=A;
   figure(2);imshow(B)
   k=1;
    count=0;
     count1=0;
%      t=2;
%      n=(3*t)+1;
for i=2:127
    for j=2:127
        
        temp1(k,:)=[A(i-1,j-1) A(i-1,j) A(i-1,j+1) A(i,j-1) A(i,j) A(i,j+1) A(i+1,j-1) A(i+1,j) A(i+1,j+1)];
        p(k)=mean(temp1(k,:));
        % a(k)=median(temp1(k,:));
        %t=(mean(p))/2;
        if((p(k)>200)&&(p(k)<255))
        
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
a1=fspecial('average',[1,1]);
D=filter2(a1,C);
figure(5);imshow(D)
% E=medfilt2(D);
% figure(6);imshow(E)
% G=imdilate(D,s);
% figure(7);imshow(G)
% % Y=imdilate(G,s);
% % figure(12);imshow(Y)
% % % K=filter2(a1,G);
% % % figure(12);imshow(K);
% X=imerode(G,s);
% figure(8);imshow(X)
% F=imerode(X,s);
% figure(13);imshow(F)

V=D;
for i=1:128
    for j=1:128
if(D(i,j)<=200)
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
% s=strel('disk',2);%Structuring element
% F1=imerode(B,s);
% figure(12);imshow(F1)
% Z=B-F1;
% figure(13);imshow(Z)
% threshold = graythresh(U);
% bw = im2bw(U,threshold);
% figure(14);imshow(bw)
% bw = bwareaopen(bw,30);
% se = strel('disk',2);
% bw = imclose(bw,se);
% 
% bw= imfill(bw,'holes');
% 
% figure(15);imshow(bw)
% [B2,L] = bwboundaries(bw,'noholes');
% 
% 
% imshow(label2rgb(L, @jet, [.5 .5 .5]))
% hold on
% for k = 1:length(B2)
%   boundary = B2{k};
%   plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
% end
% 
% cot2=0;
% cot3=0;
% for i=1:127
%   for j=1:127
% 
%     
%    if(bw(i,j)==0)
%    
%    d(i,j)=U(i,j);
%    else
%        d(i,j)=255;
%    
%   % U(i,j)=255;
%    end
%   
% end
%   
% end
% 
% figure(16);imshow(d)
else

% J=ones(3,3);
s=strel('disk',5);
R=rgb2gray(I1);
 A=imresize(R,[128 128]);
 
   %A=double(R1/255);
   figure(1);imshow(A)
   
   B=A;
   figure(2);imshow(B)
   k=1;
    count=0;
     count1=0;
     t=2;
     n=(3*t)+1;
for i=2:127
    for j=2:127
        
        temp1(k,:)=[A(i-1,j-1) A(i-1,j) A(i-1,j+1) A(i,j-1) A(i,j) A(i,j+1) A(i+1,j-1) A(i+1,j) A(i+1,j+1)];
        p(k)=mean(temp1(k,:));
        % a(k)=median(temp1(k,:));
        %t=(mean(p))/2;
        if((p(k)>t*n*n)&&(p(k)<t*(n+1)*(n+1)))
        
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
a1=fspecial('average',[1,1]);
D=filter2(a1,C);
figure(5);imshow(D)
E=medfilt2(D);
figure(6);imshow(E)
G=imdilate(E,s);
figure(7);imshow(G)
K=filter2(a1,G);
figure(12);imshow(K);
F=imerode(K,s);
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
% s=strel('disk',2);%Structuring element
% F1=imerode(B,s);
% figure(12);imshow(F1)
% Z=B-F1;
% figure(13);imshow(Z)
% threshold = graythresh(U);
% bw = im2bw(U,threshold);
% figure(14);imshow(bw)
% bw = bwareaopen(bw,30);
% se = strel('disk',2);
% bw = imclose(bw,se);
% 
% bw= imfill(bw,'holes');
% 
% figure(15);imshow(bw)
% [B2,L] = bwboundaries(bw,'noholes');
% 
% 
% imshow(label2rgb(L, @jet, [.5 .5 .5]))
% hold on
% for k = 1:length(B2)
%   boundary = B2{k};
%   plot(boundary(:,2), boundary(:,1), 'w', 'LineWidth', 2)
% end
% 
% cot2=0;
% cot3=0;
% for i=1:127
%   for j=1:127
% 
%     
%    if(bw(i,j)==0)
%    
%    d(i,j)=U(i,j);
%    else
%        d(i,j)=255;
%    
%   % U(i,j)=255;
%    end
%   
% end
%   
% end
% 
% figure(16);imshow(d)
end