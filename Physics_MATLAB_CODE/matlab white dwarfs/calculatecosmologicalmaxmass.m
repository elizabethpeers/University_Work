function svar = calculatecosmologicalmaxmass(rho)
k = [0:0.001:1]
%constants
Msun = 1.98892e30;
c = 2.9979e8;
G=6.67e-11;
a=sqrt((3*c^6)/(8*pi*G^3*rho));
svar(1,:) = k;
n=size(k);
for i=1:n(2)
    svar(2,i)=(0.5*a*(1-((1/3*k(i))^(4/(3-k(i)))))^(1.5))/Msun;
end