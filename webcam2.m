function varargout = webcam2(varargin)
% WEBCAM2 MATLAB code for webcam2.fig
%      WEBCAM2, by itself, creates a new WEBCAM2 or raises the existing
%      singleton*.
%
%      H = WEBCAM2 returns the handle to a new WEBCAM2 or the handle to
%      the existing singleton*.
%
%      WEBCAM2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WEBCAM2.M with the given input arguments.
%
%      WEBCAM2('Property','Value',...) creates a new WEBCAM2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before webcam2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to webcam2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help webcam2

% Last Modified by GUIDE v2.5 05-Jun-2015 21:38:13

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @webcam2_OpeningFcn, ...
                   'gui_OutputFcn',  @webcam2_OutputFcn, ...
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


% --- Executes just before webcam2 is made visible.
function webcam2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to webcam2 (see VARARGIN)

% Choose default command line output for webcam2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes webcam2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

vid1 = videoinput('winvideo', 2, 'YUY2_640x480');
vid2 = videoinput('winvideo', 1, 'YUY2_640x480');
vid1.ReturnedColorspace= 'rgb';
vid2.ReturnedColorspace= 'rgb';

vidRes1 = get(vid1, 'VideoResolution');
vidRes2 = get(vid2, 'VideoResolution');
nBands1 = get(vid1, 'NumberOfBands');
nBands2 = get(vid2, 'NumberOfBands');
himage1 = image(zeros(vidRes1(2),vidRes1(1), nBands1));
himage2 = image(zeros(vidRes2(2),vidRes2(1), nBands2));

handles.vid1 = vid1;
handles.vid2 = vid2;
handles.himage1 = himage1;
handles.himage2 = himage2;

guidata(hObject, handles);



% --- Outputs from this function are returned to the command line.
function varargout = webcam2_OutputFcn(hObject, eventdata, handles) 
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