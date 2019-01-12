global hZoom

try    
    if get(handles.chkZoom,'Value')==1               
        hZoom = zoom;
        hZoom.Enable = 'on';        
        setAllowAxesZoom(hZoom,handles.axImage,true);
        setAllowAxesZoom(hZoom,handles.axVSI,true);
        setAllowAxesZoom(hZoom,handles.axSurface,true);
        setAllowAxesZoom(hZoom,handles.axCursor,false);
        setAllowAxesZoom(hZoom,handles.axRowRoughness,false);
        setAllowAxesZoom(hZoom,handles.axColumnRoughness,false);        
        set(hZoom,'ButtonDownFilter',@myFilter);        
    else
        hZoom.Enable = 'off';    
        delete(hZoom)
    end    
catch ex
    hmsg = msgbox(ex.message,'Zoom tool error','warn','modal');
    frames = java.awt.Frame.getFrames();
    frames(end).setAlwaysOnTop(1);
    uiwait(hmsg);
end