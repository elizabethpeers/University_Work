function svar = energyandpressuresymmetric()

A=-366.1; %MeV 
B=313.3; %MeV
sigma=1.161;
n0=0.16; %nucleons/fm^3
EF=22.1; %MeV
konst=0.03377372788078;
mN=938; %MeV
hc=197.3; %MeVfm
const=1.602176e11; %conversion factor to SI-units

k=[1.68: 0.001:2];
n=size(k);

%neutron star with electrons
for i=1:n(2)
    svar(1,i)=const*n0*hc(((2*EF)/3)*((konst*(mN^3)*(k(i)^3))/((hc^3)*n0))^(5/3)+(A/2)*((konst*(mN^3)*(k(i)^3))/(n0*(hc^3)))^2+((B*sigma)/(sigma+1))*((konst*(mN^3)*(k(i)^3))/(n0*(hc^3)))^(sigma+1));

     svar(2,i)=(const/(hc^2))*(konst*(mN^3)*(k(i)^3))*(mN+((3*mN*(k(i)^2))/(10))+(((A*konst*(mN^3)*(k(i)^3))/(2*n0*(hc^3)))^3)+((B)/(sigma+1)*((konst*(mN^3)*(k(i)^3))/(n0*(hc^3)))^sigma));
end
