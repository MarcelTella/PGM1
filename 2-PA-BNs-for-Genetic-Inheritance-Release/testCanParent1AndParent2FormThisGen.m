% tests
genotypesToAlleles = [1, 2; 1, 1; 2, 2];

genId = 3;
genIdParent1 = 1;
genIdParent2 = 2;
bool = canParent1AndParent2FormThisGen(genId, genIdParent1, genIdParent2, genotypesToAlleles);
assert(bool == false)

genId = 2;
bool = canParent1AndParent2FormThisGen(genId, genIdParent1, genIdParent2, genotypesToAlleles);
assert(bool == true);

genId = 1;
bool = canParent1AndParent2FormThisGen(genId, genIdParent1, genIdParent2, genotypesToAlleles);
assert(bool == true);