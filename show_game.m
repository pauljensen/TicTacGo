function show_game(game,score)

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
    scorefun = @scorefun_straight_quad;
    score = true;
end

if score
    [~,scoreX,scoreO] = score_game(game,scorefun);
    fprintf('Score: X''s = %g, O''s = %g\n',scoreX,scoreO);
end

nX = last_index(game.movesX);
nO = last_index(game.movesO);
next = game.first;
if nX > nO
    next = 'O';
elseif nO > nX
    next = 'X';
end
fprintf('Next move is %s.\n',next);
