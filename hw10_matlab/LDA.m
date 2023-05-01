%This function takes in a data matrix Xrun as well the mean vectors mu0, mu1 
%and the covariance matrices sigma0, sigma1 estimated from the training data
%and produces a column vector guesses, corresponding to the ML rule for Gaussian vectors
%with different means and the same covariance matrix, which is referred to as 
%Linear Discriminant Analysis (LDA) in machine learning.
function guesses = LDA(Xrun, mu0, mu1, sigmapooled)

% Compute the inverse of the pooled covariance matrix
sigmainv = pinv(sigmapooled);
    
% Compute the LDA coefficients
w = sigmainv * (mu1 - mu0)';
b = -0.5 * (mu1 * sigmainv * mu1' - mu0 * sigmainv * mu0');
    
% Compute the discriminant function
y = Xrun * w + b;
    
% Apply the ML rule for Gaussian vectors with different means and the
% same covariance matrix to classify the samples
guesses = (y > 0);

end

