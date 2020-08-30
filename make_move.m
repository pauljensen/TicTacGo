function [game] = make_move(game,player,location)
% Make a move on the board.
%
% Inputs
%   GAME      Game structure.
%   PLAYER    Either 'X' or 'O'.
%   LOCATION  Linear or (i,j) index of the move.

if length(location) > 1
    location = sub2ind(size(game.board),location(1),location(2));
end

assert(ismember(player,'XO'), 'player must be ''X'' or ''O''');
assert(game.board(location) == ' ', 'invalid move');

game.board(location) = player;
if player == 'X'
    game.movesX(last_index(game.movesX)+1) = location;
else
    game.movesO(last_index(game.movesO)+1) = location;
end
