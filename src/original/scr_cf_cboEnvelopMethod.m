try
    load vsi_last_folder
    load([folder_name '/vsi_data/EnvelopMethod.mat'])   
    set(hObject,'Value',EnvelopMethod);
catch
    set(hObject,'Value',1);
end