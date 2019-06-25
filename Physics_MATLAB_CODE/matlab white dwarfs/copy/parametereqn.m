function [ans] = parametereqn(k)

BE=-16;
EF=22.1;

%parameter equations
ans(1)=(k+2*EF)/(3*EF-9*BE);
ans(2)=((ans(1)+1)/(ans(1)-1))*((EF/3)-BE);
ans(3)=BE-(5/3)*EF-ans(2);