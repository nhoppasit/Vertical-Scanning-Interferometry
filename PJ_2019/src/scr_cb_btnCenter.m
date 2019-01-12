[x,y,button] = ginput(1);
if button==1
    x = round(x);
    y = round(y);
    set(handles.txtCenterX,'String',num2str(x));
    set(handles.txtCenterY,'String',num2str(y));
    handles.CenterX = x;
    handles.CenterY = y;
    guidata(hObject,handles);
    folder_name = get(handles.txtFolder,'String');
    save([folder_name '/vsi_data/center_x.mat'],'x')
    save([folder_name '/vsi_data/center_y.mat'],'y')
    scr_plot_CircularArea
end