function factors = ComputeSingletonFactors(word, imageModel)
% This function computes the single OCR factors for all of the images in a
% word.
%
% Input:
%   images: An array of structs containing the 'img' value for each
%     character in the word. You could, for example, pass in allWords{1} to
%     use the first word of the provided dataset.
%   imageModel: The provided OCR image model.
%
% Output:
%   factors: An array of the OCR factors, one for every character in the
%   image.
%
% Hint: You will want to use ComputeImageFactor.m when computing the 'val'
% entry for each factor.
%
% Copyright (C) Daphne Koller, Stanford University, 2012

% The number of characters in the word
n = length(word);

% Preallocate the array of factors
factors = repmat(struct('var', [], 'card', [], 'val', []), n, 1);

for i=1:numel(word)
    img = word(i).img;
    P = ComputeImageFactor(img, imageModel);
    
    factors(i).var = i;
    factors(i).card = imageModel.K;
    factors(i).val = P;
end
