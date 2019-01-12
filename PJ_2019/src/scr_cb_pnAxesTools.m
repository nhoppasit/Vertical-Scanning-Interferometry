global height hZoom hRotate3d hPan

try    
    % Zoom
    if get(handles.optAxesToolZoom,'Value')==1               
        hZoom = zoom;
        hZoom.Enable = 'on';        
        setAllowAxesZoom(hZoom,handles.axImage,true);
        setAllowAxesZoom(hZoom,handles.axVSI,true);
        setAllowAxesZoom(hZoom,handles.axSurface,true);
        setAllowAxesZoom(hZoom,handles.axCursor,false);
        setAllowAxesZoom(hZoom,handles.axRowRoughness,true);
        setAllowAxesZoom(hZoom,handles.axColumnRoughness,true);        
        set(hZoom,'ButtonDownFilter',@myFilter);        
    else
        try
            hZoom.Enable = 'off';
            delete(hZoom)
        catch
        end
    end    
    
    % Rotate3D
    if get(handles.optAxesToolRotate3D,'Value')==1               
        hRotate3d = rotate3d;
        hRotate3d.Enable = 'on';        
        setAllowAxesRotate(hRotate3d,handles.axImage,false);
        setAllowAxesRotate(hRotate3d,handles.axVSI,false);
        setAllowAxesRotate(hRotate3d,handles.axSurface,true);
        setAllowAxesRotate(hRotate3d,handles.axCursor,false);
        setAllowAxesRotate(hRotate3d,handles.axRowRoughness,false);
        setAllowAxesRotate(hRotate3d,handles.axColumnRoughness,false);        
        set(hRotate3d,'ButtonDownFilter',@myFilter);        
    else
        try
            hRotate3d.Enable = 'off';
            delete(hRotate3d)
        catch
        end
    end    
    
    %Pan
    if get(handles.optAxesToolPan,'Value')==1               
        hPan = pan;
        hPan.Enable = 'on';        
        setAllowAxesPan(hPan,handles.axImage,true);
        setAllowAxesPan(hPan,handles.axVSI,true);
        setAllowAxesPan(hPan,handles.axSurface,true);
        setAllowAxesPan(hPan,handles.axCursor,false);
        setAllowAxesPan(hPan,handles.axRowRoughness,true);
        setAllowAxesPan(hPan,handles.axColumnRoughness,true);        
        set(hPan,'ButtonDownFilter',@myFilter);        
    else
        try
            hPan.Enable = 'off';
            delete(hPan)
        catch
        end
    end    
    
catch ex
    hmsg = msgbox(ex.message,'Axes tool error','warn','modal');
    frames = java.awt.Frame.getFrames();
    frames(end).setAlwaysOnTop(1);
    uiwait(hmsg);
end