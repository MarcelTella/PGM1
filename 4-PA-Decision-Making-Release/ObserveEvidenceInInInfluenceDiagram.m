function diag = ObserveEvidenceInInInfluenceDiagram(I, E, normalize)
    diag.RandomFactors = ObserveEvidence(I.RandomFactors, E, normalize);
    diag.DecisionFactors = ObserveEvidence(I.DecisionFactors, E, normalize);
    diag.UtilityFactors = ObserveEvidence(I.UtilityFactors, E, normalize);