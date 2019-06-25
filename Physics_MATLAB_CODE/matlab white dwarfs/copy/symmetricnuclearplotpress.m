function svar = symmetricnuclearplotpress()

EF=22.1; %MeV
n0=0.16 %   /fm^(-3)
A=-118.2; %MeV
B=65.38; %MeV
sigma=2.112
%particle density
u=[0:0.001:1.5];
%energy per particle less its rest mass
svar=(2*n0*EF*u.^(5/3))/3+(n0*A*u.^2)/2+((B*sigma*n0)/(sigma+1))*u.^(sigma+1);
plot(u,svar), axis([0 1.5 -2 10]);
ylabel('p(u)');xlabel('u=n/n0')
