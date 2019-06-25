function svar = symmetricnuclearplot()

EF=22.1; %MeV
A=-126.0631; %MeV
B=73.2298; %MeV
sigma=1.9372
%particle density
u=[0:0.001:2];
%energy per particle less its rest mass
svar=EF*u.^(2/3)+(A.*u)/2+(B*(u.^(sigma)))/(sigma+1);
plot(u,svar);
xlabel('u=n/n0')
ylabel('E/A-mN')
