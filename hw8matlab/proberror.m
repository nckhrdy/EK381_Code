%This function takes in the column vectors of guesses for H0 and H1
%data and outputs the probability of error, assuming H0 and H1 are
%equally likely. 
function Pe = proberror(testguess0,testguess1)
%Calculate sizes.
n0test = size(testguess0,1);
n1test = size(testguess1,1);
%The number of false alarms is the total number of ones in testguess0.
n_false_alarm = sum(testguess0 == 1);
%Divide by total number of guesses to estimate the probability of false alarm.
P_FA = n_false_alarm / n0test;
%The number of missed detections is the total number of zeros in testguess1.
n_missed_detection = sum(testguess1 == 0);
%Divide by total number of guesses to estimate the probability of missed
%detection.
P_MD = n_missed_detection / n1test;
Pe = P_FA * 0.5 + P_MD * 0.5;