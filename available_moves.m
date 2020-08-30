function [moves] = available_moves(board)

if isstruct(board)
    board = board.board;
end

moves = find(board(:) == ' ')';
