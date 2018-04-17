% FactorProduct Computes the product of two factors.
%   C = FactorProduct(A,B) computes the product between two factors, A and B,
%   where each factor is defined over a set of variables with given dimension.
%   The factor data structure has the following fields:
%       .var    Vector of variables in the factor, e.g. [1 2 3]
%       .card   Vector of cardinalities corresponding to .var, e.g. [2 2 2]
%       .val    Value table of size prod(.card)
%
%   See also FactorMarginalization.m, IndexToAssignment.m, and
%   AssignmentToIndex.m

function C = FactorProduct(A, B)

% Check for empty factors
if (isempty(A.var)), C = B; return; end;
if (isempty(B.var)), C = A; return; end;

% Check that variables in both A and B have the same cardinality
[dummy, iA, iB] = intersect(A.var, B.var);
if ~isempty(dummy)
	% A and B have at least 1 variable in common
	assert(all(A.card(iA) == B.card(iB)), 'Dimensionality mismatch in factors');
end

% Set the variables of C
%%% This basically sets all the variables together. In order to multiply
%%% the factors, one needs to consider all possible configurations.
%%% if phi(x3,x1,x2) and phi(x4,x5), we need to create a variable C.
%%% This variable is now sorted, so (x1,x2,x3,x4,x5) since the operation
%%% union also sorts.
C.var = union(A.var, B.var);    

% Construct the mapping between variables in A and B and variables in C.
% In the code below, we have that
%
%   mapA(i) = j, if and only if, A.var(i) == C.var(j)
% 
% and similarly 
%
%   mapB(i) = j, if and only if, B.var(i) == C.var(j)
%
% For example, if A.var = [3 1 4], B.var = [4 5], and C.var = [1 3 4 5],
% then, mapA = [2 1 3] and mapB = [3 4]; mapA(1) = 2 because A.var(1) = 3
% and C.var(2) = 3, so A.var(1) == C.var(2).

%%% This find the indices of the variables. as explained in the eample
%%% above.
[~, mapA] = ismember(A.var, C.var);
[~, mapB] = ismember(B.var, C.var);

% Set the cardinality of variables in C
C.card = zeros(1, length(C.var));
C.card(mapA) = A.card;  % Cardinality of variables 2, 1, 3
C.card(mapB) = B.card;  % Cardinality of variables 3, 4

% Initialize the factor values of C:
%   prod(C.card) is the number of entries in C
%%% This means if card are [2, 2, 2], then this will be 2^3=8.
%%% In the example, [2(a), 2(a), 2(a), 2(b), 2(b)] = 2^5=32
C.val = zeros(1, prod(C.card)); 

% Compute some helper indices
% These will be very useful for calculating C.val
% so make sure you understand what these lines are doing.

%%% Compue the assignments for all the indices in the table
assignments = IndexToAssignment(1:prod(C.card), C.card);

%%% Compute the indices for the assignments in the set A
indxA = AssignmentToIndex(assignments(:, mapA), A.card);

%%% Compute the indices for the assignments in the set B
indxB = AssignmentToIndex(assignments(:, mapB), B.card);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% YOUR CODE HERE:
% Correctly populate the factor values of C
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    % What should be done is 
    % 1. Pass through every possible combination of
    % x1, x2, x3, x4, x5, in the example case.
    % 2. Evaluate the two factors in those values. (get the assignments)
    % 3. Multiply those factors.
    % 4. Set the resulting value in the x1,x2,x3,x4,x5 place
    
    for i = 1:size(assignments, 1) %1
        thisAssignment = assignments(i, :);
        productProbability = A.val(indxA(i)) * B.val(indxB(i)); %2, 3
        C = SetValueOfAssignment(C, thisAssignment, productProbability); % 4
    end
end