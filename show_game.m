function show_game(game,scoreargs)
% Show the game board, score, and next move.
%
% Inputs
%   GAME       Game structure.
%   SCOREARGS  Cell array or arguments passed to SCORE_GAME. Default = {}.

[m,n] = size(game.board);
hline = ['+' repmat('---+',1,n) '\n'];

fprintf(['\n' hline]);
for i = 1:m
    fprintf('|');
    for j = 1:n
        fprintf([' ' game.board(i,j) ' |']);
    end
    fprintf(['\n' hline]);
end

if nargin < 2
    scoreargs = {};
end

[winner,scoreX,scoreO] = score_game(game,scoreargs{:});
fprintf('Score: X''s = %g, O''s = %g\n',scoreX,scoreO);

nX = last_index(game.movesX);
nO = last_index(game.movesO);
next = game.first;
if nX > nO
    next = 'O';
elseif nO > nX
    next = 'X';
end

if ~isempty(available_moves(game.board))
    fprintf('Next move is %s.\n',next);
else
    fprintf('Game is complete.\n');
    if winner == 't'
        fprintf('Draw.\n');
    else
        fprintf('%s wins.\n',winner);
    end
end
