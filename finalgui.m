function varargout = finalgui(varargin)
% FINALGUI MATLAB code for finalgui.fig %%% HANS TRAUTLEIN, CS021
%      FINALGUI is the second step in my two step GUI process
%      it gives the user the weather in an easy to read way
%
%      H = FINALGUI returns the handle to a new FINALGUI or the handle to
%      the existing singleton*.
%
%      FINALGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FINALGUI.M with the given input arguments.
%
%      FINALGUI('Property','Value',...) creates a new FINALGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before finalgui_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to finalgui_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help finalgui

% Last Modified by GUIDE v2.5 03-May-2013 22:27:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @finalgui_OpeningFcn, ...
                   'gui_OutputFcn',  @finalgui_OutputFcn, ...
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


% --- Executes just before finalgui is made visible.
function finalgui_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to finalgui (see VARARGIN)

global zipcode; % calls the global variable zipcode to this function
handles.weather = ziptoweather(zipcode); % creates struct of weather
clear global zipcode; % clears the global variable

set(gcf,'Name',['Weather for ',handles.weather.location]); %sets fig title

% sets each gui property to it's proper value in the weather struct
% set(handles.gui_location,'String',handles.weather.location);
set(handles.gui_winddir,'String',handles.weather.winddir);
set(handles.gui_windsp,'String',handles.weather.windsp);
set(handles.gui_visibil,'String',handles.weather.visibil);
set(handles.gui_press,'String',handles.weather.press);
set(handles.gui_humid,'String',handles.weather.humid);
set(handles.gui_condtext_now,'String',handles.weather.condtext_now);
set(handles.gui_tempnow2,'String',handles.weather.tempnow2);
set(handles.gui_sunrise,'String',handles.weather.sunrise);
set(handles.gui_sunset,'String',handles.weather.sunset);
set(handles.gui_condtext_t,'String',handles.weather.condtext_t);
set(handles.gui_condtext_tom,'String',handles.weather.condtext_tom);


% getting values for the plotting ahead
x = [1,1.3];
y_low = [str2double(handles.weather.lowtemp_t), ...
    str2double(handles.weather.lowtemp_tom);];
y_high = [str2double(handles.weather.hightemp_t), ...
    str2double(handles.weather.hightemp_tom)];

% the code for my plot
bar1 = bar(x, y_high, 'FaceColor', 'r', 'EdgeColor', 'r');
set(bar1, 'BarWidth', 0.78);
hold on;
bar2 = bar(x,y_low,'FaceColor','b','EdgeColor','b');
set(bar2, 'BarWidth', 0.78);
set(gca,'XTick',[0])
set(gca,'YTick',[0:5:100])
axis([.80 1.50 0 100])
xlabel('    Today        Tomorrow')
hold off

% Choose default command line output for finalgui
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);



% UIWAIT makes finalgui wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = finalgui_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in gui_link.
function gui_link_Callback(hObject, eventdata, handles)
% hObject    handle to gui_link (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

weblink_eval = sprintf('web %s -notoolbar',handles.weather.link);
eval(weblink_eval); 


% --- Executes during object creation, after setting all properties.
function gui_radar_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gui_radar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate gui_radar
axes(hObject);

imshow('radar.png');


% --- Executes during object creation, after setting all properties.
function gui_plot_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gui_plot (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate gui_plot


% --- Executes on button press in gui_radarlink.
function gui_radarlink_Callback(hObject, eventdata, handles)
% hObject    handle to gui_radarlink (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

figure
imshow('radar.png'); % shows the radar images
