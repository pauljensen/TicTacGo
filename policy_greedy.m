function [move] = policy_greedy(game)

moves = available_moves(game);
scores = zeros(size(moves));

for i = 1:length(moves)
    [~,scores(i),~] = score_game(make_move(game,'X',moves(i)));
end

[~,idx] = max(scores);
move = moves(idx);
