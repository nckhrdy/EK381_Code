% This function takes in a data matrix X, corresponding vector of labels Y, 
% and a desired label. It outputs the number of samples with desiredlabel as n_label, 
% as well as the sample mean vector mu_label (as a row vector) and sample covariance 
% matrix sigma_label for the data in X whose labels in Y are equal to the desired label.
function [n_label, mu_label, sigma_label] = labeled_mean_cov(X, Y, desired_label)

% Check if desired_label is a valid label in Y
if ~ismember(desired_label, Y)
    error('Desired label is not present in Y');
end

% Find the indices of samples with the desired label
idx = Y == desired_label;

% Compute the number of samples with the desired label
n_label = sum(idx);

% Compute the mean vector for samples with the desired label
mu_label = mean(X(idx,:), 1);

% Compute the covariance matrix for samples with the desired label
sigma_label = cov(X(idx,:));

end
