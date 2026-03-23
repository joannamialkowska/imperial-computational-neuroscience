clear ; close all; clc;

%% Task 1: Linear SVM Classifier
% load('data1.mat');
% plotData(X, y);
% 
% C = 1; %default value
% linearModel = svmTrain(X, y, C, @linearKernel);
% visualizeBoundary(X, y, linearModel)
% linearPred = svmPredict(linearModel, X);
% 
% linearAccuracy = sum(linearPred == y)/length(y);
% disp(linearAccuracy)

%% Task 2: Non-linear SVM Classifier
% load('data2.mat');
% C = 1; %default value
% sigma = 0.1; %default value
% nonlinearModel = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
% visualizeBoundary(X, y, nonlinearModel)
% nonlinearPred = svmPredict(nonlinearModel, X);
% 
% nonlinearAccuracy = sum(nonlinearPred == y)/length(y);
% disp(nonlinearAccuracy)

%% Task 3
load('data3.mat');
plotData(X, y);

C = 10; %default value
sigma = 0.1; %default value

%Linear Fit
linearModel = svmTrain(X, y, C, @linearKernel);
visualizeBoundary(X, y, linearModel)
linearPred = svmPredict(linearModel, X);
linearAccuracy = sum(linearPred == y)/length(y);

%Nonlinear Fit
nonlinearModel = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
visualizeBoundary(X, y, nonlinearModel)
nonlinearPred = svmPredict(nonlinearModel, X);
nonlinearAccuracy = sum(nonlinearPred == y)/length(y);

disp('Linear Accuracy')
disp(linearAccuracy) %0.91

disp('Nonlinear Accuracy')
disp(nonlinearAccuracy) %0.95 <-WINNER

%When C is increased, it primarily affects the accuracy of the linear model
%When sigma is decreased data overfits to a high degree

