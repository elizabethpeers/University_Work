function a = fit()
clear;close all; clc;
%input data to be fitted
x = splittingtablex(energyandpressure());
y = splittingtabley(energyandpressure());
%plot of fitting function
xmin = min(x);
xmax = max(x);
npts = 1001;
dx = (xmax-xmin)/(npts-1);
xplot = xmin:dx:xmax;
%set ifit to 0 and dont continue on to the fit until I is set to 1
ifit = 0;
while ifit==0
    disp('Enter an initial guess for the function')
    a = input('parameters [a1,a2,...] in vector form [..]-')
    %plot the data and the initial guess
    yplot = function(a,xplot);
    plot(x,y,'b*',xplot,yplot,'r-')
    xlabel('x')
    ylabel('y')
    ifit = input('Enter 0 to guess again, 1 to try to fit with this guess')
    end
    
    option = optimset('MaxFunEvals',1000000,'MaxIter',1000000);
    a = fminsearch(@leastsq,a,option,x,y)
    %plot the data and the final function fit
    yplot = fitfunction(a,xplot);
    plot(x,y,'b*',xplot,yplot,'r-');
    xlabel('x')
    ylabel('y')
    title('Final Fit and Data')
end 