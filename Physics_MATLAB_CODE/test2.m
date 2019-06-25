%# make some test data
[xx,yy]=ndgrid(-5:0.1:5,-5:0.1:5);
zz = -exp(-xx.^2/2+-yy.^2/2);
zz1 = zz;
zz1(zz1<0.5)=NaN;
zz2 = zz;
zz2(zz2>0.5)=NaN;

%# plot first surface, set colormap
surf(zz1)
colormap('gray')

%# stretch colormap to [0 0.5]
caxis([0 0.5])

%# plot the second surface in red
hold on
surf(zz2,'faceColor','r')