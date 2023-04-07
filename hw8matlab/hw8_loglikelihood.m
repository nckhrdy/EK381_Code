%%MATLAB Log Likelihood Script for Homework 8

dataset0 = readmatrix("syntheticH0.csv");
dataset1 = readmatrix("syntheticH1.csv");
%dataset0 = readmatrix("benignfull.csv");
%dataset1 = readmatrix("malignantfull.csv");
%[dataset0 dataset1] = read_cats_dogs;
[n0 d0] = size(dataset0);
[n1 d1] = size(dataset1);
if (d0 == d1)
    d = d0;
else
    error("dataset0 and dataset1 have a different number of columns.")
end

%Split dataset into training and test data.
train0 = dataset0(1:floor(n0/2),:);
test0 = dataset0(floor(n0/2)+1:n0,:);
train1 = dataset1(1:floor(n1/2),:);
test1 = dataset1(floor(n1/2)+1:n1,:);
n0test = size(test0,1);
n1test = size(test1,1);

%Estimate mean vectors and covariance matrices from training data.
mu0 = mean(train0);
mu1 = mean(train1);
sigma0 = cov(train0);
sigma1 = cov(train1);

%Apply decision rules.
H0guesses_idcov = zeros(n0test,1);
H1guesses_idcov = zeros(n1test,1);

for i = 1:n0test
    currentdata= test0(i,:);
    %%%Problem 8.4(e) code goes here.  Call the  
    %%% function closest average to classify currentdata and store the
    %%% output in the reight array 
    
    H0guesses_idcov(i) =   ; 
end

for i = 1:n1test
    currentdata = test1(i,:);
    %%%Problem 8.4(e) code goes here.  Repeat the above for data from test1
    %%%
    
    H1guesses_idcov(i) =   :
end

Pe_idcov = proberror(H0guesses_idcov,H1guesses_idcov);
disp(sprintf('Probability of error for identity covariance is %.2g.',Pe_idcov));

H0guesses_samecov = zeros(n0test,1);
H1guesses_samecov = zeros(n1test,1);


%%%Problem 8.4(f) code goes here.  First, compute the pooled covariance 
%%%  and its pseudoinverse %%%
for i = 1:n0test
    currentdata = test0(i,:);
    %%%Problem 8.4(f) code goes here.  Implement the log llikelihood
    %%% test and apply it to currentdata, storing the answers in the array 
    %%% below.  
    
    H0guesses_samecov(i) =          
end

for i = 1:n1test
    currentdata = test1(i,:);
    %%%Problem 8.4(f) code goes here.  Do the same for data from test1.
    
    H1guesses_samecov(i) = 
end

Pe_samecov = proberror(H0guesses_samecov,H1guesses_samecov);
disp(sprintf('Probability of error for same covariance is %.2g.',Pe_samecov));

H0guesses_diffcov = zeros(n0test,1);
H1guesses_diffcov = zeros(n1test,1);

%%% Problem 8.4(g) code goes here.  Compute the pseudoinverses of the 
%%% covariances here, outside of the loop. Do as much algebra as you can 
%%% that does not depend on the data.  


for i = 1:n0test
    currentdata = test0(i,:);
    %%%Problem 8.4(g) code goes here.  Implement the log-likelihood test
    %%% with different covariances, store the decision in the array 
    
    H0guesses_diffcov(i) =         ; 
end

for i = 1:n1test
    currentdata = test1(i,:);
        %%%Problem 8.3(g) code goes here.  Implement the log-likelihood test
    %%% with different covariances, store the decision in the array 
    
    H1guesses_diffcov(i) =          ; 

end

Pe_diffcov = proberror(H0guesses_diffcov,H1guesses_diffcov);
disp(sprintf('Probability of error for different covariances is %.2g.',Pe_diffcov));


