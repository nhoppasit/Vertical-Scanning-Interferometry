try
    [x,y] = ginput(1);
    x = round(x);
    set(handles.txtColumnCursor,'String',num2str(x));
    set(handles.sldColumnCursor,'Value',x);
    y = round(y);
    set(handles.txtRowCursor,'String',num2str(y));
    set(handles.sldRowCursor,'Value',-y);
    scr_draw_cursor;
catch ex
end
    