function [game] = make_random_moves(game,k)

avail = available_moves(game.board);

if nargin < 2
    k = length(avail);
else
    k = min(k,length(avail));
end

nX = sum(game.movesX > 0);
nO = sum(game.movesO > 0);

if nX == nO
    nextX = game.first == 'X';
else
    nextX = nX < nO;
end

Xend = last_index(game.movesX);
Oend = last_index(game.movesO);

moves = avail(randperm(length(avail),k));
for move = moves
    if nextX
        game.board(move) = 'X';
        Xend = Xend + 1;
        game.movesX(Xend) = move;
    else
        game.board(move) = 'O';
        Oend = Oend + 1;
        game.movesO(Oend) = move;
    end
    nextX = ~nextX;
end
