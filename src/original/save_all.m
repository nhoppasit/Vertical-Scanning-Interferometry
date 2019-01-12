try
    mkdir([folder_name '/vsi_data']);
catch
end
scr_cb_txtImageFamily
scr_cb_txtStartID
scr_cb_txtEndImageID
scr_cb_txtImageScale
try    
    cx = str2double(get(handles.txtCenterX,'String'));
    cy = str2double(get(handles.txtCenterY,'String'));
    handles.CenterX = cx;
    handles.CenterY = cy;
    guidata(hObject,handles);
    folder_name = get(handles.txtFolder,'String');
    save([folder_name '/vsi_data/center_x.mat'],'cx')  
    save([folder_name '/vsi_data/center_y.mat'],'cy')  
catch
end
try    
    r = str2double(get(handles.txtRadius,'String'));
    handles.Radius = r;
    guidata(hObject,handles);
    folder_name = get(handles.txtFolder,'String');
    save([folder_name '/vsi_data/radius.mat'],'r');
catch
end
scr_cb_txtScanThickness
scr_cb_txtPeakDF
scr_cb_txtSmoothDF
scr_cb_txtPolyfitDegree
scr_cb_cboEnvelopMethod

try    
    dz_dx = str2double(get(handles.txtDz_Dx,'String'));
    dz_dy = str2double(get(handles.txtDz_Dy,'String'));
    folder_name = get(handles.txtFolder,'String');
    save([folder_name '/vsi_data/orientation.mat'],'dz_dx','dz_dy');
catch
end

hmsg = msgbox('Save all data done.','Save VSI data.','help','modal');
frames = java.awt.Frame.getFrames();
frames(end).setAlwaysOnTop(1);
uiwait(hmsg);