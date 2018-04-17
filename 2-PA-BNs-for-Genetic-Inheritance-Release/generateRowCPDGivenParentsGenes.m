function rowOfCPD = generateRowCPDGivenParentsGenes(genIdParent1, genIdParent2, numGenPossibilities, genotypesToAlleles)
    rowOfCPD = zeros(1, numGenPossibilities);
    for iGenId = 1:numGenPossibilities
        
        canItBeFormed = canParent1AndParent2FormThisGen(iGenId, genIdParent1, genIdParent2, genotypesToAlleles);
        if canItBeFormed
            thisAllel = genotypesToAlleles(iGenId, :);
            alternesAllelesCaseOffset = (genIdParent1 == genIdParent2) && (thisAllel(1) ~= thisAllel(2));
            rowOfCPD(iGenId) = double(canItBeFormed) + double(alternesAllelesCaseOffset);
        end
    end 
    rowOfCPD = normalizeTheNonZeroes(rowOfCPD);
   
    function row = normalizeTheNonZeroes(row)
        numNotNulls = sum(row(row ~= 0));
        row = row / numNotNulls;
    end
end