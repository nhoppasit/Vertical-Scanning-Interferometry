try    
    cx = str2double(get(handles.txtCenterX,'String'));
    cy = str2double(get(handles.txtCenterY,'String'));
    handles.CenterX = cx;
    handles.CenterY = cy;
    guidata(hObject,handles);
    folder_name = get(handles.txtFolder,'String');
    save([folder_name '/vsi_data/center_x.mat'],'cx')  
    save([folder_name '/vsi_data/center_y.mat'],'cy')  

    scr_plot_CircularArea
catch
end
