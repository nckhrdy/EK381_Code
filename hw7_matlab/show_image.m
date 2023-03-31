%This function takes in an n x d data matrix X and an index i. It
%assumes that d is a square number. It extracts 
%the ith row of X and displays it as a grayscale sqrt(d) x sqrt(d) image.
function show_image(X,i)

if (nargin < 2)
    disp('No index selected. Displaying first image.')
    i = 1;
end

colormap('gray')
shg
imgdim = floor(sqrt(size(X,2)));
imagesc([reshape(X(i,:),imgdim,imgdim)])
axis square