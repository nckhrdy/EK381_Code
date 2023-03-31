%This function takes in a data matrix and outputs the 
%average row vector.

function row_avg = vector_average(datamatrix)
    row_avg = mean(datamatrix,1);


%Your code should go above this line.
if (size(row_avg,1)~=1) 
    error("The variable row_avg is not a row vector.")
end
if (size(row_avg,2)~=size(datamatrix,2))
    error("The variable row_avg does not have the same number of columns as the data matrix input.")
end
