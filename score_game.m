function [winner,scoreX,scoreO] = score_game(game,scorefun)

if nargin < 2
    scorefun = @scorefun_straight_quad;
end

scoreX = scorefun(game.board == 'X');
scoreO = scorefun(game.board == 'O');

if ~isempty(available_moves(game))
    winner = '?';
else
    winner = 't';
    if scoreX > scoreO
        winner = 'X';
    elseif scoreO > scoreX
        winner = 'O';
    end
end
