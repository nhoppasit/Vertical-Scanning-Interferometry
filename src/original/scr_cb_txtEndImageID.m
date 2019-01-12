try
    folder_name = get(handles.txtFolder,'String');
    endID = str2num(get(handles.txtEndImageID,'String'));
    save([folder_name '/vsi_data/end_id.mat'],'endID');
catch
end