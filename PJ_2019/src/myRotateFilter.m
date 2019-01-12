function [disallowRotation] = myRotateFilter(obj,eventdata)
disallowRotation = false;
% if a ButtonDownFcn has been defined for the object, then use that
if isfield(get(obj),'ButtonDownFcn')
    disallowRotation = ~isempty(get(obj,'ButtonDownFcn'));
end