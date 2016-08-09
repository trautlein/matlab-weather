function varargout = getzip(varargin)
% GETZIP MATLAB code for getzip.fig %%% HANS TRAUTLEIN, CS021
%      getzip gets the user's zipcode through either user input or
%      geolocatin and then passes it along to finalgui.m*.
%
%      H = GETZIP returns the handle to a new GETZIP or the handle to
%      the existing singleton*.
%
%      GETZIP('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GETZIP.M with the given input arguments.
%
%      GETZIP('Property','Value',...) creates a new GETZIP or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before getzip_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to getzip_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help getzip

% Last Modified by GUIDE v2.5 03-May-2013 06:40:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @getzip_OpeningFcn, ...
                   'gui_OutputFcn',  @getzip_OutputFcn, ...
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


% --- Executes just before getzip is made visible.
function getzip_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to getzip (see VARARGIN)

% creates a radar image for later. i put it hear to speed up the program
% later on.
fullURL = sprintf('http://mesonet.agron.iastate.edu/GIS/radmap.php?layers[]=nexrad&width=640&height=480&sector=conus');
urlwrite(fullURL,'radar.png');
% imread('radar.png');

% Choose default command line output for getzip
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes getzip wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = getzip_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in button_geolocate.
function button_geolocate_Callback(hObject, eventdata, handles)
% hObject    handle to button_geolocate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global zipcode; % creates global variable

zipcode = geolocate; % assigns value to global variable

close all hidden % closes getzip.fig
finalgui




% --- Executes on button press in button_zip.
function button_zip_Callback(hObject, eventdata, handles)
% hObject    handle to button_zip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global zipcode; % creates global variable

zipcode = handles.type_zip; % assigns value to global variable
close all hidden % closes getzip.fig
finalgui




function edit_zip_Callback(hObject, eventdata, handles)
% hObject    handle to edit_zip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit_zip as text

handles.type_zip = get(hObject,'String');
guidata(hObject, handles);




% --- Executes during object creation, after setting all properties.
function edit_zip_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit_zip (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
