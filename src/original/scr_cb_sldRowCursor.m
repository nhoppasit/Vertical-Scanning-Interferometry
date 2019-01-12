try
    val = get(handles.sldRowCursor,'Value');
    val = round(val);
    set(handles.sldRowCursor,'Value',val);
    set(handles.txtRowCursor,'String',num2str(-val));
    scr_draw_cursor;
catch
end