function varargout = webcam1(varargin)
% WEBCAM1 MATLAB code for webcam1.fig
%      WEBCAM1, by itself, creates a new WEBCAM1 or raises the existing
%      singleton*.
%
%      H = WEBCAM1 returns the handle to a new WEBCAM1 or the handle to
%      the existing singleton*.
%
%      WEBCAM1('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in WEBCAM1.M with the given input arguments.
%
%      WEBCAM1('Property','Value',...) creates a new WEBCAM1 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before webcam1_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to webcam1_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help webcam1

% Last Modified by GUIDE v2.5 05-Jun-2015 20:30:22

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @webcam1_OpeningFcn, ...
                   'gui_OutputFcn',  @webcam1_OutputFcn, ...
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


% --- Executes just before webcam1 is made visible.
function webcam1_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to webcam1 (see VARARGIN)

% Choose default command line output for webcam1
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes webcam1 wait for user response (see UIRESUME)
% uiwait(handles.figure1);

imaqreset
vid = videoinput('winvideo', 1, 'YUY2_640x480');
vid.ReturnedColorspace= 'rgb';

vidRes = get(vid, 'VideoResolution');
nBands = get(vid, 'NumberOfBands');
himage = image(zeros(vidRes(2),vidRes(1), nBands));

handles.vid = vid;
handles.himage = himage;
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = webcam1_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in preview.
function preview_Callback(hObject, eventdata, handles)
% hObject    handle to preview (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
preview(handles.vid, handles.himage);

% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
stoppreview(handles.vid);

% --- Executes on button press in snapshot.
function snapshot_Callback(hObject, eventdata, handles)
% hObject    handle to snapshot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
snapimage = getsnapshot(handles.vid);
figure, imagesc(snapimage);