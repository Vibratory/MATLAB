function varargout = untitled(varargin)
% UNTITLED MATLAB code for untitled.fig
%      UNTITLED, by itself, creates a new UNTITLED or raises the existing
%      singleton*.
%
%      H = UNTITLED returns the handle to a new UNTITLED or the handle to
%      the existing singleton*.
%
%      UNTITLED('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLED.M with the given input arguments.
%
%      UNTITLED('Property','Value',...) creates a new UNTITLED or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitled_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitled_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitled

% Last Modified by GUIDE v2.5 05-Jul-2021 15:11:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitled_OpeningFcn, ...
                   'gui_OutputFcn',  @untitled_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before untitled is made visible.
function untitled_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitled (see VARARGIN)

% Choose default command line output for untitled
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitled wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitled_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ver.
function ver_Callback(hObject, eventdata, handles)

handles = guidata(hObject);
g = handles.g;
disp('handles ver');


hwr = handles.hw;
vcr = handles.vc;
hcr= handles.hc;
npr = handles.pn;

hwc = handles.hwc;
vcc = handles.vcc;
disp(handles.g);
hcc = handles.hcc;
npc = handles.npc;

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


% c = {'number of pixels' 'H to W Ratio' 'Vertical Center' 'Horizontal Center' ; round(np) ,round(hw), round(hc), round(vc)}; 
%   fid = fopen('C:/Users/CryptoRich/Documents/MATLAB/s.csv','w');
%   fprintf(fid,'%s, %s, %s, %s, %s\n',c{1,:});
%   fprintf(fid, '%f, %f ,%f, %f\n',c{2,:});
%   fclose(fid);
  
  g = [round(np) round(hw) round(hc) round(vc) g];
  
dlmwrite('C:/Users/CryptoRich/Documents/MATLAB/s.csv',g , '-append','delimiter',',')
 
guidata(hObject,handles);



% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)

%empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Feat.
function Feat_Callback(hObject, eventdata, handles)
handles = guidata(hObject);
handles.bound = handles.rsd


%boundaries of signature
%x / i
sz=size(handles.bound,1);
%y / j
szz=size(handles.bound,2);

%find top limit
for i = 1:sz
    for j = 1:szz  
       z = handles.bound(i,j); 
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
       z = handles.bound(i,j); 
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
       z = handles.bound(i,j); 
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
       z = handles.bound(i,j); 
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
s=sum(handles.bound(:) == 0);
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

%show in listbox
str{2}=strcat('Height :',num2str(str{2}));
str{3}=strcat('width :',num2str(str{3}));
str{4}=strcat('height to width ratio :',num2str(str{4}));
str{5}=strcat('vertical center :',num2str(str{5}));
str{6}=strcat('horizontal center:',num2str(str{6}));

set(handles.listbox1, 'String',str);

%distance
d1 = sqrt(jr-1)+sqrt(ir-1);
d2 = sqrt(jb-sz)+sqrt(ib-1);
rt = d1/d2;
disp(d1);
disp(d2);

disp(rt);

%handles.ftrd = rszd;
handles.pn=s;
handles.hw=str{4};
handles.vc=str{5};
handles.hc=str{6};

  guidata(hObject,handles);


% --- Executes on button press in Edge.
function Edge_Callback(hObject, eventdata, handles)
handles = guidata(hObject);
 edge = ~handles.rsd
 sz = size(edge,1);
 szz = 300;
 co = 0;
 imshow(edge);
 pause(1);
 
for i = 2 : sz-1
    for j = 2 : szz-1
        v=0;
        h=edge(i,j);
        if h == 1
            
neighbors(1) = edge(i-1,j-1); % Upper left.  r = row, c = column.
neighbors(2) = edge(i-1,j); % Upper middle.  r = row, c = column.
neighbors(3) = edge(i-1,j+1); % Upper right.  r = row, c = column.
neighbors(4) = edge(i,j-1); % left.  r = row, c = column.
neighbors(5) = edge(i,j+1); % right. r = row, c = column.
neighbors(6) = edge(i+1,j+1); % Lower right.  r = row, c = column.
neighbors(7) = edge(i+1,j); % lower middle.  r = row, c = column.
neighbors(8) = edge(i+1,j-1); % Lower left.  r = row, c = column.

      for p = 1 : 8
    
          v = v + neighbors(p);
          disp('v');
          disp(v);
     
      end
      
      if v == 1
        
        co = co +1
        
      end
        end
    end
     
end
disp('number of edges');
disp(co);

%handles.edgd = bp;
handles = guidata(hObject);

% --- Executes on button press in Grid.
function Grid_Callback(hObject, eventdata, handles)
handles = guidata(hObject);
I = handles.rsd
sz = size(I,1);
disp(I);
imshow(I);

