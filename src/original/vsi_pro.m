function varargout = vsi_pro(varargin)
% VSI_PRO MATLAB code for vsi_pro.fig
%      VSI_PRO, by itself, creates a new VSI_PRO or raises the existing
%      singleton*.
%
%      H = VSI_PRO returns the handle to a new VSI_PRO or the handle to
%      the existing singleton*.
%
%      VSI_PRO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in VSI_PRO.M with the given input arguments.
%
%      VSI_PRO('Property','Value',...) creates a new VSI_PRO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before vsi_pro_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to vsi_pro_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help vsi_pro

% Last Modified by GUIDE v2.5 15-Jul-2017 14:26:42

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @vsi_pro_OpeningFcn, ...
                   'gui_OutputFcn',  @vsi_pro_OutputFcn, ...
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


% --- Executes just before vsi_pro is made visible.
function vsi_pro_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to vsi_pro (see VARARGIN)

% Choose default command line output for vsi_pro
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes vsi_pro wait for user response (see UIRESUME)
% uiwait(handles.figMain);


% --- Outputs from this function are returned to the command line.
function varargout = vsi_pro_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtImageFamily_Callback(hObject, eventdata, handles)
% hObject    handle to txtImageFamily (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtImageFamily as text
%        str2double(get(hObject,'String')) returns contents of txtImageFamily as a double
scr_cb_txtImageFamily

% --- Executes during object creation, after setting all properties.
function txtImageFamily_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtImageFamily (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
scr_cf_txtImageFamily

% --- Executes on button press in btnImport.
function btnImport_Callback(hObject, eventdata, handles)
% hObject    handle to btnImport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scr_cb_btnImport;



function txtStartImageID_Callback(hObject, eventdata, handles)
% hObject    handle to txtStartImageID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtStartImageID as text
%        str2double(get(hObject,'String')) returns contents of txtStartImageID as a double
scr_cb_txtStartID

% --- Executes during object creation, after setting all properties.
function txtStartImageID_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtStartImageID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
scr_cf_txtStartID


function txtEndImageID_Callback(hObject, eventdata, handles)
% hObject    handle to txtEndImageID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtEndImageID as text
%        str2double(get(hObject,'String')) returns contents of txtEndImageID as a double
scr_cb_txtEndImageID

% --- Executes during object creation, after setting all properties.
function txtEndImageID_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtEndImageID (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
scr_cf_txtEndImageID


function txtFolder_Callback(hObject, eventdata, handles)
% hObject    handle to txtFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtFolder as text
%        str2double(get(hObject,'String')) returns contents of txtFolder as a double
scr_cb_txtFolder;

% --- Executes during object creation, after setting all properties.
function txtFolder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
scr_cf_txtFolder

% --- Executes on button press in btnFolder.
function btnFolder_Callback(hObject, eventdata, handles)
% hObject    handle to btnFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scr_cb_btnFolder


function txtImageScale_Callback(hObject, eventdata, handles)
% hObject    handle to txtImageScale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtImageScale as text
%        str2double(get(hObject,'String')) returns contents of txtImageScale as a double
scr_cb_txtImageScale

% --- Executes during object creation, after setting all properties.
function txtImageScale_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtImageScale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
scr_cf_txtImageScale

% --- Executes on slider movement.
function sldImageScale_Callback(hObject, eventdata, handles)
% hObject    handle to sldImageScale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
scr_cb_sldImageScale;

% --- Executes during object creation, after setting all properties.
function sldImageScale_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sldImageScale (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
scr_cf_sldImageScale

% --- Executes during object creation, after setting all properties.
function figMain_CreateFcn(hObject, eventdata, handles)
% hObject    handle to figMain (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
global hBinded
hBinded = 0;


function txtCenterX_Callback(hObject, eventdata, handles)
% hObject    handle to txtCenterX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtCenterX as text
%        str2double(get(hObject,'String')) returns contents of txtCenterX as a double
scr_cb_txtCenter_

% --- Executes during object creation, after setting all properties.
function txtCenterX_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtCenterX (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
scr_cf_txtCenterX

% --- Executes on button press in btnCenter.
function btnCenter_Callback(hObject, eventdata, handles)
% hObject    handle to btnCenter (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scr_cb_btnCenter


function txtRadius_Callback(hObject, eventdata, handles)
% hObject    handle to txtRadius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtRadius as text
%        str2double(get(hObject,'String')) returns contents of txtRadius as a double
scr_cb_txtRadius

% --- Executes during object creation, after setting all properties.
function txtRadius_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtRadius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
scr_cf_txtRadius

% --- Executes on button press in btnRadius.
function btnRadius_Callback(hObject, eventdata, handles)
% hObject    handle to btnRadius (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scr_cb_btnRadius


function txtCenterY_Callback(hObject, eventdata, handles)
% hObject    handle to txtCenterY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtCenterY as text
%        str2double(get(hObject,'String')) returns contents of txtCenterY as a double
scr_cb_txtCenter_

% --- Executes during object creation, after setting all properties.
function txtCenterY_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtCenterY (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
scr_cf_txtCenterY

% --- Executes during object creation, after setting all properties.
function optGray_CreateFcn(hObject, eventdata, handles)
% hObject    handle to optGray (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes when selected object is changed in gbImageType.
function gbImageType_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in gbImageType 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
scr_cb_gbImageType


% --- Executes during object creation, after setting all properties.
function gbImageType_CreateFcn(hObject, eventdata, handles)
% hObject    handle to gbImageType (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function btnImport_CreateFcn(hObject, eventdata, handles)
% hObject    handle to btnImport (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
scr_cf_btnImport


% --- Executes on button press in btnCircularArea.
function btnCircularArea_Callback(hObject, eventdata, handles)
% hObject    handle to btnCircularArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scr_plot_CircularArea



function txtScanThickness_Callback(hObject, eventdata, handles)
% hObject    handle to txtScanThickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtScanThickness as text
%        str2double(get(hObject,'String')) returns contents of txtScanThickness as a double
scr_cb_txtScanThickness

% --- Executes during object creation, after setting all properties.
function txtScanThickness_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtScanThickness (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
scr_cf_txtScanThickness

% --- Executes on button press in btnVSIAnalysis.
function btnVSIAnalysis_Callback(hObject, eventdata, handles)
% hObject    handle to btnVSIAnalysis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scr_cb_btnVSIAnalysis



function txtPeakDF_Callback(hObject, eventdata, handles)
% hObject    handle to txtPeakDF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtPeakDF as text
%        str2double(get(hObject,'String')) returns contents of txtPeakDF as a double
scr_cb_txtPeakDF

% --- Executes during object creation, after setting all properties.
function txtPeakDF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtPeakDF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
scr_cf_txtPeakDF

% --- Executes on button press in btnPeakTestOne.
function btnPeakTestOne_Callback(hObject, eventdata, handles)
% hObject    handle to btnPeakTestOne (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scr_cb_btnPeakTestOne



function txtSmoothDF_Callback(hObject, eventdata, handles)
% hObject    handle to txtSmoothDF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtSmoothDF as text
%        str2double(get(hObject,'String')) returns contents of txtSmoothDF as a double
scr_cb_txtSmoothDF

% --- Executes during object creation, after setting all properties.
function txtSmoothDF_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtSmoothDF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
scr_cf_txtSmoothDF

% --- Executes on button press in btnTestSmoothDF.
function btnTestSmoothDF_Callback(hObject, eventdata, handles)
% hObject    handle to btnTestSmoothDF (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scr_cb_btnTestSmoothDF



function txtPolyfitDegree_Callback(hObject, eventdata, handles)
% hObject    handle to txtPolyfitDegree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtPolyfitDegree as text
%        str2double(get(hObject,'String')) returns contents of txtPolyfitDegree as a double
scr_cb_txtPolyfitDegree

% --- Executes during object creation, after setting all properties.
function txtPolyfitDegree_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtPolyfitDegree (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
scr_cf_txtPolyfitDegree

% --- Executes on button press in btnTestPolyfit.
function btnTestPolyfit_Callback(hObject, eventdata, handles)
% hObject    handle to btnTestPolyfit (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scr_cb_btnTestPolyfit


% --- Executes on selection change in cboEnvelopMethod.
function cboEnvelopMethod_Callback(hObject, eventdata, handles)
% hObject    handle to cboEnvelopMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns cboEnvelopMethod contents as cell array
%        contents{get(hObject,'Value')} returns selected item from cboEnvelopMethod
scr_cb_cboEnvelopMethod

% --- Executes during object creation, after setting all properties.
function cboEnvelopMethod_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cboEnvelopMethod (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
scr_cf_cboEnvelopMethod

% --- Executes on button press in chkStopAnalysis.
function chkStopAnalysis_Callback(hObject, eventdata, handles)
% hObject    handle to chkStopAnalysis (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkStopAnalysis


% --- Executes on mouse press over axes background.
function axSurface_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to axSurface (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in optAxesToolNone.
function optAxesToolNone_Callback(hObject, eventdata, handles)
% hObject    handle to optAxesToolNone (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of optAxesToolNone


% --- Executes on button press in optAxesToolZoom.
function optAxesToolZoom_Callback(hObject, eventdata, handles)
% hObject    handle to optAxesToolZoom (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of optAxesToolZoom


% --- Executes on button press in optAxesToolRotate3D.
function optAxesToolRotate3D_Callback(hObject, eventdata, handles)
% hObject    handle to optAxesToolRotate3D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of optAxesToolRotate3D


% --- Executes when selected object is changed in pnAxesTools.
function pnAxesTools_SelectionChangeFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in pnAxesTools 
% eventdata  structure with the following fields (see UIBUTTONGROUP)
%	EventName: string 'SelectionChanged' (read only)
%	OldValue: handle of the previously selected object or empty if none was selected
%	NewValue: handle of the currently selected object
% handles    structure with handles and user data (see GUIDATA)
scr_cb_pnAxesTools


% --- Executes on button press in chkGrid.
function chkGrid_Callback(hObject, eventdata, handles)
% hObject    handle to chkGrid (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkGrid


% --- Executes on button press in btnVSIDraw.
function btnVSIDraw_Callback(hObject, eventdata, handles)
% hObject    handle to btnVSIDraw (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scr_cb_btnVSIDraw


% --- Executes on slider movement.
function sldColumnCursor_Callback(hObject, eventdata, handles)
% hObject    handle to sldColumnCursor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
scr_cb_sldColumnCursor

% --- Executes during object creation, after setting all properties.
function sldColumnCursor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sldColumnCursor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% --- Executes on slider movement.
function sldRowCursor_Callback(hObject, eventdata, handles)
% hObject    handle to sldRowCursor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
scr_cb_sldRowCursor;

% --- Executes during object creation, after setting all properties.
function sldRowCursor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sldRowCursor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end



function txtRowCursor_Callback(hObject, eventdata, handles)
% hObject    handle to txtRowCursor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtRowCursor as text
%        str2double(get(hObject,'String')) returns contents of txtRowCursor as a double
scr_cb_txtRowCursor

% --- Executes during object creation, after setting all properties.
function txtRowCursor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtRowCursor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtColumnCursor_Callback(hObject, eventdata, handles)
% hObject    handle to txtColumnCursor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtColumnCursor as text
%        str2double(get(hObject,'String')) returns contents of txtColumnCursor as a double
scr_cb_txtColumnCursor

% --- Executes during object creation, after setting all properties.
function txtColumnCursor_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtColumnCursor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtCursorAngle_Callback(hObject, eventdata, handles)
% hObject    handle to txtCursorAngle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtCursorAngle as text
%        str2double(get(hObject,'String')) returns contents of txtCursorAngle as a double
scr_draw_cursor

% --- Executes during object creation, after setting all properties.
function txtCursorAngle_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtCursorAngle (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnCursor.
function btnCursor_Callback(hObject, eventdata, handles)
% hObject    handle to btnCursor (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scr_cb_btnCursor


% --- Executes on button press in chkPlot3D.
function chkPlot3D_Callback(hObject, eventdata, handles)
% hObject    handle to chkPlot3D (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of chkPlot3D
scr_cb_chkPlot3D

% --- Executes on button press in btnDumpVSI.
function btnDumpVSI_Callback(hObject, eventdata, handles)
% hObject    handle to btnDumpVSI (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scr_cb_btnDumpVSI

% --- Executes on button press in btnDump.
function btnDump_Callback(hObject, eventdata, handles)
% hObject    handle to btnDump (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
scr_cb_btnDump

% --- Executes during object creation, after setting all properties.
function btnCircularArea_CreateFcn(hObject, eventdata, handles)
% hObject    handle to btnCircularArea (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes on selection change in cboDump.
function cboDump_Callback(hObject, eventdata, handles)
% hObject    handle to cboDump (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns cboDump contents as cell array
%        contents{get(hObject,'Value')} returns selected item from cboDump


% --- Executes during object creation, after setting all properties.
function cboDump_CreateFcn(hObject, eventdata, handles)
% hObject    handle to cboDump (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function btnFolder_CreateFcn(hObject, eventdata, handles)
% hObject    handle to btnFolder (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function txtDz_Dx_Callback(hObject, eventdata, handles)
% hObject    handle to txtDz_Dx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtDz_Dx as text
%        str2double(get(hObject,'String')) returns contents of txtDz_Dx as a double
scr_cb_txtDz_Dx

% --- Executes during object creation, after setting all properties.
function txtDz_Dx_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtDz_Dx (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtDz_Dy_Callback(hObject, eventdata, handles)
% hObject    handle to txtDz_Dy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtDz_Dy as text
%        str2double(get(hObject,'String')) returns contents of txtDz_Dy as a double
scr_cb_txtDz_Dy

% --- Executes during object creation, after setting all properties.
function txtDz_Dy_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtDz_Dy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnSave.
function btnSave_Callback(hObject, eventdata, handles)
% hObject    handle to btnSave (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
save_all;
