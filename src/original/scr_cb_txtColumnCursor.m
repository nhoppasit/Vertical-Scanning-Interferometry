try
    val = str2double(get(handles.txtColumnCursor,'String'));
    val = round(val);
    set(handles.txtColumnCursor,'String',num2str(val));
    set(handles.sldColumnCursor,'Value',val);
    scr_draw_cursor;
catch
end