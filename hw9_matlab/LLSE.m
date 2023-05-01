function [Xhat,MSE,R2] = LLSE(X,Y)
[nx dx] = size(X);
[ny dy] = size(Y);
if (dx ~= 1)
    error("Error: LLSE function only works for column vectors X.")
end
if (nx ~= ny)
    error("Error: X and Y must have the same number of rows.")
end

XYstack = [X Y]; %concatenate X and Y
meanstack = mean(XYstack); %mean of X and Y
covstack = cov(XYstack); %covariance of X and Y
muX = meanstack(1); %extract mean of X
muY = meanstack(2:dy+1); %extract mean of Y
sigmaXY = covstack(1,2:dy+1); %extract cross-covariance matrix of X and Y
sigmaY = covstack(2:dy+1,2:dy+1); %extract covariance matrix of Y

% calculate LLSE estimate for X using all rows of Y
Xhat = muX + sigmaXY / sigmaY * (Y - muY)';
% calculate MSE
MSE = mean((X - Xhat).^2);
% calculate R2
R2 = 1 - MSE / var(X);

end
