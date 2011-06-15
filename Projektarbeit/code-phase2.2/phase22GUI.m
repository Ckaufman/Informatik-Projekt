function varargout = phase22GUI(varargin)
% PHASE22GUI M-file for phase22GUI.fig
%      PHASE22GUI, by itself, creates a new PHASE22GUI or raises the existing
%      singleton*.
%
%      H = PHASE22GUI returns the handle to a new PHASE22GUI or the handle to
%      the existing singleton*.
%
%      PHASE22GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PHASE22GUI.M with the given input arguments.
%
%      PHASE22GUI('Property','Value',...) creates a new PHASE22GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before phase22GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to phase22GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help phase22GUI

% Last Modified by GUIDE v2.5 13-Jun-2011 13:43:23

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @phase22GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @phase22GUI_OutputFcn, ...
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

% --- Executes just before phase22GUI is made visible.
function phase22GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to phase22GUI (see VARARGIN)

% Choose default command line output for phase22GUI
handles.output = hObject;

% Update handles structure
% Startwerte Setzen
guidata(hObject, handles);
global m n a func
a=zeros(m,m);
m=4;    % Auflösung der Stützstellen in einer Dimension
n=20;   % Auflösung der Funktionswerte von g(x,y) in einer Dimension
func=1;  % vorauswahl einer Funktion von g(x,y)

% This sets up the initial plot - only do when we are invisible
% so window can get raised using phase22GUI.
if strcmp(get(hObject,'Visible'),'off')
    plot(zeros(5,5));
end

% UIWAIT makes phase22GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = phase22GUI_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
global func;
cla;

% Funktion für g(x,y) auswählen
popup_sel_index = get(handles.popupmenu1, 'Value');
switch popup_sel_index
    case 1
        func=1;
    case 2
        func=2;
    case 3
        func=3;
    case 4
        func=4;
    case 5
        func=5;
end

% g(x,y) plotten
plotterG();



%% Menu des GUI
% --------------------------------------------------------------------
function FileMenu_Callback(hObject, eventdata, handles)
% hObject    handle to FileMenu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --------------------------------------------------------------------
function OpenMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to OpenMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
file = uigetfile('*.fig');
if ~isequal(file, 0)
    open(file);
end

% --------------------------------------------------------------------
function PrintMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to PrintMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
printdlg(handles.figure1)

