function [last] = last_index(a)
% The index of the last nonzero element in an array.

last = find(a ~= 0,1,'last');
if isempty(last)
    last = 0;
end
