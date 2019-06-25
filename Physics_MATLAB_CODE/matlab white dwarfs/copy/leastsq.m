%**********************************************
%leastsq.m can be passed to fminsearch to do a non-linear least squares fit
%of fitfunction(a,x) to the data set(x,y). a is a vector of varible
%parameters; xand y are the arrays of data points
%***************************************************

function s = leastsq(a,x,y)
%find s, the sum of the squars of the differences between the fitting
%funciton and the data.
s = sum((y-fitfunction(a,x)).^2);
end