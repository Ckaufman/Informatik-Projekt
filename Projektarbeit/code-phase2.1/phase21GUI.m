function varargout = phase21GUI(varargin)
% PHASE21GUI M-file for phase21GUI.fig
%      PHASE21GUI, by itself, creates a new PHASE21GUI or raises the existing
%      singleton*.
%
%      H = PHASE21GUI returns the handle to a new PHASE21GUI or the handle to
%      the existing singleton*.
%
%      PHASE21GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PHASE21GUI.M with the given input arguments.
%
%      PHASE21GUI('Property','Value',...) creates a new PHASE21GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before phase21GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to phase21GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help phase21GUI

% Last Modified by GUIDE v2.5 13-May-2011 00:18:52

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @phase21GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @phase21GUI_OutputFcn, ...
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
global n g a 
% disp('called at every click')
n=101;

if isnan(a) 
    disp('first time only');
    a=[ 1 2 3 4 5 ];
    g=0:100;
end
if size(a,2) < 5
    a=[ 1 2 3 4 5 ];
end

% --- Executes just before phase21GUI is made visible.
function phase21GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to phase21GUI (see VARARGIN)

% Choose default command line output for phase21GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global a g n
a=[20 30 40 50 60]';
g=0:100;
n=101;
set(handles.a1slider,'Value',0.20);
set(handles.a2slider,'Value',0.30);
set(handles.a3slider,'Value',0.40);
set(handles.a4slider,'Value',0.50);
set(handles.a5slider,'Value',0.60);
set(handles.a1value,'String',num2str(a(1)));
set(handles.a2value,'String',num2str(a(2)));
set(handles.a3value,'String',num2str(a(3)));
set(handles.a4value,'String',num2str(a(4)));
set(handles.a5value,'String',num2str(a(5)));
set(handles.sumSquareDisp,'String','zero');

% UIWAIT makes phase21GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = phase21GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in butSinus.
function butSinus_Callback(hObject, eventdata, handles)
% hObject    handle to butSinus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n g a
w=0:(2*pi/(n-1)):(2*pi);
g=50+40*sin(w);
plotter(handles)
axis([0 100 0 110]);

% --- Executes on button press in butCosinus.
function butCosinus_Callback(hObject, eventdata, handles)
% hObject    handle to butCosinus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n g a
w=0:(2*pi/(n-1)):(2*pi);
g=50+40*cos(w);
plotter(handles)
axis([0 100 0 110]);

% --- Executes on button press in butSin27.
function butSin27_Callback(hObject, eventdata, handles)
% hObject    handle to butSin27 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n g a
w=0:(2*pi/(n-1)):(2*pi);
g=50+40*sin(w+(27/360*2*pi));
plotter(handles)
axis([0 100 0 110]);

% --- Executes on button press in butPolynom.
function butPolynom_Callback(hObject, eventdata, handles)
% hObject    handle to butPolynom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global n g a
w=-4.3:(4.3+3.3)/(n-1):3.3;
g=0.6*((w+4).*(w+2).*(w+1).*(w-1).*(w-3)+87);
plotter(handles)
axis([0 100 -10 110]);

% --- Executes on button press in butAuto.
function butAuto_Callback(hObject, eventdata, handles)
% hObject    handle to butAuto (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global  a g
h=0.1
l=length(g)
eff(a,l)
f(10,a)
%Fda1=( eff([a(1)+h a(2) a(3) a(4) a(5)],l)-eff([a(1)+h a(2) a(3) a(4) a(5)],l) ) /h
%Fda2=( eff([a(1) a(2)+h a(3) a(4) a(5)],l)-eff([a(1) a(2)+h a(3) a(4) a(5)],l) ) /h
%Fda3=( eff([a(1) a(2) a(3)+h a(4) a(5)],l)-eff([a(1) a(2) a(3)+h a(4) a(5)],l) ) /h
%Fda4=( eff([a(1) a(2) a(3) a(4)+h a(5)],l)-eff([a(1) a(2) a(3) a(4)+h a(5)],l) ) /h
%Fda5=( eff([a(1) a(2) a(3) a(4) a(5)+h],l)-eff([a(1) a(2) a(3) a(4) a(5)+h],l) ) /h



% --- Executes on button press in butfx.
function butfx_Callback(hObject, eventdata, handles)
% hObject    handle to butfx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a g
a
eff(a,10)

% --- Executes on slider movement.
function a1slider_Callback(hObject, eventdata, handles)
% hObject    handle to a1slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
pos=get(hObject,'Value');
min=get(hObject,'Min');
max=get(hObject,'Max');
set(handles.a1value,'String',num2str(pos*100));
global a
a(1)=str2num(get(handles.a1value,'String'));
plotter(handles)

% --- Executes during object creation, after setting all properties.
function a1slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a1slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function a2slider_Callback(hObject, eventdata, handles)
% hObject    handle to a2slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
pos=get(hObject,'Value');
min=get(hObject,'Min');
max=get(hObject,'Max');
set(handles.a2value,'String',num2str(pos*100));
global a 
a(2)=str2num(get(handles.a2value,'String'));
plotter(handles)


% --- Executes during object creation, after setting all properties.
function a2slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a2slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function a3slider_Callback(hObject, eventdata, handles)
% hObject    handle to a3slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
pos=get(hObject,'Value');
min=get(hObject,'Min');
max=get(hObject,'Max');
set(handles.a3value,'String',num2str(pos*100));
global a
a(3)=str2num(get(handles.a3value,'String'));
plotter(handles)

% --- Executes during object creation, after setting all properties.
function a3slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a3slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function a4slider_Callback(hObject, eventdata, handles)
% hObject    handle to a4slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
pos=get(hObject,'Value');
min=get(hObject,'Min');
max=get(hObject,'Max');
set(handles.a4value,'String',num2str(pos*100));
global a
a(4)=str2num(get(handles.a4value,'String'));
plotter(handles)

% --- Executes during object creation, after setting all properties.
function a4slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a4slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function a5slider_Callback(hObject, eventdata, handles)
% hObject    handle to a5slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
pos=get(hObject,'Value');
min=get(hObject,'Min');
max=get(hObject,'Max');
set(handles.a5value,'String',num2str(pos*100));
%a=[str2num(get(handles.a1value,'String')) str2num(get(handles.a2value,'String')) str2num(get(handles.a3value,'String')) str2num(get(handles.a4value,'String')) str2num(get(handles.a5value,'String')) ];
global a
a(5)=str2num(get(handles.a5value,'String'));
plotter(handles)

% --- Executes during object creation, after setting all properties.
function a5slider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to a5slider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

%%%%%%%%%%%%%%%%%%% Functions %%%%%%%%%%%%%%%%%%%%
function plotter(handles)
% plot the values
global n g a
gcf;
cla;
plot(0:(n-1),g);
hold on;
grid on;

% plot Position der Stützstellen
pos=0:(n-1)/(5-1):(n-1);
plot(pos,0,'r+');
% disp('g 0')
% length(g)

% plot lineare Verbindung der Stützstellen

for i=1:5
   w= [pos;a];
   plot(w(1,:),w(2,:),'r+-');
end

% update Sum of sumSquareDisp
% disp('sum of Square')
if ~isempty(g)
    %disp('g nich leer!')
    set(handles.sumSquareDisp,'String',num2str(floor(SQ(g,a'))));
  else
    set(handles.sumSquareDisp,'String','leer');
end
