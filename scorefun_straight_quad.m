function [score] = scorefun_straight_quad(board)

score = 0;

[m,n] = size(board);
for i = 1:m
    score = score + sum((sequence_lengths(board(i,:))-1).^2);
end
for j = 1:n
    score = score + sum((sequence_lengths(board(:,j))-1).^2);
end
