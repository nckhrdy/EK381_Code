%This function takes in a data matrix Xrun, mean vector mu, 
%eigenvector matrix V, and eigenvalues D, and dimension k. 
%It selects the k eigenvectors corresponding to the k largest
%eigenvalues, centers the data by subtracting mu, and projects
%the centered data to k dimensions by multiplying by the matrix
%of k eigenvectors.

% Xrun: the data matrix to be reduced (n x p)
% mu: the mean vector of the data matrix (1 x p)
% V: the eigenvector matrix of the covariance matrix of the data (p x p)
% D: the eigenvalues of the covariance matrix of the data (1 x p)
% k: the number of dimensions to reduce the data to

function Xrun_reduced = dimensionality_reduction(Xrun,mu,V,D,k)

% select K eigenvectors corresponding to the K largest e-vals
V = V(:,1:k);

% Center the data by subtracting mu
Xrun_centered = Xrun - repmat(mu,size(Xrun,1),1);

% Project the centered data to k dimensions by multiplying by the matrix of k eigenvectors
Xrun_reduced = Xrun_centered * V;

end