try    
    ScanThickness = str2double(get(handles.txtScanThickness,'String'));
    handles.ScanThickness = ScanThickness;
    guidata(hObject,handles);
    folder_name = get(handles.txtFolder,'String');
    save([folder_name '/vsi_data/ScanThickness.mat'],'ScanThickness');
catch
end