function [MEU, OptimalDecisionRule] = findOptimalDecissionRule(euf, D)
   v = euf.val;
  
  [MEU, OptimalDecisionRule] = max(v);
  D.val = zeros(1, length(D.val));
  D.val(OptimalDecisionRule) = 1;
  OptimalDecisionRule = D;