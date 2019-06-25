function svar = nuclearplot(n)

%constants
EF=22.1; A=-126.1; B=73.23; sigma=1.937; alpha=1; s0=30; n0=0.16; mN=9.38;

%particle density
u=[0:0.0005:5];
a=size(u);

for i=1:a(2)
    %energy density
    svar(1,i)=n0*u(i)*(mN+EF*u(i)^(2/3)+(A*u(i))/2+(B*(u(i)^(sigma)))/(sigma+1)+(alpha^2)*(2^(2/3)-1)*EF*(u(i)^(2/3)-u(i)^n)+s0.*u(i)^n);
    
    %pressure
    svar(2,i)=(2*n0*EF*u(i)^(5/3))/3+(n0*A*u(i)^2)/2+((B*sigma*n0)/(sigma+1))*u(i)^(sigma+1)+n0*alpha^2*(((2^(2/3)-1)/3)*EF*(2*u(i)^(5/3)-3*u(i)^2)+s0*u(i)^2);
end

