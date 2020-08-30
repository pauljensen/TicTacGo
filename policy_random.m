function [move] = policy_random(game)
% Pick a valid move for X randomly.

avail = available_moves(game);
move = avail(randperm(length(avail),1));
