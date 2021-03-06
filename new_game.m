function [game] = new_game(dims,nblocked,first)
% Create a new game structure.
%
% Inputs
%   dims      Size of the gameboard. Length 2 array of integers.
%   nblocked  Number of spaces to block. Locations are picked randomly.
%   first     The player that goes first. Either 'X' or 'O'.

if nargin < 3
    first = 'X';
end

if nargin < 2
    nblocked = 4;
end

if nargin < 1
    dims = [4 4];
end

game = struct;
game.board = repmat(' ',dims);
n = prod(dims);

navail = n - nblocked;
game.first = first;
if first == 'X'
    game.movesX = zeros(1,ceil(navail/2),'int8');
    game.movesO = zeros(1,floor(navail/2),'int8');
else
    game.movesX = zeros(1,floor(navail/2),'int8');
    game.movesO = zeros(1,ceil(navail/2),'int8');
end

game.blocked = randperm(n,nblocked);
game.board(game.blocked) = '-';
