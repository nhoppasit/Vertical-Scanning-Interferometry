try
    folder_name = get(handles.txtFolder,'String');
    imFamily = get(handles.txtImageFamily,'String');
    save([folder_name '/vsi_data/image_family.mat'],'imFamily');
catch
end