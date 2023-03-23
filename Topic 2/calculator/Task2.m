function varargout = Task2(varargin)
% TASK2 MATLAB code for Task2.fig
%      TASK2, by itself, creates a new TASK2 or raises the existing
%      singleton*.
%
%      H = TASK2 returns the handle to a new TASK2 or the handle to
%      the existing singleton*.
%
%      TASK2('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TASK2.M with the given input arguments.
%
%      TASK2('Property','Value',...) creates a new TASK2 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Task2_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Task2_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Task2

% Last Modified by GUIDE v2.5 02-Jan-2022 13:16:58

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Task2_OpeningFcn, ...
                   'gui_OutputFcn',  @Task2_OutputFcn, ...
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


% --- Executes just before Task2 is made visible.
function Task2_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Task2 (see VARARGIN)

% Choose default command line output for Task2
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
global num1;
global num2;
global op1;
global op2;
global result;
global plotMode;
global equation; 
global x_axis_data;
global y_axis_data;
equation = 0;
result = 0;
num1 = 0;
num2 = 0;
x_axis_data = 0;
y_axis_data = 0;
% UIWAIT makes Task2 wait for user response (see UIRESUME)
% uiwait(handles.figure1);
set(handles.eqnText,'String',"");
contents = cellstr(get(handles.listbox1,'String'));
set(handles.op1,'String', contents{get(handles.listbox1,'Value')});

contents2 = cellstr(get(handles.listbox2,'String'));
set(handles.op2,'String', contents2{get(handles.listbox2,'Value')});

% --- Outputs from this function are returned to the command line.
function varargout = Task2_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in eq1.
function eq1_Callback(hObject, eventdata, handles)
% hObject    handle to eq1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global num1;
global num2;
global op1;
global result;
num1 = str2double(get(handles.num1,'String')) ;
num2 = str2double(get(handles.num2,'String'));
if(isnan(num1) || isnan(num2))
    set(handles.err1,'String',"ERROR NON Numeric Value");
    set(handles.equals,'String',"$$");
    
else
    set(handles.err1,'String'," ");

    switch op1
       case '-'
          result = num1 - num2;
       case '+'
          result = num1 + num2;
       case '*'
          result = num1 * num2;
       case '/'
           if(num2 ~= 0)
               result = num1 / num2;
           else
               set(handles.err1,'String',"Can not divide by zero");
           end
    end
    set(handles.equals,'String',result);
    result =0;
end

% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in Equal.
function Equal_Callback(hObject, eventdata, handles)
% hObject    handle to Equal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global x_axis_data;
global y_axis_data;
global op2;
global result;
op2 = get(handles.listbox2,'Value');
x_axis_data = get(handles.xData,'String');
y_axis_data = get(handles.yData,'String');
if(size(x_axis_data) == size(y_axis_data))
xvals = isnan(str2double(strsplit(x_axis_data,' ')));
yvals = isnan(str2double(strsplit(y_axis_data,' ')));

if(any(xvals(:) == 1) || any(yvals(:) == 1))
    set(handles.errConsole,'String',"ERROR NON Numeric Value");
    set(handles.resultData,'String',"$$");

else
    set(handles.errConsole,'String'," ");

    x_axis_data = str2double(strsplit(x_axis_data,' '));
    y_axis_data = str2double(strsplit(y_axis_data,' '));
    
        switch op2
           case 1
              result = x_axis_data - y_axis_data;
           case 2
              result = x_axis_data + y_axis_data;
           case 4
              result = x_axis_data .* y_axis_data;
           case 3
               if(y_axis_data ~= zeros(size(y_axis_data )))
                   result = x_axis_data ./ y_axis_data;
               else
                   set(handles.errConsole,'String',"Can not divide by zero");
                   result ='';
               end
        end
        result = num2str(result);
        set(handles.resultData,'String',result);
    
    end
    else
        set(handles.errConsole,'String',"ERROR NOT SAME SIZE");
    end 


% --- Executes on selection change in listbox1.
function listbox1_Callback(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global op1;
contents = cellstr(get(hObject,'String'));
% 
% disp(contents{get(hObject,'Value')});

op1 = contents{get(hObject,'Value')};
set(handles.op1,'String',op1);

% Hints: contents = cellstr(get(hObject,'String')) returns listbox1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox1


% --- Executes during object creation, after setting all properties.
function listbox1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eqnText_Callback(hObject, eventdata, handles)
% hObject    handle to eqnText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global equation;
equation = get(hObject,'String');

% Hints: get(hObject,'String') returns contents of eqnText as text
%        str2double(get(hObject,'String')) returns contents of eqnText as a double

% --- Executes during object creation, after setting all properties.
function eqnText_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eqnText (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit9_Callback(hObject, ~, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function xData_Callback(hObject, eventdata, handles)
% hObject    handle to xData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% global x_axis_data; 
% x_axis_data = get(handles.xData_Callback,'String')
% Hints: get(hObject,'String') returns contents of xData as text
%        str2double(get(hObject,'String')) returns contents of xData as a double


% --- Executes during object creation, after setting all properties.
function xData_CreateFcn(hObject, eventdata, handles)
% hObject    handle to xData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function op2_Callback(hObject, eventdata, handles)
% hObject    handle to op2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global op2;
contents = cellstr(get(handles.listbox2,'String'));
% 
% disp(contents{get(hObject,'Value')});

op2 = contents{get(handles.listbox2,'Value')};
set(handles.op1,'String',op2);

% Hints: get(hObject,'String') returns contents of op2 as text
%        str2double(get(hObject,'String')) returns contents of op2 as a double


% --- Executes during object creation, after setting all properties.
function op2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to op2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function yData_Callback(hObject, eventdata, handles)
% hObject    handle to yData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global y_axis_data; 
y_axis_data = get(hObject,'String');
% Hints: get(hObject,'String') returns contents of yData as text
%        str2double(get(hObject,'String')) returns contents of yData as a double


% --- Executes during object creation, after setting all properties.
function yData_CreateFcn(hObject, eventdata, handles)
% hObject    handle to yData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit13_Callback(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit13 as text
%        str2double(get(hObject,'String')) returns contents of edit13 as a double


% --- Executes during object creation, after setting all properties.
function edit13_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit13 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit14_Callback(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit14 as text
%        str2double(get(hObject,'String')) returns contents of edit14 as a double


% --- Executes during object creation, after setting all properties.
function edit14_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit14 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function resultData_Callback(hObject, eventdata, handles)
% hObject    handle to resultData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of resultData as text
%        str2double(get(hObject,'String')) returns contents of resultData as a double


% --- Executes during object creation, after setting all properties.
function resultData_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resultData (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit16_Callback(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit16 as text
%        str2double(get(hObject,'String')) returns contents of edit16 as a double


% --- Executes during object creation, after setting all properties.
function edit16_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit16 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function errConsole_Callback(hObject, eventdata, handles)
% hObject    handle to errConsole (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of errConsole as text
%        str2double(get(hObject,'String')) returns contents of errConsole as a double


% --- Executes during object creation, after setting all properties.
function errConsole_CreateFcn(hObject, eventdata, handles)
% hObject    handle to errConsole (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function eq1_CreateFcn(varargin)


% --- Executes on button press in Delete.
function Delete_Callback(hObject, eventdata, handles)
% hObject    handle to Delete (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
axes(handles.axes1);
plot(0,0);

% --- Executes on button press in Enter.
function Enter_Callback(hObject, eventdata, handles)
% hObject    handle to Enter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global equation ;
global plotMode;
global result ;

axes(handles.axes1);
switch plotMode
    case 'x_axis'
        fplot(str2double(strsplit(get(handles.xData,'String'),' ')));
    case 'y_axis'
        fplot(str2double(strsplit(get(handles.yData,'String'),' ')));
    case 'x_y axis'
        plot( str2double(strsplit(get(handles.xData,'String'),' ')),str2double(strsplit(get(handles.yData,'String'),' ')) );
    case 'resultant'
        fplot(str2double(strsplit(result,' ')));
        disp(result)
    case 'Sine'
        ezplot('sin');
    case 'Cosine'
        ezplot('cos');
    case 'Equation'
        disp(get(handles.eqnText,'String'));
        if(get(handles.eqnText,'String') == "")
            disp("hi");
            set(handles.errConsole,'String',"No Equation Provided." );
        else 
            ezplot(equation);
        end

end
disp(plotMode);

% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global op2;
contents =  cellstr(get(hObject,'String'));
% 
% disp(contents{get(hObject,'Value')});

op2 = contents{get(hObject,'Value')};
set(handles.op2,'String',op2);

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2




% --- Executes on button press in Equation.
function Equation_Callback(hObject, eventdata, handles)
% hObject    handle to Equation (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global plotMode;
plotMode = get(handles.Equation,'String');

% Hint: get(hObject,'Value') returns toggle state of Equation


% --- Executes on button press in x_axis.
function x_axis_Callback(hObject, eventdata, handles)
% hObject    handle to x_axis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global plotMode;
plotMode = get(handles.x_axis,'String');
% Hint: get(hObject,'Value') returns toggle state of x_axis


% --- Executes on button press in y_axis.
function y_axis_Callback(hObject, eventdata, handles)
% hObject    handle to y_axis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global plotMode;
plotMode = get(handles.y_axis,'');
% Hint: get(hObject,'Value') returns toggle state of y_axis


% --- Executes on button press in x_y_axis.
function x_y_axis_Callback(hObject, eventdata, handles)
% hObject    handle to x_y_axis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global plotMode;
plotMode = get(hObject,'String');
% Hint: get(hObject,'Value') returns toggle state of x_y_axis


% --- Executes on button press in resultant.
function resultant_Callback(hObject, eventdata, handles)
% hObject    handle to resultant (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global plotMode;
plotMode = get(handles.resultant,'String');
% Hint: get(hObject,'Value') returns toggle state of resultant


% --- Executes on button press in Sine.
function Sine_Callback(hObject, eventdata, handles)
% hObject    handle to Sine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global plotMode;
plotMode = get(handles.Sine,'String');
% Hint: get(hObject,'Value') returns toggle state of Sine


% --- Executes on button press in Cosine.
function Cosine_Callback(hObject, eventdata, handles)
% hObject    handle to Cosine (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global plotMode;
plotMode = get(handles.Cosine,'String');
% Hint: get(hObject,'Value') returns toggle state of Cosine
function Equal_CreateFcn(varargin)
function err1_CreateFcn(varargin)
function num1_CreateFcn(varargin)
function op1_CreateFcn(varargin)
function num2_CreateFcn(varargin)

function equals_CreateFcn(varargin)
function edit6_CreateFcn(varargin)
function listbox2_CreateFcn(varargin)
function num1_Callback(hObject, eventdata, handles)
function num2_Callback(hObject, eventdata, handles)
