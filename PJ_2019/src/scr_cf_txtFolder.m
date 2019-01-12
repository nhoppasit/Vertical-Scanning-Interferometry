try
    load vsi_last_folder
    set(hObject,'String',folder_name);
    handles.Folder = folder_name;
    guidata(hObject,handles);
catch
end