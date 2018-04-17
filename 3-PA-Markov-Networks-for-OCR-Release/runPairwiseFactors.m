% Marcel Tella Amo, April 2018
% Script to run the first part of the Assigment 3 of PGM1.
% Pw factors

clear; home; close all; 
load('PA3Data.mat')
load('PA3Models.mat')

imageModel.ignoreSimilarity = true; % Very important
[charAcc, wordAcc] = ScoreModel(allWords, imageModel, pairwiseModel, []);