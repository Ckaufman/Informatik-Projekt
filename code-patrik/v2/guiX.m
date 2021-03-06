function varargout = guiX(varargin)
% GUIX MATLAB code for guiX.fig
%      GUIX, by itself, creates a new GUIX or raises the existing
%      singleton*.
%
%      H = GUIX returns the handle to a new GUIX or the handle to
%      the existing singleton*.
%
%      GUIX('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIX.M with the given input arguments.
%
%      GUIX('Property','Value',...) creates a new GUIX or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guiX_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guiX_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guiX

% Last Modified by GUIDE v2.5 16-Apr-2011 20:54:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guiX_OpeningFcn, ...
                   'gui_OutputFcn',  @guiX_OutputFcn, ...
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
global x y values

% End initialization code - DO NOT EDIT


% --- Executes just before guiX is made visible.
function guiX_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guiX (see VARARGIN)

% Choose default command line output for guiX
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes guiX wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guiX_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in ball.
function ball_Callback(hObject, eventdata, handles)
% hObject    handle to ball (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global values;
values=[]

for i=1:5
    values=[values; sin(0.05:((pi-.1)/9):(pi-.05))*sin(i*pi/20)];
    %plot1(sin(0.05:((pi-.1)/9):(pi-.05))*sin(i*pi/20));
    i;
end
for i=4:-1:0
    values=[values; sin(0.05:((pi-.1)/9):(pi-.05))*sin(i*pi/20)];
    i;
end
values=values.*6;



% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global values;
values=[]
y=[0 3 9 14 7 5 12  5 2 0.1]*0.5
for i=1:10
   values= [values; y]
end
size(values)
% --- Executes on button press in lineardata.
function lineardata_Callback(hObject, eventdata, handles)
% hObject    handle to lineardata (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global values
values=[]
v=1
for i=1:10
    for j=1:10
    values(i,j)=v;
    v=v+.1;
    end
end

% --- Executes on button press in plot1.
function plot1_Callback(hObject, eventdata, handles)
% hObject    handle to plot1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gcf
view (30,12);
grid on;
xlabel('x-axis');
ylabel('y-axis');

global x y values

% set(handles.xdisplay,'String',x)
% set(handles.ydisplay,'String',y)
%keyboard
clearflag=0;
xmax=size(values,2)
ymax=size(values,1)

%how handle existing figure?
if clearflag==1
    clf
end
if clearflag==0
    hold on
end

% plot1
for x=1:xmax
    for y=1:ymax
        stuetz=[x, x; y, y; 0, values(y,x)]
        plot3(stuetz(1,:),stuetz(2,:),stuetz(3,:),'LineWidth',2)
    end
end
axis equal;




% --- Executes on button press in plusy.
function plusy_Callback(hObject, eventdata, handles)
% hObject    handle to plusy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y
y= y+1
set(handles.ydisplay,'String',y)

% --- Executes on button press in minusy.
function minusy_Callback(hObject, eventdata, handles)
% hObject    handle to minusy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y;
y=y-1;
set(handles.ydisplay,'String',y);

% --- Executes on button press in minusx.
function minusx_Callback(hObject, eventdata, handles)
% hObject    handle to minusx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
w=10
global x
x=x-1;
set(handles.xdisplay,'String',x);
x

% --- Executes on button press in plusx.
function plusx_Callback(hObject, eventdata, handles)
% hObject    handle to plusx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x;
x=x+1;
set(handles.xdisplay,'String',x);


function ydisplay_Callback(hObject, eventdata, handles)
% hObject    handle to ydisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ydisplay as text
%        str2double(get(hObject,'String')) returns contents of ydisplay as a double


% --- Executes during object creation, after setting all properties.
function ydisplay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ydisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xdisplay_Callback(hObject, eventdata, handles)
% hObject    handle to xdisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of xdisplay as text
%        str2double(get(hObject,'String')) returns contents of xdisplay as a double
Global x
% set(handles.xdisplay,'String',x)
% set(handles.xdisplay,'String',x)

% --- Executes during object creation, after setting all properties.
function xdisplay_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xdisplay (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in navup.
function navup_Callback(hObject, eventdata, handles)
% hObject    handle to navup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
elev = get(handles.axes1,'View')
view(elev(1),elev(2)+3)

% --- Executes on button press in navdown.
function navdown_Callback(hObject, eventdata, handles)
% hObject    handle to navdown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
elev = get(handles.axes1,'View')
view(elev(1),elev(2)-3)

% --- Executes on button press in navleft.
function navleft_Callback(hObject, eventdata, handles)
% hObject    handle to navleft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
elev = get(handles.axes1,'View')
view(elev(1)-3,elev(2))

% --- Executes on button press in navright.
function navright_Callback(hObject, eventdata, handles)
% hObject    handle to navright (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
elev = get(handles.axes1,'View')
view(elev(1)+3,elev(2))

% --- Executes on button press in buttonSetx.
function buttonSetx_Callback(hObject, eventdata, handles)
% hObject    handle to buttonSetx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt={'Enter an integer (x):'};
name='Input for x value';
numlines=1;
defaultanswer={'4.4'};
answer=inputdlg(prompt, name,numlines,defaultanswer);
output=str2num(answer{1});
sprintf('%d',output)

%msgbox(['answer is ',num2str(output)])
set(handles.xdisplay,'String',num2str(output));
global x y
x=output;



% --- Executes on button press in buttonSety.
function buttonSety_Callback(hObject, eventdata, handles)
% hObject    handle to buttonSety (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
prompt={'Enter an integer (y):'};
name='Input for y value';
numlines=1;
defaultanswer={'2.6'};
answer=inputdlg(prompt, name,numlines,defaultanswer);
output=str2num(answer{1});
sprintf('%d',output)

%msgbox(['answer is ',num2str(output)])
set(handles.ydisplay,'String',num2str(output));
global x y
y=output;





% --- Executes during object creation, after setting all properties.
function zoomSlider_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zoomSlider (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
gcf
camzoom(get(handles.zoomSlider,'Value'))


% --- Executes on button press in interpolate1.
function interpolate1_Callback(hObject, eventdata, handles)
% hObject    handle to interpolate1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x y values
u=[x y];
xlow= floor(u(1));
ylow= floor(u(2));
xhigh= ceil(u(1));
yhigh= ceil(u(2));
Q=[xlow ylow values(ylow,xlow); 
    xhigh ylow values(ylow, xhigh); 
    xlow yhigh values(yhigh, xlow);
    xhigh yhigh values(yhigh, xhigh)]
h = interpolate(Q,u)
x=h(1);
y=h(2);
h=h(3);
%plot1 red line
gcf
line([x x],[y y],[0 h],'Color','r','LineWidth',4)


% --- Executes on button press in keyboard1.
function keyboard1_Callback(hObject, eventdata, handles)
% hObject    handle to keyboard1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
keyboard


% --- Executes on button press in clear1.
function clear1_Callback(hObject, eventdata, handles)
% hObject    handle to clear1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gca
cla
