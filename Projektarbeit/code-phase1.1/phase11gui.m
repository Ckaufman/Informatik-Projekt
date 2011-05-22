function varargout = phase11gui(varargin)
% PHASE11GUI MATLAB code for phase11gui.fig
%      PHASE11GUI, by itself, creates a new PHASE11GUI or raises the existing
%      singleton*.
%
%      H = PHASE11GUI returns the handle to a new PHASE11GUI or the handle to
%      the existing singleton*.
%se
%      PHASE11GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PHASE11GUI.M with the given input arguments.
%
%      PHASE11GUI('Property','Value',...) creates a new PHASE11GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before phase11gui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to phase11gui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help phase11gui

% Last Modified by GUIDE v2.5 22-May-2011 22:54:38

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @phase11gui_OpeningFcn, ...
                   'gui_OutputFcn',  @phase11gui_OutputFcn, ...
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


% --- Executes just before phase11gui is made visible.
function phase11gui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to phase11gui (see VARARGIN)

% Choose default command line output for phase11gui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes phase11gui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = phase11gui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in berghang.
function berghang_Callback(hObject, eventdata, handles)
% hObject    handle to berghang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global values;
values=[];
values=[ 0.8 0.4 1; 1.8 1 1.2; 1.4 1.6 1.8];
plotter()
axis([0.5 3.5 0.5 3.5 0 2])
view(40,20)


