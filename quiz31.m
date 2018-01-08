function varargout = quiz31(varargin)
% QUIZ31 MATLAB code for quiz31.fig
%      QUIZ31, by itself, creates a new QUIZ31 or raises the existing
%      singleton*.
%
%      H = QUIZ31 returns the handle to a new QUIZ31 or the handle to
%      the existing singleton*.
%
%      QUIZ31('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in QUIZ31.M with the given input arguments.
%
%      QUIZ31('Property','Value',...) creates a new QUIZ31 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before quiz31_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to quiz31_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help quiz31

% Last Modified by GUIDE v2.5 17-May-2015 21:54:00

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @quiz31_OpeningFcn, ...
                   'gui_OutputFcn',  @quiz31_OutputFcn, ...
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


% --- Executes just before quiz31 is made visible.
function quiz31_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to quiz31 (see VARARGIN)

% Choose default command line output for quiz31
handles.output = hObject;
handles.data = 0:0.1:4*pi;
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes quiz31 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = quiz31_OutputFcn(hObject, eventdata, handles) 
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
Y= sin(handles.data);plot(handles.data,Y);

% --- Executes on button press in cos.
function cos_Callback(hObject, eventdata, handles)
% hObject    handle to cos (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Y= cos(handles.data);plot(handles.data,Y);

% --- Executes on button press in tan.
function tan_Callback(hObject, eventdata, handles)
% hObject    handle to tan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
Y= tan(handles.data);plot(handles.data,Y);