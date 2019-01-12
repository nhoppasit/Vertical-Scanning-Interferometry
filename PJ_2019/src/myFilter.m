function [disallow] = myFilter(obj,eventdata)
disallow = false;
% if a ButtonDownFcn has been defined for the object, then use that
if isfield(get(obj),'ButtonDownFcn')
    disallow = ~isempty(get(obj,'ButtonDownFcn'));
end