% Script Title
% Script for import image to *.mat
% Design by SOMPHOP SAEJIA, 2017
% DEV.THEPROGRAM@GMAIL.COM

% อ่านค่าจาก GUI
warning off
set(findall(handles.figMain, '-property', 'enable'), 'enable', 'off')
hui = [];
try
    optImColor = get(handles.optColor,'Value');
    imFamily = get(handles.txtImageFamily,'String');
    startID = str2num(get(handles.txtStartImageID,'String'));
    endID = str2num(get(handles.txtEndImageID,'String'));
    imScale = get(handles.sldImageScale,'Value');
    folder_name = handles.Folder;
    
    % เริ่มคำนวณ
    hui = waitbar(0,'Import image to workspace...','Name','Image import','windowstyle','modal');
    frames = java.awt.Frame.getFrames();
    frames(end).setAlwaysOnTop(1); 
    folder_data = [folder_name '/vsi_data'];
    mkdir(folder_data);
    steps = endID - startID + 1;
    for im_id = startID:endID
        imName = [num2str(im_id) '.' imFamily];
        file = fullfile(folder_name,imName);
        img = imread(file);
        img = imresize(img,imScale/100);
        if optImColor==1 % Color
            gray_img = rgb2gray(img);
        else
            gray_img = img;
        end
        ax = handles.axImage;
        imshow(gray_img,'Parent', ax);
        title(ax,imName)
        drawnow;
        gray_struc(im_id).gray_img = gray_img;
        handles.gray_struc = gray_struc;
        guidata(hObject,handles);
        set(handles.btnImport,'String',['Imported ' num2str(im_id) '/' num2str(endID)]);
        save([folder_data '/GrayImage.mat'],'gray_struc')
        save([folder_data '/current_import.mat'],'im_id','endID')
        waitbar((im_id-startID)/steps,hui,sprintf('Import image to workspace...%d/%d',im_id,endID));
    end % end for
    set(handles.btnImport,'String','Import completed successfuly.');
    close(hui);   
    hui = [];
    hmsg = msgbox('Image import completed successfully.','Image import','help');
    frames = java.awt.Frame.getFrames();
    frames(end).setAlwaysOnTop(1); 
    uiwait(hmsg);
catch ex
    if ~isempty(hui)
        try
            close(hui)
        catch
        end
    end
    hmsg = msgbox(ex.message,'Image import error','warn','modal');
    frames = java.awt.Frame.getFrames();
    frames(end).setAlwaysOnTop(1); 
    uiwait(hmsg);
end
set(findall(handles.figMain, '-property', 'enable'), 'enable', 'on')
warning on