grids = mat2cell(I, ones(1, 10) * round(size(I, 1))/10, ones(1, 6) * round(size(I, 2))/6, 1)
for i = 1 : 59
x = grids{i};
black{i} = nnz(~x) / numel(x);

imshow(x);
end
%black = nnz(~grid) / numel(grid);
    

handles.g = black;

  guidata(hObject,handles);

% --- Executes on button press in BIN.
function BIN_Callback(hObject, eventdata, handles)
axes(handles.axes1);
 
handles = guidata(hObject);

handles.pth = handles.imgR

grey = rgb2gray(imread(handles.pth));
noisy = imnoise(grey,'salt & pepper',0.05);
imshow(noisy);
nois = medfilt2(grey, [1 1]);
imshow(nois);
ab=~imbinarize(nois);
imshow(~ab);
handles = guidata(hObject);
 handles.f = ab;
  guidata(hObject,handles);


% --- Executes on button press in Skel.
function Skel_Callback(hObject, eventdata, handles)
cla(handles.axes1,'reset');
handles = guidata(hObject);

k = handles.f
skel=bwmorph(k,'thin',inf);
imshow(~skel);

handles.skl = skel;
  guidata(hObject,handles);


%M=ocr(k);
%disp(M);
% hObject    handle to Skel (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Noise.
function Noise_Callback(hObject, eventdata, handles)
handles = guidata(hObject);
noisy = handles.f

filtered = medfilt2(noisy);
imshow(filtered);

handles.noise = rszd;
  guidata(hObject,handles);

% --- Executes on button press in resize.
function resize_Callback(hObject, eventdata, handles)
handles = guidata(hObject);
handles.res = handles.crp

%Imresize
rszd = imresize(handles.res,[NaN 300]);
imshow(rszd);

handles.rsd = rszd;
  guidata(hObject,handles);

  
% --- Executes on button press in Rot.
function Rot_Callback(hObject, eventdata, handles)
%Items = handles.listbox1.Value;
%disp(Items);
%matrix= Items;
%disp(matrix);

% --- Executes on button press in crop.
function crop_Callback(hObject, eventdata, handles)

%crop image w/out imcrop
handles = guidata(hObject);
handles.k = ~handles.skl

imshow(handles.k);

%boundaries of signature
%x / i
sz=size(handles.k,1);
%y / j
szz=size(handles.k,2);

%find top limit
for i = 1:sz
    for j = 1:szz  
       z = handles.k(i,j); 
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
       z = handles.k(i,j); 
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
       z = handles.k(i,j); 
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
       z = handles.k(i,j); 
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

cropd = handles.k(it:ib,jl:jr)

imshow(cropd);

handles.crp = cropd;
  guidata(hObject,handles);

% --- Executes on button press in slctcompimg.
function slctcompimg_Callback(hObject, eventdata, handles)
handles = guidata(hObject);
[file,path] = uigetfile('*.*');
if isequal(file,0)
   disp('User selected Cancel');
else
   disp(['User selected ', fullfile(path,file)]);
end
handles.imgC = fullfile(path,file);
  guidata(hObject,handles);
  
% --- Executes on button press in slctimg1.
function slctimg1_Callback(hObject, eventdata, handles)
handles = guidata(hObject);

[file,path] = uigetfile('*.*');
if isequal(file,0)
   disp('User selected Cancel');
else
   disp(['User selected ', fullfile(path,file)]);
end

handles.imgR = fullfile(path,file);
  guidata(hObject,handles);
  
  
  %SECOND PHOTO FEATURE EXTRACTION AND PREPROCESSING
  % --- Executes on button press in photo2.
function photo2_Callback(hObject, eventdata, handles)
axes(handles.axes2);

handles.pth = handles.imgC

grey = rgb2gray(imread(handles.pth));
noisy = imnoise(grey,'salt & pepper',0.05);
imshow(noisy);
nois = medfilt2(grey, [1 1]);
imshow(nois);
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

%add items to listbox
str{2}=strcat('Height :',num2str(str{2}));
str{3}=strcat('width :',num2str(str{3}));
str{4}=strcat('height to width ratio :',num2str(str{4}));
str{5}=strcat('vertical center :',num2str(str{5}));
str{6}=strcat('horizontal center:',num2str(str{6}));

set(handles.lstb2, 'String',str);

%handles.ftrd = rszd;
handles.npc=s;
handles.hwc=str{4};
handles.vcc=str{5};
handles.hcc=str{6};

handles.str = str;
  guidata(hObject,handles);


% --- Executes on selection change in lstb2.
function lstb2_Callback(hObject, eventdata, handles)
% hObject    handle to lstb2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns lstb2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from lstb2


% --- Executes during object creation, after setting all properties.
function lstb2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to lstb2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
