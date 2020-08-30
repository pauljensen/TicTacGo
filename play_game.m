function [game,winner,scoreX,scoreO] = play_game(game,varargin)
% Play a TicTacGo game using policies.
%
%   [GAME,WINNER,SCOREX,SCOREO] = PLAY_GAME(GAME,...params...)
%
% Inputs
%   GAME  A game structure. If empty, a new game is created.
%
% Parameters
%   'policyX'
%   'policyO' Policies for each player. The default is POLICY_RANDOM.
%             Policies take a game structure and return a single move.
%
%   'show'    If true, show the board after each move. Default = false.
%
%   'moves'   The number of moves to simulate. By default the entire game
%             is played.
%
% Outputs
%   The final game structure plus the winner and scores for each player.

if isempty(game) || nargin == 0
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
