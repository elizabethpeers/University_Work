function f=F(x,y,z,u)
% %the values for the fitting constants for white dwarfs
% a1=-3.45432844877789e5;
% a2=0.47013474067981e5;
% 
% %fitting function for white dwarfs
% f=((-u)*z*(a1*(y^(3/4))+a2*(y^(3/4))))/(x^2);

% %the fitting constants for neutron stars 
%%fermi gas
%a1=1.145774;
%a2=2.999737;
%epsilon_0=3404.1;
%nucleaar matter
a1=0.1518e-4;
a2=2.430;
 epsilon_0=3404.1;

% %fitting function for neutron stars
% f=((-u)*z*(a1*(y^(3/5))+a2*y))/(x^2);
% %the nuclear fitting function for neutron stars
% f=((-u)*z*((y^(1/a2))/(a1^(1/a2))))/(x^2);
% %not fitting equation
% f=(((-u)*z*(y^(3/4)))/(x^2));


% K=9.397694715284140e-26;
% d=7.0299e-47*(((1/K)*((1.473/u)^(5/3)))^(3/2));
% epsilon_0=6.26031e32;
% epsilon_0=(1/K*(1.473/u)^(gamma))^(1/(gamma-1));
d=epsilon_0*7.0299323e-47;
%%terms of equation dp/dr
f1=1+((a1*(y^(2/5))));
f2=1+d*(((x^3)*y)/z);
f3=(1-((2.946*z)/x))^(-1);

%%TOV equation, no fitting equation
%f=(((-u)*z*(y^(3/5)))/(x^2))*f1*f2*f3;
%%TOV equation, fitting equation
% f=(((-u)*z*(a1*(y^(3/5))+a2*y))/(x^2))*f1*f2*f3;
%%TOV equation, nuclear fitting equation
f=(((-u)*z*((y^(1/a2)*epsilon_0^((1/a2)-1))/(a1^(1/a2))))/(x^2))*f1*f2*f3;
