function varargout = goruntuislemeproje(varargin)
% GORUNTUISLEMEPROJE MATLAB code for goruntuislemeproje.fig
%      GORUNTUISLEMEPROJE, by itself, creates a new GORUNTUISLEMEPROJE or raises the existing
%      singleton*.
%
%      H = GORUNTUISLEMEPROJE returns the handle to a new GORUNTUISLEMEPROJE or the handle to
%      the existing singleton*.
%
%      GORUNTUISLEMEPROJE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GORUNTUISLEMEPROJE.M with the given input arguments.
%
%      GORUNTUISLEMEPROJE('Property','Value',...) creates a new GORUNTUISLEMEPROJE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before goruntuislemeproje_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to goruntuislemeproje_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help goruntuislemeproje

% Last Modified by GUIDE v2.5 01-Jan-2023 20:09:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @goruntuislemeproje_OpeningFcn, ...
                   'gui_OutputFcn',  @goruntuislemeproje_OutputFcn, ...
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


% --- Executes just before goruntuislemeproje is made visible.
function goruntuislemeproje_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to goruntuislemeproje (see VARARGIN)

% Choose default command line output for goruntuislemeproje
handles.output = hObject;
axes(handles.axes1); %axes1 de bir olay olacak
imshow('C:\Users\MERYEM\OneDrive\Masaüstü\goruntuislemeProje\etuAmblemi.jpg'); %olay:resim ekleme

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes goruntuislemeproje wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = goruntuislemeproje_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)

username = get(handles.edit5, 'String');
password = get(handles.edit6, 'String');


if strcmp(username, 'a') && strcmp(password, 'a')
    run('goruntuZenginlestirme.m');
    close('goruntuislemeproje');

else  
       % Giriş başarısız
       set(handles.edit5, 'String', 'Kullanıcı adı veya şifre yanlış');
       set(handles.edit6, 'String', 'Kullanıcı adı veya şifre yanlış');
end







% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object deletion, before destroying properties.
function axes1_DeleteFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
username = get(handles.edit5, 'String');
password = get(handles.edit6, 'String');


if strcmp(username, 'a') && strcmp(password, 'a')
    run('goruntuNetlestirme.m');
    close('goruntuislemeproje');

else  
       % Giriş başarısız
       set(handles.edit5, 'String', 'Kullanıcı adı veya şifre yanlış');
       set(handles.edit6, 'String', 'Kullanıcı adı veya şifre yanlış');
end
