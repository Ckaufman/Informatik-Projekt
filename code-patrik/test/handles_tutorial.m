function varargout = handles_tutorial(varargin)
% HANDLES_TUTORIAL M-file for handles_tutorial.fig
%      HANDLES_TUTORIAL, by itself, creates a new HANDLES_TUTORIAL or raises the existing
%      singleton*.
%
%      H = HANDLES_TUTORIAL returns the handle to a new HANDLES_TUTORIAL or the handle to
%      the existing singleton*.
%
%      HANDLES_TUTORIAL('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in HANDLES_TUTORIAL.M with the given input arguments.
%
%      HANDLES_TUTORIAL('Property','Value',...) creates a new HANDLES_TUTORIAL or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before handles_tutorial_OpeningFunction gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to handles_tutorial_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help handles_tutorial

% Last Modified by GUIDE v2.5 05-Nov-2007 09:07:02

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @handles_tutorial_OpeningFcn, ...
                   'gui_OutputFcn',  @handles_tutorial_OutputFcn, ...
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


% --- Executes just before handles_tutorial is made visible.
function handles_tutorial_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to handles_tutorial (see VARARGIN)

% Choose default command line output for handles_tutorial
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes handles_tutorial wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = handles_tutorial_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


function pushbutton1_Callback(hObject, eventdata, handles)
keyboard

function radiobutton1_Callback(hObject, eventdata, handles)
