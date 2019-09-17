function varargout = quiz3(varargin)
% QUIZ3 MATLAB code for quiz3.fig
%      QUIZ3, by itself, creates a new QUIZ3 or raises the existing
%      singleton*.
%
%      H = QUIZ3 returns the handle to a new QUIZ3 or the handle to
%      the existing singleton*.
%
%      QUIZ3('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in QUIZ3.M with the given input arguments.
%
%      QUIZ3('Property','Value',...) creates a new QUIZ3 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before quiz3_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to quiz3_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help quiz3

% Last Modified by GUIDE v2.5 16-May-2015 00:34:36

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @quiz3_OpeningFcn, ...
                   'gui_OutputFcn',  @quiz3_OutputFcn, ...
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


% --- Executes just before quiz3 is made visible.
function quiz3_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to quiz3 (see VARARGIN)

handles.data=0:0.1:4*pi

% Choose default command line output for quiz3
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes quiz3 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = quiz3_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in sin.
function sin_Callback(hObject, eventdata, handles)
% hObject    handle to sin (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Y=sin(handles.data); plot(handles.data,Y);

% --- Executes on button press in cos.
function cos_Callback(hObject, eventdata, handles)
% hObject    handle to cos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Y=cos(handles.data); plot(handles.data,Y);

% --- Executes on button press in tan.
function tan_Callback(hObject, eventdata, handles)
% hObject    handle to tan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Y=tan(handles.data); plot(handles.data,Y);