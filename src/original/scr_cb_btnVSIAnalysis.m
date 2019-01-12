global height

set(findall(handles.figMain, '-property', 'enable'), 'enable', 'off')
try
    
    folder_name = get(handles.txtFolder,'String');
    imFamily = get(handles.txtImageFamily,'String');
    
    load([folder_name '/vsi_data/GrayImage.mat']);
    s = str2double(get(handles.txtStartImageID,'String'));
    e = str2double(get(handles.txtEndImageID,'String'));
    cx = str2double(get(handles.txtCenterX,'String'));
    cy = str2double(get(handles.txtCenterY,'String'));
    r = str2double(get(handles.txtRadius,'String'));
    load([folder_name '/vsi_data/mask.mat']);
    
    dh = str2double(get(handles.txtScanThickness,'String'));
    df = str2double(get(handles.txtPeakDF,'String'));
    ds = str2double(get(handles.txtSmoothDF,'String'));
    pd = str2double(get(handles.txtPolyfitDegree,'String'));
    
    switch get(handles.cboEnvelopMethod,'Value')
        case 1
            method = 'peak';
        case 2
            method = 'smooth';
        case 3
            method = 'polyfit';
        otherwise
            method = 'peak';
    end
    
    axImage = handles.axImage;
    axVSI = handles.axVSI;
    axSurface = handles.axSurface;
    
    %% เริ่มต้นพิ้นผิว
    
    xci = linspace(cx - r,cx + r,180);
    y1 = sqrt(r^2 - (xci-cx).^2) + cy;
    y2 = -sqrt(r^2 - (xci-cx).^2) + cy;
    y1 = real(y1);
    y2 = real(y2);
    
    gray_img = gray_struc(1).gray_img;
    [ny,nx] = size(gray_img);
    [xx,yy] = meshgrid(1:nx,1:ny);
    zz = xx*0;
    height = zz;
    
    runNew = 0;
    try
        load([folder_name '/vsi_data/vsi_temp.mat']);
        if ri==ny && ci==nx
            choice = questdlg('Warning! Previus VSI analysis completed sucessfuly. Do you want to load last result or run new analysis?', ...
                'VSI analysis', ...
                'Load last result','Run new analysis','Cancel','Cancel');
            switch choice
                case 'Load last result'
                    height = zz;
                    scr_bind_measurement;
                    surf(handles.axSurface,xx,yy,zz)
                    shading(axSurface,'interp');
                    colormap(axSurface,'jet');
                    axis(axSurface,'ij')
                    axis(axSurface,[1,nx,1,ny]);
                    view(axSurface,2)
                    drawnow
                    set(findall(handles.figMain, '-property', 'enable'), 'enable', 'on')
                    return;
                case 'Run new analysis'
                    zz = xx*0;
                    height = zz;
                    runNew = 1;
                case 'Cancel'
                    set(findall(handles.figMain, '-property', 'enable'), 'enable', 'on')
                    return;
            end
        else
            choice = questdlg(['Warning! Previus VSI analysis validated to row of ' num2str(ri) '. Do you want to load last result or run new analysis?'], ...
                'VSI analysis', ...
                'Load last result','Run new analysis','Cancel','Cancel');
            switch choice
                case 'Load last result'
                    height = zz;
                    runNew = 0;
                case 'Run new analysis'
                    zz = xx*0;
                    height = zz;
                    runNew = 1;
                case 'Cancel'
                    set(findall(handles.figMain, '-property', 'enable'), 'enable', 'on')
                    return;
            end
        end
    catch
        zz = xx*0;
        height = zz;
        runNew = 1;
    end
    
    set(handles.chkStopAnalysis, 'enable', 'on')
    scr_bind_measurement;
    surf(handles.axSurface,xx,yy,zz)
    shading(axSurface,'interp');
    colormap(axSurface,'jet');
    axis(axSurface,'ij')
    axis(axSurface,[1,nx,1,ny]);
    view(axSurface,2)
    drawnow
    scr_bind_measurement;
    if runNew==1
        %% วิเคราะห์
        for ri = 1:ny
            %% แต่ละแถว
            if mask(ri,round(nx/2))==1
                [ye,ys,x_mid,zz] = vsi_row([s,e],gray_struc,[handles.axImage,handles.axVSI,handles.axSurface],ri,[cx,cy,r],xci,y1,y2,dh,[df,ds,pd],method,xx,yy,zz);
                height = zz;
                scr_draw_cursor;
                if get(handles.chkStopAnalysis,'Value')==1
                    set(handles.chkStopAnalysis,'Value',0)
                    set(findall(handles.figMain, '-property', 'enable'), 'enable', 'on')
                    return;
                end
            end % in the mask
        end % row
    else
        %% วิเคราะห์ต่อ
        while ri<=ny
            ci = 1;
            %% แต่ละแถว
            if mask(ri,round(nx/2))==1
                [ye,ys,x_mid,zz] = vsi_row([s,e],gray_struc,[handles.axImage,handles.axVSI,handles.axSurface],ri,[cx,cy,r],xci,y1,y2,dh,[df,ds,pd],method,xx,yy,zz);
                height = zz;
                scr_draw_cursor;
                if get(handles.chkStopAnalysis,'Value')==1
                    set(handles.chkStopAnalysis,'Value',0)
                    set(findall(handles.figMain, '-property', 'enable'), 'enable', 'on')
                    return;
                end
            end % in the mask
            ri = ri + 1;
        end % row
    end
    
    
    
catch ex
    hmsg = msgbox([ex.message ' Please check your configuration and image imports.'],'VSI analysis error','warn','modal');
    frames = java.awt.Frame.getFrames();
    frames(end).setAlwaysOnTop(1);
    uiwait(hmsg);
end

set(findall(handles.figMain, '-property', 'enable'), 'enable', 'on')