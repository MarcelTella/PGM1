function factors = ComputeAllSimilarityFactors(word, K)
% This function computes all of the similarity factors for the images in
% one word.
%
% Input:
%   images: An array of structs containing the 'img' value for each
%     character in the word.
%   K: The alphabet size (accessible in imageModel.K for the provided
%     imageModel).
%
% Output:
%   factors: Every similarity factor in the word. You should use
%     ComputeSimilarityFactor to compute these.
%
% Copyright (C) Daphne Koller, Stanford University, 2012

n = length(word);
nFactors = nchoosek (n, 2);

factors = repmat(struct('var', [], 'card', [], 'val', []), nFactors, 1);

counter = 1;
for i=1:n
    for j=i+1:n
        if i ~= j
            factors(counter) = ComputeSimilarityFactor(word, K, i, j);
            counter = counter + 1;
        end
    end
end

end

