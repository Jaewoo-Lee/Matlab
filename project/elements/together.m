function varargout = together(varargin)
% TOGETHER MATLAB code for together.fig
%      TOGETHER, by itself, creates a new TOGETHER or raises the existing
%      singleton*.
%
%      H = TOGETHER returns the handle to a new TOGETHER or the handle to
%      the existing singleton*.
%
%      TOGETHER('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TOGETHER.M with the given input arguments.
%
%      TOGETHER('Property','Value',...) creates a new TOGETHER or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before together_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to together_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help together

% Last Modified by GUIDE v2.5 05-Jun-2015 21:55:47

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @together_OpeningFcn, ...
                   'gui_OutputFcn',  @together_OutputFcn, ...
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


% --- Executes just before together is made visible.
function together_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to together (see VARARGIN)

% Choose default command line output for together
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes together wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = together_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
preview(handles.vid1, handles.himage1);

preview(handles.vid2, handles.himage2);

% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stoppreview(handles.vid1);
stoppreview(handles.vid2);