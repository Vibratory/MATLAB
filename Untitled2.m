genuine = 'C:\data\genuine' 
forgery = 'C:\data\g2'
fileList = dir(fullfile(genuine, '/*.png'));
fileList1 = dir(fullfile(forgery, '/*.png'));

for i = 1:numel(fileList);
   fullFileName = fullfile(fileList(i).folder, fileList(i).name)
picture = imread(fullFileName);
[hwr,vcr,hcr,npr]= average(picture);
imshow(picture);
fullFileName = fullfile(fileList1(i).folder, fileList1(i).name)
picture = imread(fullFileName);
[hwc,vcc,hcc,npc]= average(picture);
n=2;
mycomp(hwr,hwc,vcr,vcc,hcr,hcc,npr,npc,n)

imshow(picture);


disp(hwr);
disp(hwc);
disp(vcr);
disp(vcc);
disp(hcr);
disp(hcc);


n=n+1;
end


function mycomp(hwr,hwc,vcr,vcc,hcr,hcc,npr,npc,n);

if hwc < hwr 
    hw = (hwc/hwr)*100;
else 
    hw = (hwr/hwc)*100;
end 

if vcc < vcr 
    vc = (vcc/vcr)*100;
else 
    vc = (vcr/vcc)*100;
end 

if hcc < hcr 
    hc = (hcc/hcr)*100;
else 
    hc = (hcr/hcc)*100;
end 

if npr < npc
    np = (npr/npc)*100;
else 
    np = (npc/npr)*100;
end 
z = 1;
 a = [round(np) round(hw) round(vc) round(hc) z]
dlmwrite('C:/Users/CryptoRich/Documents/MATLAB/s1.csv',a , '-append','delimiter',',')
end


function [hw,vc,hc,np] = average(picture)

grey = rgb2gray(picture);
noisy = imnoise(grey,'salt & pepper',0.05);
nois = medfilt2(grey, [1 1]);
ab=~imbinarize(nois);
imshow(~ab);

%skell

skel=bwmorph(ab,'thin',inf);
imshow(~skel);

%crop

skel = ~skel
%boundaries of signature
%x / i
sz=size(skel,1);
%y / j
szz=size(skel,2);

%find top limit
for i = 1:sz
    for j = 1:szz  
       z = skel(i,j); 
       if (z==0)
           it=i;
           jt=j;
       %xt = strcat('i :',num2str(i),'j :',num2str(j));
%disp(xt);
       %disp(~k(i,:))
       break
       end
    end
      if (z==0)
           break 
           
      end 
end

%find bottom limit
for i = sz:-1:1
    for j = 1:szz  
       z = skel(i,j); 
       if (z==0)
           ib=i;
           jb=j;
 %     xb = strcat('i :',num2str(i),'j :',num2str(j));
%disp(xb);
       break
       end
    end
      if (z==0)
           break 
           
      end 
end

%find left limit
for j = 1:szz
    for i = 1:sz  
       z = skel(i,j); 
       if (z==0)
           il=i;
           jl=j;
 %   xl = strcat('i :',num2str(i),'j :',num2str(j));
%disp(xl);
       break
       
       end
    end
      if (z==0)
           break 
      end
end

%find right limit
for j = szz:-1:1
    for i = sz:-1:1 
       z = skel(i,j); 
       if (z==0)
           ir=i;
           jr=j;
%xr = strcat('i :',num2str(i),'j :',num2str(j));
%disp(xr);
       break
  
       end
    end
      if (z==0)
           break 
      end 
end

cropd = skel(it:ib,jl:jr)

imshow(cropd);

%Imresize
rszd = imresize(cropd,[NaN 300]);
imshow(rszd);


%features

%boundaries of signature
%x / i
sz=size(rszd,1);
%y / j
szz=size(rszd,2);

%find top limit
for i = 1:sz
    for j = 1:szz  
       z = rszd(i,j); 
       if (z==0)
           it=i;
           jt=j;
       xt = strcat('i :',num2str(i),'j :',num2str(j));
disp(xt);
       %disp(~k(i,:))
       break
       end
    end
      if (z==0)
           break 
           
      end 
end

%find bottom limit
for i = sz:-1:1
    for j = 1:szz  
       z = rszd(i,j); 
       if (z==0)
           ib=i;
           jb=j;
      xb = strcat('i :',num2str(i),'j :',num2str(j));
disp(xb);
       break
       end
    end
      if (z==0)
           break 
           
      end 
end

%find left limit
for j = 1:szz
    for i = 1:sz  
       z = rszd(i,j); 
       if (z==0)
           il=i;
           jl=j;
    xl = strcat('i :',num2str(i),'j :',num2str(j));
disp(xl);
       break
       
       end
    end
      if (z==0)
           break 
      end
end

%find right limit
for j = szz:-1:1
    for i = sz:-1:1 
       z = rszd(i,j); 
       if (z==0)
           ir=i;
           jr=j;
xr = strcat('i :',num2str(i),'j :',num2str(j));
disp(xr);
       break
  
       end
    end
      if (z==0)
           break 
      end 
end

%num of black PX
s=sum(rszd(:) == 0);
disp(s);
str{1} = strcat('Num of Black Pixels:',num2str(s));

%H to W ratio
str{2} = ib - it;
str{3} = jr - jl;
str{4} = str{3}/str{2};

%vertical center
str{5} = str{2}/2;

%horizontal center
str{6}=str{3}/2;

hw = str{4};
vc = str{5};
hc = str{6};
np = s;
end


% specify the extension of your image file
