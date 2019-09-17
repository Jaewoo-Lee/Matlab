function varargout = SERVO(varargin)
% SERVO M-file for SERVO.fig
%      SERVO, by itself, creates a new SERVO or raises the existing
%      singleton*.
%
%      H = SERVO returns the handle to a new SERVO or the handle to
%      the existing singleton*.
%
%      SERVO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in SERVO.M with the given input arguments.
%
%      SERVO('Property','Value',...) creates a new SERVO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before SERVO_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to SERVO_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help SERVO

% Last Modified by GUIDE v2.5 21-Dec-2012 16:45:34

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @SERVO_OpeningFcn, ...
                   'gui_OutputFcn',  @SERVO_OutputFcn, ...
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


% --- Executes just before SERVO is made visible.
function SERVO_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to SERVO (see VARARGIN)

% Choose default command line output for SERVO
handles.output = hObject;
set(handles.axes1,'hittest','off');
set(handles.axes2,'hittest','off');
% Update handles structure


% UIWAIT makes SERVO wait for user response (see UIRESUME)
% uiwait(handles.figure1);
clear a;
global a;
a = arduino('COM4');
a.servoAttach(9);
int pos;
pos = 90;
a.servoWrite(9,pos);
set(handles.text1,'string',pos);
axes(handles.axes1); UP = imagesc(imread('UP.jpg'));
set(gca, 'XTick',[]);
set(gca, 'YTick',[]);
set(gca, 'XColor','w');
set(gca, 'YColor','w');
axes(handles.axes2); DOWN = imagesc(imread('DOWN.jpg'));
set(gca, 'XTick',[]);
set(gca, 'YTick',[]);
set(gca, 'XColor','w');
set(gca, 'YColor','w');
set(handles.axes1,'hittest','off');
set(UP,'hittest','off');
set(handles.axes2,'hittest','off');
set(DOWN,'hittest','off');


guidata(hObject, handles);
% --- Outputs from this function are returned to the command line.
function varargout = SERVO_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;

% --- Executes on mouse press over figure background.
function figure1_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global a;
handles.xy1 = round(get(handles.axes1,'Currentpoint'));
x1 = handles.xy1(1,1);
y1 = handles.xy1(1,2);
n = str2num(get(handles.text1,'string'));
b = 1;
set(handles.text2,'string',b);
while(y1>=9 && y1<693 && x1>=10 && x1<700 && n<=179 && b==1)
    n = n+1;
    set(handles.text1,'string',n);
    a.servoWrite(9,n);
    b = str2num(get(handles.text2,'string'));
    pause(0.01);
end
while(y1>=9 && y1<693 && x1>=745 && x1<1430 && n>=1 && b==1)
    n = n-1;
    set(handles.text1,'string',n);
    a.servoWrite(9,n);
    b = str2num(get(handles.text2,'string'));
    pause(0.01);
end

% --- Executes on mouse press over figure background, over a disabled or
% --- inactive control, or over an axes background.
function figure1_WindowButtonUpFcn(hObject, eventdata, handles)
% hObject    handle to figure1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
b = 0;
set(handles.text2,'string',b);


