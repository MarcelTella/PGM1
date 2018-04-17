load('FullI.mat');
res1 = SimpleCalcExpectedUtility(FullI);
disp(['Q1: Expected Utility:', num2str(res1)]);

normalize = true;
diag = ObserveEvidenceInInInfluenceDiagram(FullI, [3, 2], normalize);
res2 = SimpleCalcExpectedUtility(newFullI);
disp(['Q2: Expected Utility after observing that var 3 has value 2:', num2str(res2)]);