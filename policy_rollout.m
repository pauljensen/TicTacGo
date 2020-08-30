function [move] = policy_rollout(game,nsims)

if nargin < 2
    nsims = 100;
end

moves = available_moves(game);
scores = zeros(size(moves));

winners = repmat(' ',1,nsims);
for i = 1:length(moves)
    updated = make_move(game,'X',moves(i));
    for k = 1:nsims
        [~,winners(k)] = play_game(updated);
    end
    scores(i) = sum(winners == 'X');
end

[~,idx] = max(scores);
move = moves(idx);
