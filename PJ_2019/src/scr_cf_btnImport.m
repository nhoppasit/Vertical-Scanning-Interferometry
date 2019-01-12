try
    load vsi_last_folder;
    load([folder_name '/vsi_data/current_import.mat']);
    if im_id==endID
        set(hObject,'String','Import completed successfuly.');
    else        
        set(hObject,'String',['Imported ' num2str(im_id) '/' num2str(endID)]);
    end
catch
    set(hObject,'String','Import')
end