%Homework 9 MATLAB Solution
data = readmatrix("concretedata.csv"); 
% X = data(:,9);
n = length(X);
% Y = data(:,1:8);

X = data(:, 9); % the last column contains X
Y = data(:, 1:8); % the first 8 columns contain Y

%Find best scalar fit
scalarXhats = zeros(n,8);
scalarMSEvalues = zeros(length(MSE_single),8);
scalarR2values = zeros(length(MSE_single),8);

% Part (d) here

[Xhat, MSE, R2] = LLSE(X, Y);

figure;
scatter(X, Xhat);
xlabel('True values of X');
ylabel('Estimated values of X');
title('Scatter plot of estimated X versus true X');

% Part (e) here 

% Store MSE_single value

x_single = Y(:, 1); % Use first feature of Y to estimate X
[Xhat_single, MSE_single, R2_single] = LLSE(X, x_single);

scalarMSEvalues(:,1) = MSE_single; %store MSE value

R2_values = zeros(1, size(Y, 2)); %initialize vector of R2 values

for i = 1:8
[Xhat_single, MSE_single, R2_single] = LLSE(X, Y(:, i)); %estimate X using single feature i

scalarXhats(:, i) = Xhat_single; %store estimates in matrix

scalarMSEvalues(:,i) = MSE_single; %store MSE value

R2_values(i) = R2_single; %store R2 value
end

[best_R2, best_feature] = max(R2_values); %find column of Y with highest R2 value

[Xhat_best, MSE_best, R2_best] = LLSE(X, Y(:, best_feature)); %estimate X using best feature

fprintf('Best feature to predict X is column %d of Y\n', best_feature);

fprintf('MSE for the best feature is %.4f\n', MSE_best);

fprintf('R2 for the best feature is %.4f\n', R2_best);

figure;
scatter(X, Xhat_best);
xlabel('True values of X');
ylabel('Estimated values of X');
title('Scatter plot of estimated X using best feature versus true X');

% Part (f) here 
