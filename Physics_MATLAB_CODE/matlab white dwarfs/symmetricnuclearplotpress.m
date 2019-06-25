function svar = symmetricnuclearplotpress()
close all
EF=22.1; %MeV
n0=0.16; %   /fm^(-3)
A=-118.2; %MeV
B=65.38; %MeV
sigma=2.112;
%particle density
u=[0:0.001:10];
%energy per particle less its rest mass

svar(1,:)=(2*n0*EF*u.^(5/3))/3+(n0*A*u.^2)/2+((B*sigma*n0)/(sigma+1))*u.^(sigma+1);

svar(2,:)=EF*u.^(2/3)+(A.*u)/2+(B*(u.^(sigma)))/(sigma+1);

plot(u,svar), axis([0 2 -20 20])
ylabel('MeV/fm^3');xlabel('u=n/n0')
line([0 2], [0 0])
