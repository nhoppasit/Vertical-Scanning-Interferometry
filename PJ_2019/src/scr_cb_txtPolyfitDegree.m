try    
    PolyfitDegree = str2double(get(handles.txtPolyfitDegree,'String'));
    handles.PolyfitDegree = PolyfitDegree;
    guidata(hObject,handles);
    folder_name = get(handles.txtFolder,'String');
    save([folder_name '/vsi_data/PolyfitDegree.mat'],'PolyfitDegree');
catch
end