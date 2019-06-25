function svar = calculatecosmologicalpressure(k,q)

z=[0:100:q] %radius
rho=1e18;
c=2.9979e8;
G=6.67e-11;
a=sqrt((3*c^2)/(8*pi*G*rho));
R=20000;
x=asin(z./(R*a));
chi=cos(asin(1/a));
svar(1,:) =z./R;
n=size(z);
for i=1:n(2)
    svar(2,i)=(((cos(x(i)))^((3-k)/(k))-k*k*chi^((3-k)/(k)))/(3*k*chi^((3-k)/(k))-(cos(x(i)))^((3-k)/(k))));
end
