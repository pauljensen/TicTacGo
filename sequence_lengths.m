function [lengths] = sequence_lengths(a)
% The lengths of all sequences of TRUEs in a logical vector.

lengths = [];
in = false;
for i = a(:)'
    if i && in
        lengths(end) = lengths(end) + 1;
    elseif i
        lengths(end+1) = 1;
        in = true;
    else
        in = false;
    end
end
