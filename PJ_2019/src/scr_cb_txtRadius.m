try    
    r = str2double(get(handles.txtRadius,'String'));
    handles.Radius = r;
    guidata(hObject,handles);
    folder_name = get(handles.txtFolder,'String');
    save([folder_name '/vsi_data/radius.mat'],'r');
catch
end

scr_plot_CircularArea