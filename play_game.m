function [game,winner,scoreX,scoreO] = play_game(game,varargin)

if isempty(game)
    game = new_game();
end

p = inputParser;
p.addParameter('policyX',@policy_random);
p.addParameter('policyO',@policy_random);
p.addParameter('show',false,@islogical);
p.addParameter('moves',length(available_moves(game)),@isnumeric);
p.parse(varargin{:});

policyX = p.Results.policyX;
policyO = p.Results.policyO;
show = p.Results.show;
nmoves = p.Results.moves;

move_count = 0;
while move_count < nmoves
    if isempty(available_moves(game))
        break
    end
    loc = policyX(game);
    game = make_move(game,'X',loc);
    move_count = move_count + 1;
    
    if isempty(available_moves(game)) || move_count >= nmoves
        break
    end
    loc = policyO(switchXO(game));
    game = make_move(game,'O',loc);
    move_count = move_count + 1;
    
    if show
        show_game(game);
    end
end

[winner,scoreX,scoreO] = score_game(game);
