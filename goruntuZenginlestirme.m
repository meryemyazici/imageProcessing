function varargout = goruntuZenginlestirme(varargin)
% GORUNTUZENGINLESTIRME MATLAB code for goruntuZenginlestirme.fig
%      GORUNTUZENGINLESTIRME, by itself, creates a new GORUNTUZENGINLESTIRME or raises the existing
%      singleton*.
%
%      H = GORUNTUZENGINLESTIRME returns the handle to a new GORUNTUZENGINLESTIRME or the handle to
%      the existing singleton*.
%
%      GORUNTUZENGINLESTIRME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GORUNTUZENGINLESTIRME.M with the given input arguments.
%
%      GORUNTUZENGINLESTIRME('Property','Value',...) creates a new GORUNTUZENGINLESTIRME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before goruntuZenginlestirme_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to goruntuZenginlestirme_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help goruntuZenginlestirme

% Last Modified by GUIDE v2.5 01-Jan-2023 22:27:26

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @goruntuZenginlestirme_OpeningFcn, ...
                   'gui_OutputFcn',  @goruntuZenginlestirme_OutputFcn, ...
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


% --- Executes just before goruntuZenginlestirme is made visible.
function goruntuZenginlestirme_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to goruntuZenginlestirme (see VARARGIN)

% Choose default command line output for goruntuZenginlestirme
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes goruntuZenginlestirme wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = goruntuZenginlestirme_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
close(gcf); %geçerli olarak çalışan Matlab penceresini kapatır
run('goruntuislemeproje.m');


% --- Executes on button press in pushbuttonGoruntuYukle.
function pushbuttonGoruntuYukle_Callback(hObject, eventdata, handles)
global image;
%dosyanın ismini ve yolunu çağırma
[filename,pathname]=uigetfile();
if filename ==0   %dosya seçilmediyse
    msgbox(sprintf('LÜTFEN BİR GÖRÜNTÜ SEÇİNİZ!!'),'HATA','ERROR');
end
axes(handles.axes1)
image= imread(filename); %resmi oku
imshow(image); %resmi ekrana yazdır

axes(handles.axes2); 
image= imread(filename);    %resmi oku
imshow(image); %resmi ekrana yazdır

set(handles.edit1,'String',filename); %dosyanın adını String olarak yazdıracak
set(handles.edit2,'String',pathname); %dosyanın uzantısını String olarak yazdıracak


% --- Executes on button press in pushbuttonReset.
function pushbuttonReset_Callback(hObject, eventdata, handles)
%resetlemek yani görüntünün ilk haline getirmek
global image
axes(handles.axes1)
imshow(image)


% --- Executes on button press in pushbuttonGoruntuZenginlestir.
function pushbuttonGoruntuZenginlestir_Callback(hObject, eventdata, handles)
global image
global veri
veri = get(handles.slider1,'Value');
axes(handles.axes1) %goruntu degissin diye

stretchlim_output = stretchlim(image);
stretchlim_output = stretchlim_output * veri;
I_enhanced = imadjust(image, stretchlim_output, [0 1]);
imshow(I_enhanced);



% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
global image
axes(handles.axes1)

% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbuttonCikis.
function pushbuttonCikis_Callback(hObject, eventdata, handles)
delete(handles.figure1);
clear
