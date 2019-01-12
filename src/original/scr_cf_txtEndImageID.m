try
    load vsi_last_folder
    load([folder_name '/vsi_data/end_id.mat'])    
    set(hObject,'String',endID);
catch
end