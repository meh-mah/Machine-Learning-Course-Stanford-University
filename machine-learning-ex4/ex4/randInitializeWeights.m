function W = randInitializeWeights(L_in, L_out)
%RANDINITIALIZEWEIGHTS Randomly initialize the weights of a layer with L_in
%incoming connections and L_out outgoing connections
%   W = RANDINITIALIZEWEIGHTS(L_in, L_out) randomly initializes the weights 
%   of a layer with L_in incoming connections and L_out outgoing 
%   connections. 
%
%   Note that W should be set to a matrix of size(L_out, 1 + L_in) as
%   the column row of W handles the "bias" terms
%

% You need to return the following variables correctly theta is a matrix of previous layer +1 * following layer
W = zeros(L_out, 1 + L_in);

% ====================== YOUR CODE HERE ======================
% Instructions: Initialize W randomly so that we break the symmetry while
%               training the neural network.
%
% Note: The first row of W corresponds to the parameters for the bias units
%2One effective strategy for choosing e_init is to base it on the number of units in the
%network. A good choice of e_init is e_init = sqrt(6)/sqrt(L_in + L_out)
epsilon_init = sqrt(6)/(sqrt(L_in + L_out));
W = rand(L_out, 1 + L_in) * 2 * epsilon_init - epsilon_init;








% =========================================================================

end
