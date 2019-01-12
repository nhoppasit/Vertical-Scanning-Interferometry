try
    load vsi_last_folder;
    optImColor = get(handles.optColor,'Value');
    save([folder_name '/vsi_data/selected_image_type.mat'],'optImColor');
catch
end