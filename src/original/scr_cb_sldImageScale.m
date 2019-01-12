% Script Title
% Design by SOMPHOP SAEJIA, 2017
% DEV.THEPROGRAM@GMAIL.COM

% ��ҹ��Ҩҡ GUI
warning off
try
    imScale = get(handles.sldImageScale,'Value');    
    set(handles.txtImageScale,'String',num2str(imScale));
    handles.ImageScale = imScale;
    guidata(hObject,handles);
catch ex
    msgbox(ex.message,'Image Scale Error','warn');
end
warning on