try
    load vsi_last_folder
    load([folder_name '/vsi_data/start_id.mat'])    
    set(hObject,'String',startID);
catch
end