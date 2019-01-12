try
    %% เปิดไออะลอคโฟลเดอร์
    folder_name = get(handles.txtFolder,'String');    
    if ~isempty(folder_name) && ischar(folder_name)
        folder_name = uigetdir(folder_name);
    else
        folder_name = uigetdir;
    end
    
    %% ตรวจสอบโฟลเดอร์ 
    % เรียกข้อมูลเก่า
    %    ก. ได้ - อ่านข้อมูลค่าตั้ง
    %    ข. ไม่ได้ - ปล่อยไว้เฉยๆ
    if isequal(folder_name,[]) || ~ischar(folder_name)
        return
    else
        set(handles.txtFolder,'String',folder_name);
        reload_all;
        
    end
catch ex
    hmsg = msgbox(ex.message,'Load data error','warn','modal');
    frames = java.awt.Frame.getFrames();
    frames(end).setAlwaysOnTop(1);
    uiwait(hmsg);
end