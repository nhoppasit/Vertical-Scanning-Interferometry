global height hContour hBinded

try
    [H,W] = size(height);    
    set(handles.sldRowCursor,'Max',1)
    set(handles.sldRowCursor,'MIN',-H)
    set(handles.sldRowCursor,'SliderStep',[1/H,0.1])
    if isempty(hBinded) || hBinded==0
        set(handles.sldRowCursor,'Value',-H/2)
    end
    set(handles.sldRowCursor,'String',num2str(round(H/2)));
    set(handles.sldColumnCursor,'Max',W)
    set(handles.sldColumnCursor,'MIN',1)
    set(handles.sldColumnCursor,'SliderStep',[1/W,0.1])
    if isempty(hBinded) || hBinded==0
        set(handles.sldColumnCursor,'Value',W/2)
    end
    set(handles.txtColumnCursor,'String',num2str(round(W/2)));
    axCursor = handles.axCursor;
    [xx,yy] = meshgrid(1:size(height,2),1:size(height,1));
    try
        delete(hContour);
    catch
    end
    hContour = contour(axCursor,xx,yy,height);
    axis(axCursor,[1,W,1,H]);
    axis(axCursor,'equal');
    axis(axCursor,'ij');
    drawnow;
    hBinded = 1;
    scr_draw_cursor;
catch
end