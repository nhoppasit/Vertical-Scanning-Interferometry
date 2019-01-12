global height hSurface

set(findall(handles.figMain, '-property', 'enable'), 'enable', 'off')
try
    
    folder_name = get(handles.txtFolder,'String');
    load([folder_name '/vsi_data/image_family.mat'])
    
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
    
    try
        load([folder_name '/vsi_data/vsi_temp.mat']);
        height = zz;
        try
            delete(hSurface);
        catch
        end
        dz_dx = str2double(get(handles.txtDz_Dx,'String'));
        dz_dy = str2double(get(handles.txtDz_Dy,'String'));
        zz = orient(xx,yy,zz,dz_dx,dz_dy,0);
        height = zz;
        hSurface = surf(handles.axSurface,xx,yy,zz);
        
        shading(axSurface,'interp');
        colormap(axSurface,'jet');
        axis(axSurface,'ij')
        axis(axSurface,[1 nx 1 ny])
        view(axSurface,2)
        drawnow

        fig = figure;
        ax = axes;   
        new_handle = copyobj(hSurface,ax);

        scr_bind_measurement;        
    catch
        hmsg = msgbox('Previous VSI analysis not found!','VSI draw now error','warn','modal');
        frames = java.awt.Frame.getFrames();
        frames(end).setAlwaysOnTop(1);
        uiwait(hmsg);
    end
    
    
catch ex
    hmsg = msgbox(ex.message,'VSI analysis error','warn','modal');
    frames = java.awt.Frame.getFrames();
    frames(end).setAlwaysOnTop(1);
    uiwait(hmsg);
end

set(findall(handles.figMain, '-property', 'enable'), 'enable', 'on')