% --- Executes on button press in mulde.
function mulde_Callback(hObject, eventdata, handles)
% hObject    handle to mulde (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global values;
values=[];
values=[ 0.8 0.2 0.5; 0.9 0.4 1.0; 1.0 0.9 1.5];

plotter()
axis([0.5 3.5 0.5 3.5 0 2])
view(30,30)

% --- Executes on button press in krone.
function krone_Callback(hObject, eventdata, handles)
% hObject    handle to krone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global values
values=[];
values=[ 1 .5 1.5; .5 1.5 .5; 1.5 .5 1];

plotter()
axis([0.5 3.5 0.5 3.5 0 2])
view(30,30)


%%%%% Functions to plot

% clears current figure
function clearcf()
gcf;
cla;

% plot data from values into current figure
function plotter()
gcf;
clearcf();

grid on;
axis equal;
xlabel('x-axis');
ylabel('y-axis');
hold on
global x y values
xmax=size(values,2);
ymax=size(values,1);

% plot1
for x=1:xmax
    for y=1:ymax
        stuetz=[x, x; y, y; 0, values(y,x)];
        plot3(stuetz(1,:),stuetz(2,:),stuetz(3,:),'LineWidth',2);
    end
end

%%%%% Funtions to change titleChange

% --- Executes on button press in navup.
function navup_Callback(hObject, eventdata, handles)
% hObject    handle to navup (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
elev = get(handles.axes1,'View');
view(elev(1),elev(2)+3)

% --- Executes on button press in navdown.
function navdown_Callback(hObject, eventdata, handles)
% hObject    handle to navdown (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
elev = get(handles.axes1,'View');
view(elev(1),elev(2)-3)

% --- Executes on button press in navleft.
function navleft_Callback(hObject, eventdata, handles)
% hObject    handle to navleft (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
elev = get(handles.axes1,'View');
view(elev(1)+3,elev(2))

% --- Executes on button press in navright.
function navright_Callback(hObject, eventdata, handles)
% hObject    handle to navright (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
elev = get(handles.axes1,'View');
view(elev(1)-3,elev(2))


% --- Executes on button press in clear1.
function clear1_Callback(hObject, eventdata, handles)
% hObject    handle to clear1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
gca;
cla;

% --- Executes on button press in fullInterpol.
function fullInterpol_Callback(hObject, eventdata, handles)
% hObject    handle to fullInterpol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x y values
yDim = size(values,1);
xDim = size(values,2);
steps=4;
inter=zeros((yDim-1)*steps+1,(xDim-1)*steps+1);
delta = 1/(steps);

ex=0;
yps=0;
gcf
for x=1:delta:xDim
    ex=ex+1;
    yps=0;
    for y=1:delta:yDim
        yps=yps+1;
       % innere Schleife durchwandert alle geforderten Stützstellen im
       % aktuellen Quadrat
       inter(yps,ex)=getInterpolation([x y],values)  ;
       plot3(x,y,inter(yps,ex),'ro');
    end
end

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
global values selected
switch get(handles.popupmenu1,'Value')   
    case 1
        set(handles.valueEdit,'String',num2str(values(1,1)));
        selected=[1,1];
    case 2
        set(handles.valueEdit,'String',num2str(values(1,2)));
        selected=[1,2];
    case 3
        set(handles.valueEdit,'String',num2str(values(1,3)));
        selected=[1,3];
    case 4
        set(handles.valueEdit,'String',num2str(values(2,1)));
        selected=[2,1];
    case 5
        set(handles.valueEdit,'String',num2str(values(2,2)));
        selected=[2,2];
    case 6
        set(handles.valueEdit,'String',num2str(values(2,3)));
        selected=[2,3];
    case 7
        set(handles.valueEdit,'String',num2str(values(3,1)));
        selected=[3,1];
    case 8
        set(handles.valueEdit,'String',num2str(values(3,2)));
        selected=[3,2];
    case 9
        set(handles.valueEdit,'String',num2str(values(3,3)));
        selected=[3,3];
    otherwise
end

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


% --- Executes on button press in okButton.
function okButton_Callback(hObject, eventdata, handles)
% hObject    handle to okButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global values selected
values(selected(1),selected(2))=str2num(get(handles.valueEdit,'String'))
plotter()


function valueEdit_Callback(hObject, eventdata, handles)
% hObject    handle to valueEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% 
% Hints: get(hObject,'String') returns contents of valueEdit as text
%        str2double(get(hObject,'String')) returns contents of valueEdit as a double


% --- Executes during object creation, after setting all properties.
function valueEdit_CreateFcn(hObject, eventdata, handles)
% hObject    handle to valueEdit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% %%%%% obsolete Functions %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %%%%%                    %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 
% function edit4_Callback(hObject, eventdata, handles)
% % hObject    handle to edit4 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of edit4 as text
% %        str2double(get(hObject,'String')) returns contents of edit4 as a double
% 
% 
% % --- Executes during object creation, after setting all properties.
% function edit4_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to edit4 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end



% --- Executes on button press in buttonSetx.
% function buttonSetx_Callback(hObject, eventdata, handles)
% % ---- löschen ----
% % hObject    handle to buttonSetx (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% prompt={'Enter an integer (x):'};
% name='Input for x value';
% numlines=1;
% defaultanswer={'4.4'};
% answer=inputdlg(prompt, name,numlines,defaultanswer);
% output=str2num(answer{1});
% sprintf('%d',output)
% 
% %msgbox(['answer is ',num2str(output)])
% %set(handles.xdisplay,'String',6);
% set(handles.xdisplay,'String',num2str(output));
% global x y
% x=output;
% 
% 
% 
% % --- Executes on button press in buttonSety.
% function buttonSety_Callback(hObject, eventdata, handles)
% % ------ löschen -------
% % hObject    handle to buttonSety (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% prompt={'Enter an integer (y):'};
% name='Input for y value';
% numlines=1;
% defaultanswer={'2.6'};
% answer=inputdlg(prompt, name,numlines,defaultanswer);
% output=str2num(answer{1});
% sprintf('%d',output)
% 
% %msgbox(['answer is ',num2str(output)])
% set(handles.ydisplay,'String',num2str(output));
% global x y
% y=output;
% 
% % --- Executes during object creation, after setting all properties.
% function zoomSlider_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to zoomSlider (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: slider controls usually have a light gray background.
% if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor',[.9 .9 .9]);
% end
% gcf
% camzoom(get(handles.zoomSlider,'Value'))

% --- Executes on button press in plot1.
% function plot1_Callback(hObject, eventdata, handles)
% % hObject    handle to plot1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% gcf
% titleChange (45,30);
% grid on;
% axis equal;
% xlabel('x-axis');
% ylabel('y-axis');
% 
% 
% global x y values
% 
% %set(handles.xdisplay,'String',x)
% %set(handles.ydisplay,'String',y)
% %keyboard
% clearflag=0;
% xmax=size(values,2);
% ymax=size(values,1);
% 
% %how handle existing figure?
% if clearflag==1
%     clf
% end
% if clearflag==0
%     hold on
% end

% % plot1
% for x=1:xmax
%     for y=1:ymax
%         stuetz=[x, x; y, y; 0, values(y,x)];
%         plot3(stuetz(1,:),stuetz(2,:),stuetz(3,:),'LineWidth',2)
%     end
% end


%%%% x und y display

% function ydisplay_Callback(hObject, eventdata, handles)
% % hObject    handle to ydisplay (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of ydisplay as text
% %        str2double(get(hObject,'String')) returns contents of ydisplay as a double
% global y
% 
% y=str2num(get(hObject,'String'))
% if (y-floor(y)<0.1)
%     y=y+0.5;
%     set(hObject,'String',num2str(y));
% end
% if y > 9.9 
%      y=9.9;     
%     set(hObject,'String',num2str(y))
% elseif y< 0.1
%     y=0.1;     
%     set(hObject,'String',num2str(y))
% end
% 
% 
% 
% 
% 
% % --- Executes during object creation, after setting all properties.
% function ydisplay_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to ydisplay (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end
% 
% 
% 
% function xdisplay_Callback(hObject, eventdata, handles)
% % hObject    handle to xdisplay (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% 
% % Hints: get(hObject,'String') returns contents of xdisplay as text
% %        str2double(get(hObject,'String')) returns contents of xdisplay as a double
% global x
% x=str2num(get(hObject,'String'));
% if (x-floor(x)<0.1)
%     x=x+0.5;
%     set(hObject,'String',num2str(x));
% end
% 
% if x > 9.9
%     x=9.9;
%     set(hObject,'String',num2str(x))
% elseif x < 0.1
%     x=0.1
%     set(hObject,'String',num2str(x))
% end
% 
% % --- Executes during object creation, after setting all properties.
% function xdisplay_CreateFcn(hObject, eventdata, handles)
% % hObject    handle to xdisplay (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    empty - handles not created until after all CreateFcns called
% 
% % Hint: edit controls usually have a white background on Windows.
% %       See ISPC and COMPUTER.
% if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
%     set(hObject,'BackgroundColor','white');
% end


% % --- Executes on button press in plusy.
% function plusy_Callback(hObject, eventdata, handles)
% % hObject    handle to plusy (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% global y
% y= y+1;
% set(handles.ydisplay,'String',y)
% 
% % --- Executes on button press in minusy.
% function minusy_Callback(hObject, eventdata, handles)
% % hObject    handle to minusy (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% global y;
% y=y-1;
% set(handles.ydisplay,'String',y);
% 
% % --- Executes on button press in minusx.
% function minusx_Callback(hObject, eventdata, handles)
% % hObject    handle to minusx (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% w=10
% global x
% x=x-1;
% set(handles.xdisplay,'String',x);
% x
% 
% % --- Executes on button press in plusx.
% function plusx_Callback(hObject, eventdata, handles)
% % hObject    handle to plusx (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% global x;
% x=x+1;
% set(handles.xdisplay,'String',x);


% % --- Executes on button press in interpolate1.
% function interpolate1_Callback(hObject, eventdata, handles)
% % hObject    handle to interpolate1 (see GCBO)
% % eventdata  reserved - to be defined in a future version of MATLAB
% % handles    structure with handles and user data (see GUIDATA)
% global x y values
% 
% u=[x y];
% xlow= floor(u(1));
% ylow= floor(u(2));
% xhigh= ceil(u(1));
% yhigh= ceil(u(2));
% Q=[xlow ylow values(ylow,xlow); 
%     xhigh ylow values(ylow, xhigh); 
%     xlow yhigh values(yhigh, xlow);
%     xhigh yhigh values(yhigh, xhigh)]
% h = interpolate(Q,u)
% x=h(1);
% y=h(2);
% h=h(3);
% %plot1 red line
% gcf
% line([x x],[y y],[0 h],'Color','r','LineWidth',4)
