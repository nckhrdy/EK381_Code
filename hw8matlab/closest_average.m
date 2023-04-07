%This function takes in a pet image currentpet (as a row vector) and 
%two additional row vectors, avg_cat and avg_dog, corresponding to
%the average cat and dog images.
%The function should output 0 as its guess if currentpet is closer to
%avg_cat than avg_dog, and 1 as its guess if currentpet is closer to 
%avg_dog than avg_cat. In the case of a tie, it should guess 1.

function guess = closest_average(currentdata,mu0,mu1)
%Calculate distances.
distancetomu0 = sqrt(sum((currentdata-mu0).^2));
distancetomu1 = sqrt(sum((currentdata-mu1).^2));
%Decide based on smaller distance.
guess = (distancetomu1 <= distancetomu0);

%Check if output is 0 or 1.
if (guess~=0 & guess~=1) 
    error("The variable guess is not 0 or 1.")
end
