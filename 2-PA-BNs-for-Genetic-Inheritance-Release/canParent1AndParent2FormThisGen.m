function bool = canParent1AndParent2FormThisGen(genId, genIdParent1, genIdParent2, genotypesToAlleles)
    bool = false;
    thisGenAlleles = genotypesToAlleles(genId, :);
    parent1GenAlleles = genotypesToAlleles(genIdParent1, :);
    parent2GenAlleles = genotypesToAlleles(genIdParent2, :);

    for i = 1:length(parent1GenAlleles)
       for j = 1:length(parent2GenAlleles)
            potentialSonAllel = [parent1GenAlleles(i), parent2GenAlleles(j)];
            if isequal(thisGenAlleles, potentialSonAllel) || isequal(thisGenAlleles, fliplr(potentialSonAllel))
                bool = true;
                return;
            end
       end
    end