function g=G(x,y,z,v)

% 
%  %the values for the fitting constants for white dwarfs
% a1=-3.45432844877789e5;
% a2=0.47013474067981e5;
% %fitting function for white dwarfs
%  g=b*(x^2)*((y^(3/4))*(a1+a2));
% 
% %the fitting constants for neutron stars 
%%fermi gas
%a1=1.145774;
%a2=2.999737;
%%nuclear matter
a1=0.1518e-4;
a2=2.430;
epsilon_0=3404.1;
% %fitting function for neutron stars
% g=b*(x^2)*((a1*(y^(3/5))+a2*y));
% %the nuclear fitting function for neutron stars
g=v*(x^2)*(((y^(1/a2)*epsilon_0^((1/a2)-1))/(a1^(1/a2))));
% %not fitting equation
% g=b*(x^2)*((y^(3/4)));