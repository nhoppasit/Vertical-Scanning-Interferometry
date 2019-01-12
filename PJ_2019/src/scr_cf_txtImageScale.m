try
    load vsi_last_folder
    load([folder_name '/vsi_data/image_scale.mat'])    
    set(hObject,'String',imScale);    
catch
end