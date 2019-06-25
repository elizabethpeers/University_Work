function f = fitfunction(a,x)
n=size(x)
%fitting functions
%white dwarfs
for i=1:n(2)
    f(i)=a(1)*(x(i)^(3/5)) + a(2)*(x(i)^(3/4));
end
%neutron stars
for i=1:n(2)
    f(i)=a(1)*x(i)^(3/5)) + a(2)*x(i);
end

%neutron stars with nonsymmetric nuclear matter
for i=1:n(2)
    f(i) = a(1)*x(i)^(a(2));
end
end 