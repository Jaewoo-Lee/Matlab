function varargout = project_f(varargin)
% PROJECT_F MATLAB code for project_f.fig
%      PROJECT_F, by itself, creates a new PROJECT_F or raises the existing
%      singleton*.
%
%      H = PROJECT_F returns the handle to a new PROJECT_F or the handle to
%      the existing singleton*.
%
%      PROJECT_F('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJECT_F.M with the given input arguments.
%
%      PROJECT_F('Property','Value',...) creates a new PROJECT_F or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before project_f_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to project_f_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help project_f

% Last Modified by GUIDE v2.5 09-Jun-2015 21:07:16

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @project_f_OpeningFcn, ...
                   'gui_OutputFcn',  @project_f_OutputFcn, ...
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


% --- Executes just before project_f is made visible.
function project_f_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to project_f (see VARARGIN)

% Choose default command line output for project_f
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

handles.output = hObject;
guidata(hObject, handles);


handles.act = 0;
handles.a = 0;
handles.cnt = 0;
axis([0 10 0 10]);
xlabel('È½¼ö','fontsize', 8);
ylabel('¼Óµµ','fontsize', 8); hold(gca);
imaqreset
vid2 = videoinput('winvideo', 2, 'YUY2_640x480');
vid1 = videoinput('winvideo', 1, 'YUY2_640x480'); 
handles.vid1 = vid1;
handles.vid2 = vid2;
guidata(hObject, handles);

% UIWAIT makes project_f wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = project_f_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on selection change in popupmenu1.
function popupmenu1_Callback(hObject, eventdata, handles)
% hObject    handle to popupmenu1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns popupmenu1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from popupmenu1
val = get(hObject, 'Value');
switch val
    case 1
        
    case 2
        handles.onoff = 1;
        handles.s1.digitalWrite(10,1);
    case 3
        handles.onoff = 2;
        handles.s1.digitalWrite(10,0);
end
guidata(hObject,handles)

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



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in connect.
function connect_Callback(hObject, eventdata, handles)
% hObject    handle to connect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s1 =  arduino('COM3');
handles.s1 = s1;
handles.s1.pinMode(10,'output')
handles.s1.pinMode(9,'output')
handles.s1.pinMode(2,'input')

guidata(hObject, handles);

% --- Executes on button press in disconnect.
function disconnect_Callback(hObject, eventdata, handles)
% hObject    handle to disconnect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
delete(instrfind({'Port'},{'COM3'}));
disp('Disconnected...')

% --- Executes on button press in start.
function start_Callback(hObject, eventdata, handles)
% hObject    handle to start (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global timer
global speed
global temp1
global temp2
global cnt

temp1 = 0;
temp2 = 0;
cnt = 1;

handles.act = 1;
handles.s1.servoAttach(9);

while(handles.act == 1)
    if(handles.act == 0)
        break;
    end
    while (temp1<100)
        data1(:,:,:,1) = getsnapshot(handles.vid1);
        data1(:,:,:,2) = getsnapshot(handles.vid1);
        diff_im1 = imabsdiff(data1(:,:,:,1), data1(:,:,:,2));
        temp1= max(max(diff_im1));
    end
    tic
    
    while (temp2<100)
        data2(:,:,:,1) = getsnapshot(handles.vid2);
        data2(:,:,:,2) = getsnapshot(handles.vid2);
        diff_im2 = imabsdiff(data2(:,:,:,1), data2(:,:,:,2));
        temp2=max(max(diff_im2));
    end
    timer = toc;
    temp1 = 0;
    temp2 = 0;
    speed = timer/0.5;
    
    set(handles.speed,'String',speed);
    M(1,cnt) =  cnt;
    M(2,cnt) = speed;
    cnt = cnt +1;
    plot(M(1,:),M(2,:))
    
    switch handles.onoff
        case 1
            pause(timer/20);
            handles.s1.servoWrite(9,120);
            handles.s1.servoRead(9);
            pause(.3)
            
            handles.s1.servoWrite(9,0);
            handles.s1.servoRead(9);
            pause(.3)
            
        case 2
            while(1)
                if handles.s1.digitalRead(2)==0
                    while (handles.s1.digitalRead(2)==0)
                        handles.s1.servoWrite(9,120);
                        handles.s1.servoRead(9);
                        pause(.3)
                        if handles.s1.digitalRead(2)==1
                            handles.s1.servoWrite(9,0);
                            handles.s1.servoRead(9);
                            pause(.3)
                            break
                        end
                    end
                    break
                elseif handles.s1.digitalRead(2)==1
                    handles.s1.servoWrite(9,0);
                    handles.s1.servoRead(9);
                    pause(.3)
                   
                end
            end
    end
    pause(.5);
end


% --- Executes on button press in stop.
function stop_Callback(hObject, eventdata, handles)
% hObject    handle to stop (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.s1.servoDetach(9);
handles.act = 0;

stop(handles.vid1);
stop(handles.vid2);

handles.s1.digital(10,0);
guidata(hObject, handles);