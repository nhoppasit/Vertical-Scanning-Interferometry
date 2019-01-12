[x,y,button] = ginput(1);
if button==1
    try
        cx = handles.CenterX;
    catch
        cx = str2double(get(handles.txtCenterX,'String'));
    end
    try
        cy = handles.CenterY;
    catch
        cy = str2double(get(handles.txtCenterY,'String'));
    end
    r = sqrt((cx-x)^2 + (cy-y)^2);
    set(handles.txtRadius,'String',num2str(r));
    handles.Radius = r;
    guidata(hObject,handles);
    folder_name = get(handles.txtFolder,'String');
    save([folder_name '/vsi_data/radius.mat'],'r');
    scr_plot_CircularArea
end