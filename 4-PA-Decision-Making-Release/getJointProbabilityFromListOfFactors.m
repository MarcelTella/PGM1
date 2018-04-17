function jointProb = getJointProbabilityFromListOfFactors(factorsList)
    jointProb = factorsList(1);
    for i = 2:numel(factorsList)
        jointProb = FactorProduct(jointProb, factorsList(i));
    end