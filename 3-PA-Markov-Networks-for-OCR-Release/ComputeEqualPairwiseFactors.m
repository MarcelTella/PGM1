function factors = ComputeEqualPairwiseFactors(images, K)
% This function computes the pairwise factors for one word in which every
% factor value is set to be 1.
%
% Input:
%   images: An array of structs containing the 'img' value for each
%     character in the word.
%   K: The alphabet size (accessible in imageModel.K for the provided
%     imageModel).
%
% Output:
%   factors: The pairwise factors for this word. Every entry in the factor
%     vals should be 1.
%
% Copyright (C) Daphne Koller, Stanford University, 2012
n = length(images);

factors = repmat(struct('var', [], 'card', [], 'val', []), n - 1, 1);

for i=1:n-1
   factors(i).var = [i, i+1];

   % if I am given q, how happy I am for all of the rest. (26)
   % now, if I am given a? b? next one? So 26x26 possibilities.
   factors(i).card = K^2; 

   factors(i).val = ones(factors(i).card, 1);
end

