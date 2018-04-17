% Copyright (C) Daphne Koller, Stanford University, 2012

function [MEU OptimalDecisionRule] = OptimizeLinearExpectations( I )
    % Inputs: An influence diagram I with a single decision node and one or more utility nodes.
    %         I.RandomFactors = list of factors for each random variable.  These are CPDs, with
    %              the child variable = D.var(1)
    %         I.DecisionFactors = factor for the decision node.
    %         I.UtilityFactors = list of factors representing conditional utilities.
    % Return value: the maximum expected utility of I and an optimal decision rule 
    % (represented again as a factor) that yields that expected utility.
    % You may assume that there is a unique optimal decision.
    %
    % This is similar to OptimizeMEU except that we will have to account for
    % multiple utility factors.  We will do this by calculating the expected
    % utility factors and combining them, then optimizing with respect to that
    % combined expected utility factor.  

    Us = I.UtilityFactors;
    eufs = Us;
    
    for i = 1:numel(Us)
        I.UtilityFactors = Us(i);
        factor = CalculateExpectedUtilityFactor(I);
        eufs(i) = factor;
    end

    D = I.DecisionFactors(1);
    factorMuEquivalent = SumFactors(eufs);
    [MEU, OptimalDecisionRule] = findOptimalDecissionRule(factorMuEquivalent, D);
