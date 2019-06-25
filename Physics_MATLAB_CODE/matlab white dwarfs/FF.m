function f=FF(x,y,z,u)

%%constants
gamma=5/3;
K=9.397694715284140e-26;
lambda=1e17;
epsilon_0=6.2603e32;
d=epsilon_0*7.0299323e-47;
e=lambda/(2.946*8.988e16);

%%terms of the equation dp/dr
f1=1+((y^((gamma-1)/gamma))*(1.914^(1/gamma)));
f2=1+d*(((x^3)*y)/z)-e*(x^3/z);
f3=(1-((2.946*z)/x))^(-1);

%%TOV equation with cosmological constant lambda
%f=(((-u)*z*(y^(1/gamma)))/(x^2))*f1*f2*f3;

%%fitting constants for neutrin stars
%%fermi gas
a1=1.145774;
a2=2.999737;

%%TOV equation, fitting equation with cosmological constant lambda
f=((-u)*z*(a1*(y^(3/5)+a2*y))/(x^2))*f1*f2*f3;