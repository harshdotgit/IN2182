% function hmove = gen_human_move( rno )
%GEN_HUMAN_MOVE Function to generate a human move substitute by some rule
% %   Inputs: rno = the number of the current round
% %   Outputs: hmove = integer {1,2,3} code of the move {rock,paper,scissors}
% %
% % OPTIONAL: This function can be helpful to test out different strategies
% 
% hmove = mod(rno,3)+1;   % We dare you to think of a simpler rule... :)
% 
% end

function hmove = gen_human_move(rno)
global history transm

if rno <= 2
    % first rounds are random
    hmove = randi(3); 
else
    % Get the human player's last move from the history matrix
    last_move = history(end-1, 2);
   
   
    % Most probable next move based on the transition matrix (simulating predict2)
    [~, predict4] = max(transm(last_move, :));

    % simulating winchoice
    expected_move = mod(predict4, 3) + 1;
    
    % We play the move that beats the computer's expected move
    hmove = mod(expected_move, 3) + 1;
end
end