global hImage hCenter hCircular % For image axis

try
    try
        cx = handles.CenterX;
    catch
        cx = str2double(get(handles.txtCenterX,'String'));
    end
    try
        cy = handles.CenterY;
    catch
        cy = str2double(get(handles.txtCenterY,'String'));
    end
    try
        r = handles.Radius;
    catch
        r = str2double(get(handles.txtRadius,'String'));
    end
    
    folder_name = get(handles.txtFolder,'String');
    load([folder_name '/vsi_data/GrayImage.mat'])
    I = gray_struc(1).gray_img;
    
    xci = linspace(cx - r,cx + r,180);
    y1 = sqrt(r^2 - (xci-cx).^2) + cy;
    y2 = -sqrt(r^2 - (xci-cx).^2) + cy;    
    y1 = real(y1);
    y2 = real(y2);
    
    [ny,nx] = size(I);
    [xx,yy] = meshgrid(1:nx,1:ny);
    mask = uint8( (xx-cx).^2 + (yy-cy).^2 <= r^2 );
    save([folder_name '/vsi_data/mask.mat'],'mask');
    
    if ~isempty(hImage)
        try
            delete(hImage);
        catch
        end
    end
    if ~isempty(hCenter)
        try
            delete(hCenter);
        catch
        end
    end
    if ~isempty(hCircular)
        try
            delete(hCircular);
        catch
        end
    end
    ax = handles.axImage;
    cla(ax);
    hImage = imshow(I,'Parent',ax);
    hold(ax,'on');
    hCenter = plot(ax,cx,cy,'+r');
    hCircular = plot(ax,xci,y1,'--r',xci,y2,'--r');    
    title(ax,['1.' get(handles.txtImageFamily,'String')])
    axis(ax,'on')
    hold(ax,'off');
catch ex
    hmsg = msgbox(ex.message,'Circular area error','warn','modal');
    frames = java.awt.Frame.getFrames();
    frames(end).setAlwaysOnTop(1);
    uiwait(hmsg);
end
