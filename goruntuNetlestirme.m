function varargout = goruntuNetlestirme(varargin)
% GORUNTUNETLESTIRME MATLAB code for goruntuNetlestirme.fig
%      GORUNTUNETLESTIRME, by itself, creates a new GORUNTUNETLESTIRME or raises the existing
%      singleton*.
%
%      H = GORUNTUNETLESTIRME returns the handle to a new GORUNTUNETLESTIRME or the handle to
%      the existing singleton*.
%
%      GORUNTUNETLESTIRME('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GORUNTUNETLESTIRME.M with the given input arguments.
%
%      GORUNTUNETLESTIRME('Property','Value',...) creates a new GORUNTUNETLESTIRME or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before goruntuNetlestirme_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to goruntuNetlestirme_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help goruntuNetlestirme

% Last Modified by GUIDE v2.5 02-Jan-2023 01:51:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @goruntuNetlestirme_OpeningFcn, ...
                   'gui_OutputFcn',  @goruntuNetlestirme_OutputFcn, ...
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


% --- Executes just before goruntuNetlestirme is made visible.
function goruntuNetlestirme_OpeningFcn(hObject, eventdata, handles, varargin)




% Choose default command line output for goruntuNetlestirme
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes goruntuNetlestirme wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = goruntuNetlestirme_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
close(gcf); %ge??erli olarak ??al????an Matlab penceresini kapat??r
run('goruntuislemeproje.m');


% --- Executes on button press in pushbuttonGoruntuYukle.
function pushbuttonGoruntuYukle_Callback(hObject, eventdata, handles)

global image;
%dosyan??n ismini ve yolunu ??a????rma
[filename,pathname]=uigetfile();
if filename ==0   %dosya se??ilmediyse
    msgbox(sprintf('L??TFEN B??R G??R??NT?? SE????N??Z!!'),'HATA','ERROR');
end
axes(handles.axes1)
image= imread(filename); %resmi oku
imshow(image); %resmi ekrana yazd??r

axes(handles.axes2); 
image= imread(filename);    %resmi oku
imshow(image); %resmi ekrana yazd??r

set(handles.edit1,'String',filename); %dosyan??n ad??n?? String olarak yazd??racak
set(handles.edit2,'String',pathname); %dosyan??n uzant??s??n?? String olarak yazd??racak


% --- Executes on button press in pushbuttonReset.
function pushbuttonReset_Callback(hObject, eventdata, handles)
global image
axes(handles.axes1)
imshow(image)


% --- Executes on button press in pushbuttonGoruntuyuNetlestir.
function pushbuttonGoruntuyuNetlestir_Callback(hObject, eventdata, handles)

global image
global num1
global num2
global num3
global num4
global num
axes(handles.axes1)

num1 = str2double(get(handles.inputRange1EditText,'string'));
num2 = str2double(get(handles.inputRange2EditText,'string'));
num3 = str2double(get(handles.outputRange1EditText,'string'));
num4 = str2double(get(handles.outputRange2EditText,'string'));
num = str2double(get(handles.gamaEditText,'string'));

% x1 = get(handles.inputRange1EditText,'Value');
% x2 = get(handles.inputRange2EditText,'Value');
% y1 = get(handles.outputRange1EditText,'Value');
% y2 = get(handles.outputRange2EditText,'Value');
% w = get(handles.gamaEditText,'Value');

% G??r??nt??y?? gri tonlamaya d??n????t??r
I_gray = rgb2gray(image);


% G??r??nt??deki g??r??lt??y?? azaltmak i??in Wiener filtresi kullan
I_gray = wiener2(I_gray, [3 3]);

% G??r??nt??y?? netle??tirme i??lemini ger??ekle??tir
I_gray = medfilt2(I_gray);

% Gri tonlamal?? g??r??nt??y?? orijinal g??r??nt??n??n renklerine d??n????t??r
I_color = cat(3, I_gray, I_gray, I_gray);
I_color = imlincomb(1, I_color, 1, image, 'uint8');

% G??r??nt??n??n rengini canl?? hale getir
I_color = imadjust(I_color, [num1 num2], [num3 num4], num);

% G??r??nt??y?? g??ster
imshow(I_color)



function inputRange1EditText_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function inputRange1EditText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputRange1EditText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function inputRange2EditText_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function inputRange2EditText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to inputRange2EditText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function outputRange1EditText_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function outputRange1EditText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outputRange1EditText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function outputRange2EditText_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function outputRange2EditText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to outputRange2EditText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function gamaEditText_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function gamaEditText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gamaEditText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on mouse press over figure background.
function figure1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
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
