%This function takes in two datasets (which must have the same number of
%columns), and reduces them down to a two-dimensional representation via
%Principal Component Analysis. It outputs the reduced datasets and
%generates a two-dimensional scatter plot.
function [dataset0_2d, dataset1_2d] = visualize2d(dataset0,dataset1)

% stacks the two data sets into one large matrix
X = [dataset0; dataset1];
muX = mean(X);
sigmaX = cov(X);
[V,D] = eig(sigmaX);  % computes eigenvectors V and eigenvalues D
[sD,sI] = sort(diag(D),'descend'); % sorts eigenvalues in descending order
                % sI are the original indices, sD the sorted eigenvalues
% the two largest eigenvalues are the first two indices.
i = sI(1);
j = sI(2);

V2d = [V(:,i),V(:,j)];

dataset0_2d = (dataset0 - muX)*V2d;
dataset1_2d = (dataset1 - muX)*V2d;



               



