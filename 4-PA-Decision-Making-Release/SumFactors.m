function f = SumFactors(listOfFactors)
    f = listOfFactors(1);
    for i = 2:numel(listOfFactors)
        f = FactorSum(f, listOfFactors(i));
    end