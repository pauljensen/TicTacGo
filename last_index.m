function [last] = last_index(a)

last = find(a > 0,1,'last');
if isempty(last)
    last = 0;
end
