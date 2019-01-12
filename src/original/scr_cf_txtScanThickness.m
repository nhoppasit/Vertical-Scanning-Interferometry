try
    load vsi_last_folder
    load([folder_name '/vsi_data/ScanThickness.mat'])    
    set(hObject,'String',ScanThickness);
catch
end