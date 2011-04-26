function varargout = phase2gui(varargin)
% PHASE2GUI M-file for phase2gui.fig
%      PHASE2GUI, by itself, creates a new PHASE2GUI or raises the existing
%      singleton*.
%
%      H = PHASE2GUI returns the handle to a new PHASE2GUI or the handle to
%      the existing singleton*.
%
%      PHASE2GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PHASE2GUI.M with the given input arguments.
%
%      PHASE2GUI('Property','Value',...) creates a new PHASE2GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before phase2gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to phase2gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help phase2gui

% Last Modified by GUIDE v2.5 17-Apr-2011 09:05:35

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @phase2gui_OpeningFcn, ...
                   'gui_OutputFcn',  @phase2gui_OutputFcn, ...
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
global f1 f2 max n
max=360
n=5

% End initialization code - DO NOT EDIT


% --- Executes just before phase2gui is made visible.
function phase2gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to phase2gui (see VARARGIN)

% Choose default command line output for phase2gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes phase2gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = phase2gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in keyboard1.
function keyboard1_Callback(hObject, eventdata, handles)
% hObject    handle to keyboard1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
keyboard


% --- Executes on button press in plot1.
function plot1_Callback(hObject, eventdata, handles)
% hObject    handle to plot1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global f1 f2 max n
if get(handles.radiobutton1,'Value')==1
    w=0:360;
    f1=sind(w)+2;
end
if get(handles.radiobutton2,'Value')==2
end
if get(handles.radiobutton3,'Value')==3
end
% Stützstellen
f2=[]
max
n
for i=0:(max/n):max
    
    w=[i 2.2]';
    f2=[f2 w];
end

% plotit
gcf
plot(f1,'b')
hold on
% doplot(f2pos,f2)
f2
lne=[]
for i=1:6
    w=[f2(1,i) f2(1,i);0 f2(2,i)]
    plot(w(1,:),w(2,:),'r')
    lne=[lne f2(2,i)]
end
plot(lne,'r')
% --- Executes on button press in clear1.
function clear1_Callback(hObject, eventdata, handles)
% hObject    handle to clear1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
