% Script Title
% Design by SOMPHOP SAEJIA, 2017
% DEV.THEPROGRAM@GMAIL.COM

% อ่านค่าจาก GUI
warning off
try
    imScale = str2double(get(handles.txtImageScale,'String'));    
    set(handles.sldImageScale,'Value',imScale);
    handles.ImageScale = imScale;
    guidata(hObject,handles);
    folder_name = get(handles.txtFolder,'String');
    save([folder_name '/vsi_data/image_scale.mat'],'imScale')  
catch ex
    hmsg = msgbox(ex.message,'Image Scale Error','warn','modal');
    frames = java.awt.Frame.getFrames();
    frames(end).setAlwaysOnTop(1); 
    uiwait(hmsg);
end
warning on