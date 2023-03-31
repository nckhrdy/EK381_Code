%GAUSSIANCONTOUR Gaussian contour plot.
%  GAUSSIANCONTOUR(X,Y,PLOTCOLOR,GRIDPOINTS,COORDS) displays the contour 
%  plot for a bivariate Gaussian joint PDF with means, variances, and 
%  covariances taken from the sample means, variances, and covariances of
%  the column vectors X and Y. 
%
%  The optional argument PLOTCOLOR determines the color of the plot, blue
%  is the default. 
%  Example: gaussiancontour(x,y,'r') plots in red.
%
%  The optional argument GRIDPOINTS determines the number of evaluation
%  points per dimension for the joint PDF. The default is 200. 
%  Example: gaussiancontour(x,y,'r',100) uses 100 points per dimension.
%
%  The optional argument COORDS should be a 1 x 4 matrix [XMIN XMAX YMIN
%  YMAX] that determines the bounding box where the joint PDF is evaluated.
%  This can be helpful to set manually when plotting two or more contours
%  on the same figure, to ensure that they are evaluated over the same
%  grid.
%  Example: gaussiancontour(x,y,'r',100,[1 2 -1 5]) evaluates the contour
%  over the box from 1 to 2 on the x-axis and -1 to 5 on the y-axis.
function gaussiancontour(x,y,varargin)
%Default plot color.
plotcolor = 'b';
%Default grid points per dimension.
gridpoints = 200;
%Optional input arguments.
if (~isempty(varargin))
    plotcolor = varargin{1};
end
if (length(varargin) > 1)
    gridpoints = varargin{2};
end

%Check input dimensions.
[mx nx] = size(x);
[my ny] = size(y);
if ((mx < 2) | (nx ~= 1))
    error('Input argument X must be a column vector with length at least 2.')
end
if ((my < 2) | (ny ~= 1))
    error('Input argument Y must be a column vector with length at least 2.')
end

%Get minimum and maximum coordinate values.
xmin = min(x);
xmax = max(x);
ymin = min(y);
ymax = max(y);
%Substitute xmin, xmax, ymin, and ymax values with desired coordinates. 
if (length(varargin) > 2)
    coords = varargin{3};
    [cx cy] = size(coords);
    if ((cx ~= 1) | (cy ~= 4))
        error('Input argument COORDS must be a row vector with 4 entries [xmin xmax ymin ymax].')
    end
    xmin = coords(1);
    xmax = coords(2);
    ymin = coords(3);
    ymax = coords(4);
    if (xmin >= xmax)
        error('Input argument COORDS = [xmin xmax ymin ymax] does not satisfy xmin < xmax.')
    end
     if (ymin >= ymax)
        error('Input argument COORDS = [xmin xmax ymin ymax] does not satisfy ymin < ymax.')
    end
end

%Generate grid points for joint pdf evaluation.
[xpoints ypoints] = meshgrid(linspace(xmin,xmax,gridpoints),linspace(ymin,ymax,gridpoints));
%Evaluate joint Gaussian pdf at grid points.
fXY = mvnpdf([xpoints(:) ypoints(:)],mean([x y]),cov([x y]));
%Reshape into a format suitable for contour plot.
fXY = reshape(fXY,size(xpoints)); 
%Plot bivariate Gaussian contour.
contour(xpoints,ypoints,fXY,plotcolor)

