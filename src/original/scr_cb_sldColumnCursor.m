try
    val = get(handles.sldColumnCursor,'Value');
    val = round(val);
    set(handles.sldColumnCursor,'Value',val);
    set(handles.txtColumnCursor,'String',num2str(val));
    scr_draw_cursor;
catch
end