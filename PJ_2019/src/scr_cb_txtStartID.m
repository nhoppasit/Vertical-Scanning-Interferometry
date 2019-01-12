try
    folder_name = get(handles.txtFolder,'String');
    startID = str2num(get(handles.txtStartImageID,'String'));
    save([folder_name '/vsi_data/start_id.mat'],'startID');
catch
end