
% The source code is to compute link prediction based matrix completion or 
% robust PCA from a manuscript entitled Link prediction via matrix
% completion. 
% https://arxiv.org/abs/1606.06812
% by Ratha Pech et al., 
% ratha.pech@gmail.com


clear all; close all; clc;
warning off


% Load data
% =============== Unweighted networks ============================ %
% 1: Jazz, 2: Yeast, 3: PB, 4: Hamster, 5: Router, 6: FWF, 7: World trade,
% 8: Contact, 9: Metabolic, 10: C.elegans, 11: FWM, 12: Macaca, 13: Katate, 
% 14: Football, 15: Dolphin, 16: Email

% =============== Weighted network ============================= %
% 17: USAir, 18: C.elegans, 19: FWE, 20: Football

fprintf('===== Unweigted networks ==================');
fprintf('\n1: Jazz, \n2: Yeast, \n3: Political blog, \n4: Hamster, \n5: Router, \n');
fprintf('6: FWF, \n7: World trade, \n8: Contact, \n9: Metabolic, \n10: C.elegans, \n');
fprintf('11: FWM, \n12: Macaca, \n13: Karate, \n14: Football, \n15: Dolphin, \n16: Email \n');
fprintf('================== For weighted network ================= \n');
fprintf('17: USAir, \n18: C.elegans, \n19: FWE, \n20: Football. \n\n');
prompt = 'In put network option: ';

data = input(prompt);
Adj = load_data(data);

if Adj == 0 % Check whether there is such data option
    fprintf('The input is incorrect! \n');
    return;
end

% The ratio of division of the data to training and probe set 
ratioTrain = 0.90; % 90 percent of total links as training set

% Parameter of LR for each network 
lambda = [.13 .14 .07 .10 .10 .14 .12 .10 .10 .10 .13 .17 .23 .18 .25 .16 ...
          .10 .10 .10 .18];     


% numExperiment = 1; % Number of independent runs
prompt = 'Input number of independent runs: ';
numExperiment = input(prompt);
for r = 1 : numExperiment
    fprintf(['\n============ Experiment number: ' num2str(r) ' of ' ...\
              num2str(numExperiment) ' ============\n']);
    
    % Dividing the data into training and testing set  
    [train test] = DivideNet(Adj, ratioTrain); 
    
    % Computing the low-rank matrix 
    [S_LR E iter] = inexact_alm_rpca(train, lambda(data));
    
    % Making the recovered matrix symmetric
    S_LR = S_LR + S_LR'; 
   
    % Computing the precision
    pre_LR(r) = compute_precision(S_LR, test, train);
    
end

% The average value of the precisions
fprintf(['\nThe average preicision is ' num2str(mean(pre_LR))]);

% The standard error of the precisions 
fprintf(['\nThe standard error is ' num2str(std(pre_LR)) '\n']);






