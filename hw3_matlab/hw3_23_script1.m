close all; %% closes old figure windows

% This first part computes and plots the histogram for three different
% sample sizes: part a) 
%Parameters
n = 10;
p = 0.5;
trials = [100,1000,10000];

for k = 1:3
    numtrials = trials(k);
    %Generate Binomial RVs
    X = random('Binomial',n,p,numtrials,1);

    %(Normalized) Histogram  
    counts = zeros(1,n+1); % n+1 possible successes for Binomial(n,p)
    for i = 0:n
        counts(i+1)=  %%Your code for number of occurrences of value i in X; counts(i+1) is the number
                      %%of times that X = i in the array X
    end
    normalizedcounts = counts/numtrials;

    %Probability Mass Function
    pmfvalues = zeros(1,n+1);
    for i = 0:n
        pmfvalues(i+1) =   %%Your code for the PMF of value i;
                           %%See if you can use the function nchoosek
    end

    %Plot
    figure,hold off
    bar(0:n,normalizedcounts)
    hold on
    stem(0:n,pmfvalues,'r','linewidth',2)
    xlabel('x')
    ylabel('Probability')
    title("Normalized Histogram and PMF for a Binomial(" + n + "," + p + ") RV, " + ...
        numtrials + " Realizations") 
    legend('Normalized Histogram','PMF')
    set(gca,'FontSize',14)
    set(findall(gcf,'type','text'),'FontSize',14)

end

% This second part computes the sample expected value as a function of
% sample size: part b) 

n = 20;
p = 0.7;
numtrials = 1000;

%Generate random samples.

X = random('Binomial',n,p,numtrials,1);

%Calculate sample mean for an increasing number of trials.
samplemeanX = zeros(1,numtrials);
for m = 1:numtrials
    samplemeanX(m) =  %%% Your code here...!!!!
end

%Calculate true mean.
truemeanX = n*p; 

%Plot sample mean vs. number of trials as well as true mean.
figure, hold off
plot(1:numtrials,samplemeanX,'b')
hold on, plot(1:numtrials,truemeanX*ones(1,numtrials),'r--')
axis([0 numtrials 10 20])
xlabel('Number of Trials')
ylabel('Sample Mean')
legend('Sample Mean','True Mean')
title("Mean for a Binomial(" + n+ "," + p +") RV")
set(gca,'FontSize',14)
set(findall(gcf,'type','text'),'FontSize',14)

% This third part estimates probabilities from samples: part c) 

alpha = 5;
b = 2;
numtrials = 1000;

%Generate numtrials independent samples of Poisson(alpha) random variables.
X = random('Poisson',alpha,numtrials,1);

%Estimate P[X > b]
probestimate = zeros(1,numtrials);
for m = 1:numtrials
    probestimate(m) =  %% Your code for calculating (1/m) * (number of times X_i > b);
end

%Calculate P[X > b] exactly
complementprob = 0;
for i = 0:b
    complementprob = complementprob + alpha^i/(factorial(i)) * exp(-alpha);
end
exactprob = 1 - complementprob;

%Plot
figure
hold off, plot(1:numtrials,probestimate)
hold on, plot(1:numtrials,exactprob*ones(1,numtrials),'r--')
axis([0 numtrials 0 1])
xlabel('Number of Trials')
ylabel('Probability')
title("Probability that a Poisson(" + alpha + ") RV exceeds " + b)
legend('Estimated Probability','Exact Probability')
set(gca,'FontSize',14)
set(findall(gcf,'type','text'),'FontSize',14)





