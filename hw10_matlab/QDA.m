%This function takes in a data matrix Xrun as well the mean vectors mu0, mu1 
%and the covariance matrices sigma0, sigma1 estimated from the training data
%and produces a column vector guesses, corresponding to the ML rule for Gaussian vectors
%with different means and different covariance matrices, which is referred to as 
%Quadratic Discriminant Analysis (QDA) in machine learning.

function guesses = QDA(Xrun, mu0, mu1, sigma0, sigma1)

% Check that input arguments are valid
if ~isnumeric(Xrun) || ~isnumeric(mu0) || ~isnumeric(mu1) || ~isnumeric(sigma0) || ~isnumeric(sigma1)
error('All inputs must be numeric arrays.');
end

% Check that input arguments have the correct size
if size(Xrun,2) ~= size(mu0,2) || size(Xrun,2) ~= size(mu1,2) || ...
size(sigma0,1) ~= size(sigma0,2) || size(sigma1,1) ~= size(sigma1,2) || ...
size(sigma0,1) ~= size(Xrun,2) || size(sigma1,1) ~= size(Xrun,2)
error('Input dimensions are incorrect.');
end

% Compute inverse and log-determinant of covariance matrices using eigendecomposition
[V0, D0] = eig(sigma0);
[V1, D1] = eig(sigma1);
inv_sigma0 = V0 * diag(1./diag(D0)) * V0';
inv_sigma1 = V1 * diag(1./diag(D1)) * V1';
logdet_sigma0 = sum(log(diag(D0)));
logdet_sigma1 = sum(log(diag(D1)));

% Compute Mahalanobis distance for each class
dist0 = sum((Xrun - mu0) * inv_sigma0 .* (Xrun - mu0), 2) + logdet_sigma0;
dist1 = sum((Xrun - mu1) * inv_sigma1 .* (Xrun - mu1), 2) + logdet_sigma1;

% Classify based on minimum distance
guesses = dist0 > dist1;

end

