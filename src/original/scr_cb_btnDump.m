try
    %% Selected dumped axis
    selectedIndex = get(handles.cboDump,'Value');
    selectedText = get(handles.cboDump,'String');
    % Surface
    % Vertical Roughness
    % Horizontal Roughness
    % VSI curve
    % Image
    % Image-Mask
    
    switch upper(selectedText{selectedIndex})
        case 'SURFACE'
            %% Draw surface
            folder_name = get(handles.txtFolder,'String');
            load([folder_name '/vsi_data/GrayImage.mat']);
            gray_img = gray_struc(1).gray_img;
            [ny,nx] = size(gray_img);
            [xx,yy] = meshgrid(1:nx,1:ny);
            load([folder_name '/vsi_data/vsi_temp.mat']);
            height = zz;

            dz_dx = str2double(get(handles.txtDz_Dx,'String'));
            dz_dy = str2double(get(handles.txtDz_Dy,'String'));
            zz = orient(xx,yy,zz,dz_dx,dz_dy,0);
            height = zz;

            figure;
            surf(xx,yy,zz);
            shading('interp');
            colormap(jet(256));
            axis('ij')
            axis([1 nx 1 ny])
            view(3)
            drawnow
            
            %% Draw plot line in 3d
            x =  round(get(handles.sldColumnCursor,'Value'));
            y =  -round(get(handles.sldRowCursor,'Value'));
            xHorizontal = 1:size(height,2);
            yHorizontal = xHorizontal*0 + y;
            yVertical = 1:size(height,1);
            xVertical = yVertical*0 + x;
            oHorizontal = [xHorizontal; yHorizontal];
            oVertical = [xVertical; yVertical];
            
            [dRow,dCol] = size(height);
            idxVertical = (oVertical(1,:)-1)*dRow + oVertical(2,:);
            idHorizontal = (oHorizontal(1,:)-1)*dRow + oHorizontal(2,:);
            hhVertical = height(idxVertical);
            hhHorizontal = height(idHorizontal);
            
            % Line 3D on surface
            if get(handles.chkPlot3D,'Value')==1
                hold('on');
                plot3(oVertical(1,:),oVertical(2,:),hhVertical,oHorizontal(1,:),oHorizontal(2,:),hhHorizontal);
                hold('off');
                drawnow;
            end
        case 'VERTICAL ROUGHNESS'
            %% Draw vertical roughness
            folder_name = get(handles.txtFolder,'String');
            load([folder_name '/vsi_data/roughness.mat']);
            
            %% Line in 3d
            x =  round(get(handles.sldColumnCursor,'Value'));
            y =  -round(get(handles.sldRowCursor,'Value'));
            xHorizontal = 1:size(height,2);
            yHorizontal = xHorizontal*0 + y;
            yVertical = 1:size(height,1);
            xVertical = yVertical*0 + x;
            oHorizontal = [xHorizontal; yHorizontal];
            oVertical = [xVertical; yVertical];
            
            [dRow,dCol] = size(height);
            idxVertical = (oVertical(1,:)-1)*dRow + oVertical(2,:);
            idHorizontal = (oHorizontal(1,:)-1)*dRow + oHorizontal(2,:);
            hhVertical = height(idxVertical);
            hhHorizontal = height(idHorizontal);
            
            % Vertical
            hhVerticaltmp = hhVertical(hhVertical~=0);
            hhVerticalpv = max(hhVerticaltmp) - min(hhVerticaltmp);
            zbar = mean(hhVerticaltmp);
            hhVerticalavg = mean(abs(hhVerticaltmp-zbar));
            hhVerticalrms = sqrt( mean( (hhVerticaltmp-zbar).^2) );
            hhVerticaltmp = hhVertical*0 + zbar;
            my = max(max(height))*1.1;
            
            figure
            cla;
            hold('on')
            plot(hhVerticaltmp,'y');
            plot(hhVertical);
            axis([1 dRow 0 my]);
            hold('off')
            grid('on')
            title(['<R_{pv},R_{rms},R_{avg}>  = <' sprintf('%0.0f',hhVerticalpv) ',' sprintf('%0.0f',hhVerticalrms) ',' sprintf('%0.0f',hhVerticalavg) ',' '> nm'])
            drawnow
            
        case 'HORIZONTAL ROUGHNESS'
            %% Draw horizontal roughness
            folder_name = get(handles.txtFolder,'String');
            load([folder_name '/vsi_data/roughness.mat']);
            
            %% Line in 3d
            x =  round(get(handles.sldColumnCursor,'Value'));
            y =  -round(get(handles.sldRowCursor,'Value'));
            xHorizontal = 1:size(height,2);
            yHorizontal = xHorizontal*0 + y;
            yVertical = 1:size(height,1);
            xVertical = yVertical*0 + x;
            oHorizontal = [xHorizontal; yHorizontal];
            oVertical = [xVertical; yVertical];
            
            [dRow,dCol] = size(height);
            idxVertical = (oVertical(1,:)-1)*dRow + oVertical(2,:);
            idHorizontal = (oHorizontal(1,:)-1)*dRow + oHorizontal(2,:);
            hhVertical = height(idxVertical);
            hhHorizontal = height(idHorizontal);
            
            % Horizontal
            hhHorizontaltmp = hhHorizontal(hhHorizontal~=0);
            hhHorizontalpv = max(hhHorizontaltmp) - min(hhHorizontaltmp);
            zbar = mean(hhHorizontaltmp);
            hhHorizontalavg = mean(abs(hhHorizontaltmp-zbar));
            hhHorizontalrms = sqrt( mean( (hhHorizontaltmp-zbar).^2) );
            hhHorizontaltmp = hhHorizontal*0 + zbar;
            my = max(max(height))*1.1;
            
            figure
            cla;
            hold('on')
            plot(hhHorizontaltmp,'y');
            plot(hhHorizontal);
            axis([1 dCol 0 my]);
            hold('off')
            grid('on')
            title(['<R_{pv},R_{rms},R_{avg}>  = <' sprintf('%0.0f',hhHorizontalpv) ',' sprintf('%0.0f',hhHorizontalrms) ',' sprintf('%0.0f',hhHorizontalavg) ',' '> nm'])
            drawnow
            
        case 'VSI CURVE'
            folder_name = get(handles.txtFolder,'String');
            load([folder_name '/vsi_data/analysis_curves.mat']);
            figure;
            plot([startID:endID]*dh,I);
            axis([startID*dh endID*dh 0 255]);
            drawnow
            hold('on');
            try
                plot(xi,ye,'--r',xi,ys,'k',xi(mid),mys,'ob');
            catch
                plot(xi,ye,'--r',xi(mid),mys,'ob');
            end
            title(['Maximum : <ID-' num2str(mid) ',' num2str(xi(mid)) ' nm >'])
            hold('off');
            axis([startID*dh endID*dh 0 255])
            drawnow
            
        case 'IMAGE'
            prompt = {'Enter image index:'};
            dlg_title = 'Image index';
            num_lines = 1;
            def = {'1'};
            answer = inputdlg(prompt,dlg_title,num_lines,def);
            
            folder_name = get(handles.txtFolder,'String');
            load([folder_name '/vsi_data/GrayImage.mat'])
            I = gray_struc(round(str2double(answer{1}))).gray_img;            
            
            figure;
            imshow(I);            
            title([answer{1} '.' get(handles.txtImageFamily,'String')])
            axis('on')
            
        case 'IMAGE-MASK'            
            prompt = {'Enter image index:'};
            dlg_title = 'Image index';
            num_lines = 1;
            def = {'1'};
            answer = inputdlg(prompt,dlg_title,num_lines,def);
            
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
            I = gray_struc(round(str2double(answer{1}))).gray_img;
            
            xci = linspace(cx - r,cx + r,180);
            y1 = sqrt(r^2 - (xci-cx).^2) + cy;
            y2 = -sqrt(r^2 - (xci-cx).^2) + cy;
            y1 = real(y1);
            y2 = real(y2);
            
            figure;
            imshow(I);
            hold('on');
            plot(cx,cy,'+r');
            plot(xci,y1,'--r',xci,y2,'--r');
            title([answer{1} '.' get(handles.txtImageFamily,'String')])
            axis('on')
            hold('off');
            
    end
    
catch ex
    hmsg = msgbox(ex.message,'Dump error','warn','modal');
    frames = java.awt.Frame.getFrames();
    frames(end).setAlwaysOnTop(1);
    uiwait(hmsg);
end