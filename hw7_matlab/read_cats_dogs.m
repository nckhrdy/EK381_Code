%This function reads in all images in catsfolder/ and dogsfolder/. 
%Each 64 x 64 image is reshaped into a length-4096 row vector. 
%These row vectors are stacked on top of one another to get two data
%matrices, each with 4096 columns. The first matrix cats consists of all
%the cat images as row vectors and the second matrix dogs consists of all
%the dog images as row vectors.

function [cats dogs] = read_cats_dogs
    catsfolder = 'catsfolder/'; 
    catfiles = dir(fullfile(catsfolder, '*.jpg')); 
    catfilenames = {catfiles.name};
    numcats = length(catfilenames);
    
    cats = [];
    for i = 1:numcats
        catfilenametemp = catfilenames{i};
        catimagetemp = imread(strcat(catsfolder,catfilenametemp));
        catvectemp = reshape(catimagetemp,1,4096);
        cats = [cats ; catvectemp];
    end
          
    dogsfolder = 'dogsfolder/'; 
    dogfiles = dir(fullfile(dogsfolder, '*.jpg')); 
    dogfilenames = {dogfiles.name};
    numdogs = length(dogfilenames);
    
    dogs = [];
    for i = 1:numdogs
        dogfilenametemp = dogfilenames{i};
        dogimagetemp = imread(strcat(dogsfolder,dogfilenametemp));
        dogvectemp = reshape(dogimagetemp,1,4096);
        dogs = [dogs ; dogvectemp];
    end
    
    doglabels = ones(numdogs,1);
    
    cats = double(cats);
    dogs = double(dogs);

end
