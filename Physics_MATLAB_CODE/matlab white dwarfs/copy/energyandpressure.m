%*************************************************************************
%this function calculates the data points for the equation of state, i.e.
%the energy density dependence of the pressure for Fermi gas. The energy
%density and pressure are both paramerised.
%*************************************************************************

function svar = energyandpressure()
%white dwarf fitting constants
konst = 5.477e19
konst1 = (1.440559478939809e23)/konst;
konst2 = (8.829110575801710e25)/konst;
konst3 = (6.002331162249205e21)/konst;
%neutron star fitting constants
konst = 6.2603e32;
konst1 = (2.058113267386856e35)/konst;
konst2 = (6.860377557956187e34)/konst;

%interval of k-values
k = [0: 0.0005: 0.9995,1 :0.6 : 600];
n = size(k);

%neutron star without electrons)
for i = 1:n(2)
    svar(1,i) = ((2*(k(i)^3)-(3*k(i)))*sqrt(1+k(i)^2) + 3*asinh(k(i))/3);
    svar(2,i) = ((2*(k(i)^3)+k(i))*sqrt(1+k(i)^2) - asinh(k(i)));
end

%white dwarf (with electrons, the third term in svar(2,i))
for i = 1:n(2)
    svar(1,i) = konst3*((2*(k(i)^3)-(3*k(i)))*sqrt(1+k(i)^2) + 3*asinh(k(i))/3);
    svar(2,i) = konst1*((2*(k(i)^3)+k(i))*sqrt(1+k(i)^2) - asinh(k(i))) + konst2*(k(i)^3);
end
