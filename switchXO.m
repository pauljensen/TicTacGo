function [game] = switchXO(game)
% Switch X and O in a game structure.

if game.first == 'X'
    game.first = 'O';
else
    game.first = 'X';
end

temp = game.movesX;
game.movesX = game.movesO;
game.movesO = temp;

locsX = game.board == 'X';
locsO = game.board == 'O';
game.board(locsX) = 'O';
game.board(locsO) = 'X';
