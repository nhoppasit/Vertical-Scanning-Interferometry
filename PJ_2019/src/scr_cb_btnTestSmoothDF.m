global hImage hCenter hCircular % For image axis

try
    folder_name = get(handles.txtFolder,'String');
    try
        load([folder_name '/vsi_data/GrayImage.mat']);
    catch
        hmsg = msgbox('vsi_data/GrayImage.mat not found!','Peak detection test error','warn','modal');
        frames = java.awt.Frame.getFrames();
        frames(end).setAlwaysOnTop(1);
        uiwait(hmsg);
        return
    end
    startID = str2double(get(handles.txtStartImageID,'String'));
    endID = str2double(get(handles.txtEndImageID,'String'));
    cx = str2double(get(handles.txtCenterX,'String'));
    cy = str2double(get(handles.txtCenterY,'String'));
    r = str2double(get(handles.txtRadius,'String'));
    try
        load([folder_name '/vsi_data/mask.mat']);
    catch
        hmsg = msgbox('vsi_data/mask.mat not found!','Peak detection test error','warn','modal');
        frames = java.awt.Frame.getFrames();
        frames(end).setAlwaysOnTop(1);
        uiwait(hmsg);
        return
    end
    imFamily = get(handles.txtImageFamily,'String');
    
    dh = str2double(get(handles.txtScanThickness,'String'));
    df = str2double(get(handles.txtPeakDF,'String'));
    ds = str2double(get(handles.txtSmoothDF,'String'));
    pd = str2double(get(handles.txtPolyfitDegree,'String'));
    
    axImage = handles.axImage;
    axVSI = handles.axVSI;
    
    im_id = 1;
    gray_img = gray_struc(im_id).gray_img;
    xci = linspace(cx - r,cx + r,180);
    y1 = sqrt(r^2 - (xci-cx).^2) + cy;
    y2 = -sqrt(r^2 - (xci-cx).^2) + cy;
    y1 = real(y1);
    y2 = real(y2);

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
    
    cla(axImage);
    hImage = imshow(gray_img,'Parent',axImage);
    hold(axImage,'on');
    hCenter = plot(axImage,cx,cy,'+r');
    hCircular = plot(axImage,xci,y1,'--r',xci,y2,'--r');
    title(axImage,[num2str(im_id) '.' imFamily])
    axis(axImage,'on')
    hold(axImage,'off');
    drawnow
    
    hmsg = msgbox('Select test PIXEL [x,y] by mouse.','Peak detection test','help','modal');
    frames = java.awt.Frame.getFrames();
    frames(end).setAlwaysOnTop(1);
    uiwait(hmsg);

    [ci,ri] = ginput(1);
    ci = round(ci);
    ri = round(ri);          
    
    clear I
    for im_id = startID:endID % จากทุกรูป
        gray_img = gray_struc(im_id).gray_img;  % ต้องโหลดไว้แล้ว
        I(:,im_id) = gray_img(ri,ci)';
        cla(axImage);
        hImage = imshow(gray_img,'Parent',axImage);
        hold(axImage,'on');
        hCenter = plot(axImage,cx,cy,'+r',ci,ri,'*y');
        hCircular = plot(axImage,xci,y1,'--r',xci,y2,'--r');
        title(axImage,[num2str(im_id) '.' imFamily ', Pixel: <' num2str(ci) ',' num2str(ri) '>'])
        axis(axImage,'on')
        hold(axImage,'off');
        drawnow
        cla(axVSI)
        plot(axVSI,[startID:im_id]*dh,I);
        axis(axVSI,[startID*dh endID*dh 0 255]);
        title(axVSI,['Scan: ' num2str(im_id*dh) ' nm']);
        drawnow
    end
    ici = 1;
    smooth_df = length(I(ici,:))/df;
    xi = [startID:endID]*dh;
    ye = env_secant(xi,double(I(ici,:)),smooth_df,'top');
    ys = smooth(ye,ds);
    mys = max(ys);
    mid = round(mean(find(ys==mys)));
    hold(axVSI,'on');
    hp = plot(axVSI,xi,ye,'--r',xi,ys,'b',xi(mid),mys,'ob');
    title(axVSI,['Maximum : <ID-' num2str(mid) ',' num2str(xi(mid)) ' nm >'])
    hold(axVSI,'off');
    axis(axVSI,[startID*dh endID*dh 0 255])
    drawnow
    save([folder_name '/vsi_data/analysis_curves.mat'],'startID','endID','dh','I','xi','ye','ys','mid','mys');
catch ex
    hmsg = msgbox(ex.message,'Smooth test error','warn','modal');
    frames = java.awt.Frame.getFrames();
    frames(end).setAlwaysOnTop(1);
    uiwait(hmsg);
end