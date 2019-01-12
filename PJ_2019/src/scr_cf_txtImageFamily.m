try
    load vsi_last_folder
    load([folder_name '/vsi_data/image_family.mat'])    
    set(hObject,'String',imFamily);
catch
end