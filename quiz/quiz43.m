function varargout = quiz43(varargin)
% QUIZ43 MATLAB code for quiz43.fig
%      QUIZ43, by itself, creates a new QUIZ43 or raises the existing
%      singleton*.
%
%      H = QUIZ43 returns the handle to a new QUIZ43 or the handle to
%      the existing singleton*.
%
%      QUIZ43('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in QUIZ43.M with the given input arguments.
%
%      QUIZ43('Property','Value',...) creates a new QUIZ43 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before quiz43_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to quiz43_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help quiz43

% Last Modified by GUIDE v2.5 01-Jun-2015 15:36:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @quiz43_OpeningFcn, ...
                   'gui_OutputFcn',  @quiz43_OutputFcn, ...
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


% --- Executes just before quiz43 is made visible.
function quiz43_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to quiz43 (see VARARGIN)

% Choose default command line output for quiz43
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);


% UIWAIT makes quiz43 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = quiz43_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;
popupmenu1_Callback(handles.popupmenu1,[], handles);


% --- Executes on button press in disconnect.
function disconnect_Callback(hObject, eventdata, handles)
% hObject    handle to disconnect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(instrfind({'Port'},{'COM3'}));
disp('disconnect......');

% --- Executes on button press in connect.
function connect_Callback(hObject, eventdata, handles)
% hObject    handle to connect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s1=arduino('COM3');
handles.s1=s1;
handles.s1.pinMode(6,'output');
handles.s1.pinMode(9,'output');
handles.s1.pinMode(10,'output');
handles.s1.pinMode(11,'output');

guidata(hObject,handles);

% --- Executes on button press in run.
function run_Callback(hObject, eventdata, handles)
% hObject    handle to run (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
switch handles.spd
    case 70
        handles.s1.analogWrite(6,70);
        handles.s1.digitalWrite(9,0);
        handles.s1.digitalWrite(10,1);
        handles.s1.digitalWrite(11,0);
        case 120
        handles.s1.analogWrite(6,120);
        handles.s1.digitalWrite(9,0);
        handles.s1.digitalWrite(10,0);
        handles.s1.digitalWrite(11,1);
        case 200
        handles.s1.analogWrite(6,200);
        handles.s1.digitalWrite(9,1);
        handles.s1.digitalWrite(10,0);
        handles.s1.digitalWrite(11,0);
       
        
end
guidata(hObject, handles);


% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.s1.analogWrite(6,0);
        handles.s1.digitalWrite(9,0);
        handles.s1.digitalWrite(10,0);
        handles.s1.digitalWrite(11,0);

% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
val=get(hObject, 'Value');
switch val
    case 1
        handles.spd = 70;
        case 2
        handles.spd = 120;
        case 3
        handles.spd = 200;
end
guidata(hObject, handles);

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
