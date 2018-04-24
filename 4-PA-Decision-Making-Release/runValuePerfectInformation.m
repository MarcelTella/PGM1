load('TestI0');

testVar = 11;

% Step 1: Compute MEU with +1 utility.
[MEU, decRule] = OptimizeWithJointUtility(TestI0);
MEU

% Step 2: Modify variable 11 to fit the specs.
factors = TestI0.RandomFactors;
testFactor = factors(10);
testFactor.card = [3 2];
testFactor.val = [0.999, 0.75, ...
                 0.75, 0.999, ...
                 0.999, 0.999]; % Unsure about which way it goes. vert or horiz.
factors(10) = testFactor;
TestI0.RandomFactors = factors;

% Making the decission dependent on the test variable.
dFactors = TestI0.DecisionFactors;
dFactors(1).var = [dFactors(1).var, testVar];
dFactors(1).card = [2, 3];

dFactors(1).val = [2, 3]; % Do I have to input these numbers? Does not sound right.

TestI0.DecisionFactors = dFactors;



% Step 3: Make a decission D based on the test.
