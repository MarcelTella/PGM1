function variablesToEliminate = findIndicesToEliminateFromFactors(F, U)
      variablesNotToEliminate = U.var;

      allVariables = [F(:).var];
      indices = ismember(allVariables, variablesNotToEliminate);
      variablesToEliminate = allVariables(~indices);
      variablesToEliminate = unique(variablesToEliminate);