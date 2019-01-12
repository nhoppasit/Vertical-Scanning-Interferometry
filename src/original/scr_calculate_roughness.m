global height

try    
    % Horizontal
    hhHorizontaltmp = hhHorizontal(hhHorizontal~=0);
    hhHorizontalpv = max(hhHorizontaltmp) - min(hhHorizontaltmp);
    zbar = mean(hhHorizontaltmp);
    hhHorizontalavg = mean(abs(hhHorizontaltmp-zbar));
    hhHorizontalrms = sqrt( mean( (hhHorizontaltmp-zbar).^2) );
    hhHorizontaltmp = hhHorizontal*0 + zbar;
        
    % Vertical
    hhVerticaltmp = hhVertical(hhVertical~=0);
    hhVerticalpv = max(hhVerticaltmp) - min(hhVerticaltmp);
    zbar = mean(hhVerticaltmp);
    hhVerticalavg = mean(abs(hhVerticaltmp-zbar));
    hhVerticalrms = sqrt( mean( (hhVerticaltmp-zbar).^2) );
    hhVerticaltmp = hhVertical*0 + zbar;
    
    % 3D
    htmp = height(height~=0);
    hpv3d = max(htmp) - min(htmp);
    zbar = mean(htmp);
    havg3d = mean(abs(htmp-zbar));
    hrms3d = sqrt( mean( (htmp-zbar).^2) );
    
    folder_name = get(handles.txtFolder,'String');
    save([folder_name '/vsi_data/roughness.mat']);      
    
catch ex
    hmsg = msgbox(ex.message,'Calculate roughness error','warn','modal');
    frames = java.awt.Frame.getFrames();
    frames(end).setAlwaysOnTop(1);
    uiwait(hmsg);
end