try
    val = -str2double(get(handles.txtRowCursor,'String'));
    val = round(val);
    set(handles.txtRowCursor,'String',num2str(-val));
    set(handles.sldRowCursor,'Value',val);
    scr_draw_cursor;
catch
end