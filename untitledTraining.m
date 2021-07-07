function varargout = untitledTraining(varargin)
% UNTITLEDTRAINING MATLAB code for untitledTraining.fig
%      UNTITLEDTRAINING, by itself, creates a new UNTITLEDTRAINING or raises the existing
%      singleton*.
%
%      H = UNTITLEDTRAINING returns the handle to a new UNTITLEDTRAINING or the handle to
%      the existing singleton*.
%
%      UNTITLEDTRAINING('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in UNTITLEDTRAINING.M with the given input arguments.
%
%      UNTITLEDTRAINING('Property','Value',...) creates a new UNTITLEDTRAINING or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before untitledTraining_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to untitledTraining_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help untitledTraining

% Last Modified by GUIDE v2.5 02-Jul-2021 12:23:11

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @untitledTraining_OpeningFcn, ...
                   'gui_OutputFcn',  @untitledTraining_OutputFcn, ...
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


% --- Executes just before untitledTraining is made visible.
function untitledTraining_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to untitledTraining (see VARARGIN)

% Choose default command line output for untitledTraining
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes untitledTraining wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = untitledTraining_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in upg.
function upg_Callback(hObject, eventdata, handles)
% hObject    handle to upg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Gp_Callback(hObject, eventdata, handles)
% hObject    handle to Gp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Gp as text
%        str2double(get(hObject,'String')) returns contents of Gp as a double


% --- Executes during object creation, after setting all properties.
function Gp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Gp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in upF.
function upF_Callback(hObject, eventdata, handles)
% hObject    handle to upF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function Fp_Callback(hObject, eventdata, handles)
% hObject    handle to Fp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of Fp as text
%        str2double(get(hObject,'String')) returns contents of Fp as a double


% --- Executes during object creation, after setting all properties.
function Fp_CreateFcn(hObject, eventdata, handles)
% hObject    handle to Fp (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Train.
function Train_Callback(hObject, eventdata, handles)
% hObject    handle to Train (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
