try    
    EnvelopMethod = get(handles.cboEnvelopMethod,'Value');
    handles.EnvelopMethod = EnvelopMethod;
    guidata(hObject,handles);
    folder_name = get(handles.txtFolder,'String');
    save([folder_name '/vsi_data/EnvelopMethod.mat'],'EnvelopMethod');
catch
end