% --------------------------------------------------------------------
function CloseMenuItem_Callback(hObject, eventdata, handles)
% hObject    handle to CloseMenuItem (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
selection = questdlg(['Close ' get(handles.figure1,'Name') '?'],...
                     ['Close ' get(handles.figure1,'Name') '...'],...
                     'Yes','No','Yes');
if strcmp(selection,'No')
    return;
end

delete(handles.figure1)



%% Auswahl der Funktion g(x,y)
% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = get(hObject,'String') returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1


% --- Executes during object creation, after setting all properties.
function popupmenu1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
     set(hObject,'BackgroundColor','white');
end

set(hObject, 'String', {'Hill', 'Plane', 'Wave', 'Corner', 'Hurdle'});

%% Einstellen der Auflösung von g(x,y) = n und Anzahl Stützstellen von 
%% f(x,y) = m x m
% --- Executes on slider movement.
function nSlider_Callback(hObject, eventdata, handles)
% hObject    handle to nSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global n 
v=get(handles.nSlider,'Value');
n=floor(v*100+20);
set(handles.nValue,'String',num2str(n));

% --- Executes during object creation, after setting all properties.
function nSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function slider2_Callback(hObject, eventdata, handles)
% hObject    handle to nSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on slider movement.
function mSlider_Callback(hObject, eventdata, handles)
% hObject    handle to mSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
global m 
v=get(handles.mSlider,'Value');
m=floor(v*20+4);
set(handles.mValue,'String',num2str(m));


% --- Executes during object creation, after setting all properties.
function mSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function nValue_Callback(hObject, eventdata, handles)
% hObject    handle to nValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of nValue as text
%        str2double(get(hObject,'String')) returns contents of nValue as a double


% --- Executes during object creation, after setting all properties.
function nValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to nValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function mValue_Callback(hObject, eventdata, handles)
% hObject    handle to mValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of mValue as text
%        str2double(get(hObject,'String')) returns contents of mValue as a double


% --- Executes during object creation, after setting all properties.
function mValue_CreateFcn(hObject, eventdata, handles)
% hObject    handle to mValue (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% Suche optimale Stützstellen und stelle sie dar
% --- Executes on button press in butPlot.
function butPlot_Callback(hObject, eventdata, handles)
% hObject    handle to butPlot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Alle Stützstellen in a optimieren
global m n a func;
%%% optimale a-Matrix suchen
% a mit 4x4
a= ones(m,m);
fn=zeros(m,1);
J=zeros(m^2,m^2);
h=0.1;

% Zeilenweise fn und Jacobi bestimmen
% fn
% fn, 1. Zeile mit Spaltenvektor mxm=16 
% FN=fn1 + fn2 + fn3 + fn4 (4x16)
disp('fn(i)');
pos=0;
for x=1:m
    for y=1:m
        [x y]; % 1 -m  ; 1 -m
         select=[x;y];  
         fn(y+pos)= dsq(a,select,h,n,func);
    end
    pos=pos+m;
end
fn

%  J = j1 + j2 +j3 +j4 (4x16)
% x,y Position der Jakobi Matrix, welche m^2 x m^2 = 16x16  ist
for i=1:m*m
    selectfn=[  ceil(i/m),i-( ceil(i/m)-1)*m,]; % Index i von m x m Matrix auf m^2 Vektor umrechnen
	for j= 1:m*m
       selecta =[  ceil(j/m),j-( ceil(j/m)-1)*m,]; % x,y; % Index j von m x m Matrix auf m^2 Vektor umrechnen
       aneu=a;
       aneu( selecta(1),selecta(2) )=aneu( selecta(1),selecta(2) )+h;
       J(i,j)= (dsq(aneu,[selectfn(1),selectfn(2)],h,n,func) - dsq(a,[selectfn(1),selectfn(2)],h,n,func))/h;       
    end
end
J
% Für Optimierungsschritt Felder in richtige Form bringen
% a  = m x 1 SpaltenVektor nicht mehr m x m Matrix => a1
% fn = m x 1 SpaltenVektor
% J  = m^2 x m^2 Matrix
a1=a(:); % a  = m x 1 SpaltenVektor nicht mehr m x m Matrix => a1
a=reshape(a1-J\fn,m,m);

plotter();



%% Plotfunktion für f(x,y) und g(x,y)
function plotter(handles)
global m n a func;
gcf;
cla;

% f(x,y) aus a auf Koordinatenbereich wie g(x,y) anpassen
tmp=0:n/(m-1):n;
Xa=tmp;
Ya=tmp';
for i=1:n/(m-1):n
    Xa=[Xa;tmp];
    Ya=[Ya tmp'];
end

% g(x,y) plotten
plotterG();

% f(x,y) plotten
hold on;
zweiter=surface(Xa,Ya,a);
alpha(zweiter,0.8);

[az,ev]=view;
if [az,ev] == [0,0]
    view(45,30);
end
grid on;

% Plotfunktion für g(x,y)
function plotterG(handles)
global m n a func;
gcf;
cla;

% G=g(x,y) als Matrix
for x=0:n
    for y=0:n
        G(x+1,y+1)=g(x,y,n,func);
    end
end

% G = g(x,y) plotten
tmp=0:n;
XG=tmp;
YG=tmp';
for i=1:n
    XG=[XG; tmp];
    YG=[YG  tmp'];
end
axis([-5 n+5 -5 n+5 1.2*min(min(G)) 1.2*max(max(G))]);
erster=surface(XG,YG,G);
alpha(erster,0.4);
