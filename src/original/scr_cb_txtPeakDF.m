try    
    PeakDF = str2double(get(handles.txtPeakDF,'String'));
    handles.PeakDF = PeakDF;
    guidata(hObject,handles);
    folder_name = get(handles.txtFolder,'String');
    save([folder_name '/vsi_data/PeakDF.mat'],'PeakDF');
catch
end