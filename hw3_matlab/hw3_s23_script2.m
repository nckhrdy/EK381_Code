%%MATLAB Script for Homework 3
%%Note that you must run this script in a directory that contains catsfolder
%%and dogsfolder as subdirectories.

%Read cats and dogs data.
[cats dogs] = read_cats_dogs;
num_cats = size(cats,1);
num_dogs = size(dogs,1);

%Problem 3.6
%Calculate average cat and dogs images on the training data.
avg_cat = vector_average(cats);
avg_dog = vector_average(dogs);
figure(1)
show_image(avg_cat,1);
title('Average Cat')
figure(2)
show_image(avg_dog,1);
title('Average Dog')


