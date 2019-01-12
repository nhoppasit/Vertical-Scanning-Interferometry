try
    load vsi_last_folder
    load([folder_name '/vsi_data/SmoothDF.mat'])    
    set(hObject,'String',SmoothDF);
catch
end