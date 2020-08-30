function [moves] = available_moves(board)
% Linear indices of the available spaces on a board.
%
% Inputs
%   BOARD  Board (char array) or game structure.
%
% Returns
%   Integer array of linear indices.

if isstruct(board)
    board = board.board;
end

moves = find(board(:) == ' ')';
