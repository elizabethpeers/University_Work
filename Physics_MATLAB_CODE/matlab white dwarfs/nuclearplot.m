function svar = nuclearplot(n)

%constants
EF=22.1; A=400; B=73.23; sigma=1.937; alpha=1; s0=30; n0=0.16; mN=9.38; gamma=1; h=6.582119514e-16;
EF0=(3/5)*((h^2)/(2*mN))*((3*(pi^2)*n0)/2)^(2/3);
%particle density
u=[0:0.0005:10];
a=size(u);
j=a(2);
con=((2^(2/3))-1);
for i=1:j
    %energy density
    e(i)=EF*u(i).^(2/3)+(A*u(i))/2+(B*(u(i).^(sigma)))/(sigma+1);
    svar(1,i)=e(i)+n0*(con*EF0*((u(i).^(5/3))-(u(i).^(gamma+1)))+s0*(u(i).^(gamma+1)));
    %n0*u(i)*(mN+EF*u(i)^(2/3)+(A*u(i))/2+(B*(u(i)^(sigma)))/(sigma+1)+(alpha^2)*(2^(2/3)-1)*EF*(u(i)^(2/3)-u(i)^n)+s0.*u(i)^n);
%     energy=svar(1,i)
    %pressure
    p(i)=(2*n0*EF*u(i).^(5/3))/3+(n0*A*u(i).^2)/2+((B*sigma*n0)/(sigma+1))*u(i).^(sigma+1);
     svar(2,i)=p(i)+n0*((con/3)*EF0*((2*(u(i).^(5/3)))-(3*gamma*(u(i).^(gamma+1)))+s0*gamma*(u(i).^(gamma+1))));
     %(2*n0*EF*u(i)^(5/3))/3+(n0*A*u(i)^2)/2+((B*sigma*n0)/(sigma+1))*u(i)^(sigma+1)+n0*alpha^2*(((2^(2/3)-1)/3)*EF*(2*u(i)^(5/3)-3*u(i)^2)+s0*u(i)^2);
%     pressure=svar(2,i)
%     
end

plot(u,svar)
legend('Energy Density', 'Pressure p')
ylabel('MeV/fm^3')
xlabel('u=n/n0')
%     plot(u,energy)