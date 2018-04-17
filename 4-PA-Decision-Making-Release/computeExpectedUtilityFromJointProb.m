function EU = computeExpectedUtilityFromJointProb(jointProb, U)
    multFactor = FactorProduct(jointProb, U);
    EU = sum(multFactor.val);