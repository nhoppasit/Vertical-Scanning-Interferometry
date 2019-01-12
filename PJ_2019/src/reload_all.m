%% เรียกโฟลเดอร์
folder_name = get(handles.txtFolder,'String');
save('vsi_last_folder.mat','folder_name');

%% ตรวจสอบข้อมูล
canLoad = 0;
try
    load([folder_name '/vsi_data/image_family.mat']);
    canLoad = 1;
catch
    hmsg = msgbox('VSI data not found! New vsi_data folder going to make now.','Load VSI data','help','modal');
    frames = java.awt.Frame.getFrames();
    frames(end).setAlwaysOnTop(1);
    uiwait(hmsg);
    
    save_all;
    
    return;
end

%% Load vsi data
if canLoad==1
    try
        load([folder_name '/vsi_data/image_family.mat'])
        set(handles.txtImageFamily,'String',imFamily);
    catch ex
        hmsg = msgbox(ex.message,'Load image family.','warn','modal');
        frames = java.awt.Frame.getFrames();
        frames(end).setAlwaysOnTop(1);
        uiwait(hmsg);
        return
    end
    
    try
        load vsi_last_folder
        load([folder_name '/vsi_data/start_id.mat'])
        set(handles.txtStartImageID,'String',startID);
    catch ex
        hmsg = msgbox(ex.message,'Load image start index.','warn','modal');
        frames = java.awt.Frame.getFrames();
        frames(end).setAlwaysOnTop(1);
        uiwait(hmsg);
        return
    end
    
    try
        load vsi_last_folder
        load([folder_name '/vsi_data/end_id.mat'])
        set(handles.txtEndImageID,'String',endID);
    catch ex
        hmsg = msgbox(ex.message,'Load image end index.','warn','modal');
        frames = java.awt.Frame.getFrames();
        frames(end).setAlwaysOnTop(1);
        uiwait(hmsg);
        return
    end
    
    try
        load vsi_last_folder
        load([folder_name '/vsi_data/image_scale.mat'])
        set(handles.txtImageScale,'String',imScale);
    catch ex
        hmsg = msgbox(ex.message,'Load image scale.','warn','modal');
        frames = java.awt.Frame.getFrames();
        frames(end).setAlwaysOnTop(1);
        uiwait(hmsg);
        return
    end
    
    try
        load vsi_last_folder;
        load([folder_name '/vsi_data/current_import.mat']);
        if im_id==endID
            set(handles.btnImport,'String','Import completed successfuly.');
        else
            set(handles.btnImport,'String',['Imported ' num2str(im_id) '/' num2str(endID)]);
        end
    catch ex
        set(handles.btnImport,'String','Import')
        hmsg = msgbox([ex.message ' Please re-import by Import button.'],'Import image.','warn','modal');
        frames = java.awt.Frame.getFrames();
        frames(end).setAlwaysOnTop(1);
        uiwait(hmsg);
        return
    end
    
    try
        load vsi_last_folder
        load([folder_name '/vsi_data/center_x.mat'])
        set(handles.txtCenterX,'String',cx);
    catch ex
        hmsg = msgbox(ex.message,'Load center [x,y]','warn','modal');
        frames = java.awt.Frame.getFrames();
        frames(end).setAlwaysOnTop(1);
        uiwait(hmsg);
        return
    end
    
    try
        load vsi_last_folder
        load([folder_name '/vsi_data/center_y.mat'])
        set(handles.txtCenterY,'String',cy);
    catch ex
        hmsg = msgbox(ex.message,'Load center [x,y]','warn','modal');
        frames = java.awt.Frame.getFrames();
        frames(end).setAlwaysOnTop(1);
        uiwait(hmsg);
        return
    end
    
    try
        load vsi_last_folder
        load([folder_name '/vsi_data/radius.mat'])
        set(handles.txtRadius,'String',r);
        scr_plot_CircularArea
    catch ex
        hmsg = msgbox(ex.message,'Load radius','warn','modal');
        frames = java.awt.Frame.getFrames();
        frames(end).setAlwaysOnTop(1);
        uiwait(hmsg);
        return
    end
    
    try
        load vsi_last_folder
        load([folder_name '/vsi_data/ScanThickness.mat'])
        set(handles.txtScanThickness,'String',ScanThickness);
    catch ex
        hmsg = msgbox(ex.message,'Load scanning thickness','warn','modal');
        frames = java.awt.Frame.getFrames();
        frames(end).setAlwaysOnTop(1);
        uiwait(hmsg);
        return
    end
    
    try
        load vsi_last_folder
        load([folder_name '/vsi_data/PeakDF.mat'])
        set(handles.txtPeakDF,'String',PeakDF);
    catch ex
        hmsg = msgbox(ex.message,'Load peak dregree of freedom','warn','modal');
        frames = java.awt.Frame.getFrames();
        frames(end).setAlwaysOnTop(1);
        uiwait(hmsg);
        return
    end
    
    try
        load vsi_last_folder
        load([folder_name '/vsi_data/SmoothDF.mat'])
        set(handles.txtSmoothDF,'String',SmoothDF);
    catch ex
        hmsg = msgbox(ex.message,'Load smooth degree of freedom','warn','modal');
        frames = java.awt.Frame.getFrames();
        frames(end).setAlwaysOnTop(1);
        uiwait(hmsg);
        return
    end
    
    try
        load vsi_last_folder
        load([folder_name '/vsi_data/PolyfitDegree.mat'])
        set(handles.txtPolyfitDegree,'String',PolyfitDegree);
    catch ex
        hmsg = msgbox(ex.message,'Load polyfit degree','warn','modal');
        frames = java.awt.Frame.getFrames();
        frames(end).setAlwaysOnTop(1);
        uiwait(hmsg);
        return
    end
    
    try
        load vsi_last_folder
        load([folder_name '/vsi_data/orientation.mat'])
        set(handles.txtDz_Dx,'String',num2str(dz_dx));
        set(handles.txtDz_Dy,'String',num2str(dz_dy));
    catch ex
        hmsg = msgbox(ex.message,'Load orientation','warn','modal');
        frames = java.awt.Frame.getFrames();
        frames(end).setAlwaysOnTop(1);
        uiwait(hmsg);
        return
    end    
    
    try
        load vsi_last_folder
        load([folder_name '/vsi_data/EnvelopMethod.mat'])
        set(handles.cboEnvelopMethod,'Value',EnvelopMethod);
        scr_cb_btnVSIDraw;
    catch ex
        hmsg = msgbox(ex.message,'Load envelop method','warn','modal');
        frames = java.awt.Frame.getFrames();
        frames(end).setAlwaysOnTop(1);
        uiwait(hmsg);
        return
    end
    
end