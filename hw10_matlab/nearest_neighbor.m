% This function takes in a data matrix Xrun, a training data matrix Xtrain, 
% and a labeled output Ytrain, and produces a column vector guesses,
% corresponding to the nearest neighbor classifier.

function guesses = nearest_neighbor(Xrun, Xtrain, Ytrain)
    
    % Check input dimensions
    [nrun, dimrun] = size(Xrun);
    [ntrain, dimtrain] = size(Xtrain);
    if dimrun ~= dimtrain
        error('Dimensionality of Xrun and Xtrain do not match');
    end
    if ~isequal(size(Ytrain), [ntrain, 1])
        error('Ytrain should be a column vector with the same number of rows as Xtrain');
    end
    
    % Convert Xrun and Xtrain to sparse matrices
    Xrun_sparse = sparse(Xrun);
    Xtrain_sparse = sparse(Xtrain);
    
    % Compute pairwise distances between Xrun and Xtrain using sparse matrix multiplication
    distances_sparse = -2 * Xrun_sparse * Xtrain_sparse' + sum(Xtrain_sparse.^2, 2)';
    
    % Find the nearest neighbor for each row of Xrun
    [~, nearest_idx] = min(distances_sparse, [], 2);
    
    % Get the corresponding labels from Ytrain
    guesses = Ytrain(nearest_idx);
    
end
