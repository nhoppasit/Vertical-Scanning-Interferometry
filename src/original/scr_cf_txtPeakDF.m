try
    load vsi_last_folder
    load([folder_name '/vsi_data/PeakDF.mat'])    
    set(hObject,'String',PeakDF);
catch
end