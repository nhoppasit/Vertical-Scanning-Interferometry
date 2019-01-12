global height hCursor hLine3D
try
    x =  round(get(handles.sldColumnCursor,'Value'));
    y =  -round(get(handles.sldRowCursor,'Value'));
    xHorizontal = 1:size(height,2);
    yHorizontal = xHorizontal*0 + y;
    yVertical = 1:size(height,1);
    xVertical = yVertical*0 + x;
    oHorizontal = [xHorizontal; yHorizontal];
    oVertical = [xVertical; yVertical];
    try
        delete(hCursor);
    catch
    end
    hold(handles.axCursor,'on');
    hCursor = plot(handles.axCursor,oHorizontal(1,:),oHorizontal(2,:),oVertical(1,:),oVertical(2,:));
    hold(handles.axCursor,'off');
    drawnow;
    
    [dRow,dCol] = size(height);
    idxVertical = (oVertical(1,:)-1)*dRow + oVertical(2,:);
    idHorizontal = (oHorizontal(1,:)-1)*dRow + oHorizontal(2,:);
    hhVertical = height(idxVertical);
    hhHorizontal = height(idHorizontal);
        
    % Line 3D on surface
    if get(handles.chkPlot3D,'Value')==1
        try
            delete(hLine3D);
        catch
        end
        hold(handles.axSurface,'on');
        hLine3D = plot3(handles.axSurface,oVertical(1,:),oVertical(2,:),hhVertical,oHorizontal(1,:),oHorizontal(2,:),hhHorizontal);
        hold(handles.axSurface,'off');
        drawnow;
    end

    scr_calculate_roughness;

    axRowRoughness = handles.axRowRoughness;
    my = max(max(height))*1.1;
    cla(axRowRoughness);
    hold(axRowRoughness,'on')
    plot(axRowRoughness,hhHorizontaltmp,'y');
    plot(axRowRoughness,hhHorizontal);
    axis(axRowRoughness,[1 dCol 0 my])
    hold(axRowRoughness,'off')
    grid(axRowRoughness,'on')
    title(axRowRoughness,['<R_{pv},R_{rms},R_{avg}>  = <' sprintf('%0.0f',hhHorizontalpv) ',' sprintf('%0.0f',hhHorizontalrms) ',' sprintf('%0.0f',hhHorizontalavg) ',' '> nm'])
    drawnow
    
    axColumnRoughness = handles.axColumnRoughness;    
    my = max(max(height))*1.1;
    cla(axColumnRoughness);
    hold(axColumnRoughness,'on')
    plot(axColumnRoughness,hhVerticaltmp,'y');
    plot(axColumnRoughness,hhVertical);
    axis(axColumnRoughness,[1 dRow 0 my]);
    hold(axColumnRoughness,'off')
    grid(axColumnRoughness,'on')
    title(axColumnRoughness,['<R_{pv},R_{rms},R_{avg}>  = <' sprintf('%0.0f',hhVerticalpv) ',' sprintf('%0.0f',hhVerticalrms) ',' sprintf('%0.0f',hhVerticalavg) ',' '> nm'])
    drawnow
    
    title(handles.axSurface,['<R_{pv},R_{rms},R_{avg}>  = <' sprintf('%0.0f',hpv3d) ',' sprintf('%0.0f',hrms3d) ',' sprintf('%0.0f',havg3d) ',' '> nm'])
    drawnow
catch
end