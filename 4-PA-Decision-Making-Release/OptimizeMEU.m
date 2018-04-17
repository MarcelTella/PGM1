% Copyright (C) Daphne Koller, Stanford University, 2012

function [MEU, OptimalDecisionRule] = OptimizeMEU(I)

  % Inputs: An influence diagram I with a single decision node and a single utility node.
  %         I.RandomFactors = list of factors for each random variable.  These are CPDs, with
  %              the child variable = D.var(1)
  %         I.DecisionFactors = factor for the decision node.
  %         I.UtilityFactors = list of factors representing conditional utilities.
  % Return value: the maximum expected utility of I and an optimal decision rule 
  % (represented again as a factor) that yields that expected utility.
  D = I.DecisionFactors(1);
  euf = CalculateExpectedUtilityFactor(I);
  [MEU, OptimalDecisionRule] = findOptimalDecissionRule(euf, D);
end
