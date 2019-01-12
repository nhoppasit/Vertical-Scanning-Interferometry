try    
    SmoothDF = str2double(get(handles.txtSmoothDF,'String'));
    handles.SmoothDF = SmoothDF;
    guidata(hObject,handles);
    folder_name = get(handles.txtFolder,'String');
    save([folder_name '/vsi_data/SmoothDF.mat'],'SmoothDF');
catch
end