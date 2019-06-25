
%% COMPUTATIONAL LAB 4
%% SECTION I: PARTITION FUNCTIONS AND ASSOCIATED THERMODYNAMIC

%% QUESTION (1): Calc rotational partition func, av KE & Cp for parahydrogen. Plot the Cp as a func. of kT/epsilon.
% PART 1,2 & 3: Parahydrogen, orthodhydrogen & normal hydrogen
close all
clear
clc

epsilon = 0.0076; %[eV] rotational const. for H2
k = 8.617332*10^(-5); %[eV.K^-1] Boltzmann Const.
T = 0:0.5:700; %[K] temp range
B = 1./(T*k);
j_p = 0:2:1000; %Generate even no.'d energy levels
j_o = 1:2:1001; %Generate odd no.'d energy levels
E = @(j)(j.*(j+1)*epsilon);%Total rotational energy per state
g = @(j)(2.*j + 1); %Calc degeneracy of state
E_p = E(j_p); %Calc E and degeneracy levels: para & ortho
E_o = E(j_o);
g_p = g(j_p);
g_o = g(j_o);
Z_p = zeros(1,numel(T)); %Preallocate arrays
Z_o = zeros(1,numel(T)); % " "
Av_E_p = zeros(1,numel(T));% " "
Av_E_o = zeros(1,numel(T));% " "
Cp_p = zeros(1,numel(T)); % " "
Cp_o = zeros(1,numel(T)); % " "


for i = 1:numel(T); %Calc the partition functions for para/ortho
    Z_p(i) = sum(g_p.*exp(-E_p.*(B(i))));
    Z_o(i) = sum(g_o.*exp(-E_o.*(B(i))));
end

%CENTRAL DIFFERENCE
Av_E_p(1)=0;%Set starting value
Av_E_o(1)=0;
for i = 2:(numel(T)-1); %Calc the partition functions for para/ortho
    Av_E_p(i) = -((log(Z_p(i+1)) - log(Z_p(i-1))) / ((B(i+1)-B(i-1))));
    Av_E_o(i) = -((log(Z_o(i+1)) - log(Z_o(i-1))) / ((B(i+1)-B(i-1))));
end

%CENTRAL DIFFERENCE
for i = 2:(numel(T)-1); %Calc the heat capacity for para/ortho
    Cp_p(i) = (Av_E_p(i+1) - Av_E_p(i-1)) / ((T(i+1)-T(i-1)));
    Cp_o(i) = (Av_E_o(i+1) - Av_E_o(i-1)) / ((T(i+1)-T(i-1)));
end

%Normal hydrogen is a mixture of 1/4 parahydrogen and 3/4 orthohydrogen
Z_n = 0.25.*Z_p + 0.75*Z_o;
Av_E_n = 0.25.*Av_E_p + 0.75*Av_E_o;
Cp_n = 0.25.*Cp_p + 0.75*Cp_o;

%generate arrays for ease of plotting
x = (k*T)/epsilon;
x_adj = (k*T(1:numel(Cp_p)))/epsilon;%adjust to reduce xvals (cntrldiff)

figure(1)
plot(x , Z_p/k, x , Z_o/k, x , Z_n/k);
title('System Partition Function (Z) of Hydrogen vs. T')
xlabel('Dimensionless Temperature, kT/\epsilon')
ylabel('Z')
legend('parahydrogen', 'orthohydrogen','normal');

figure(2)
plot(x , Av_E_p/k, x , Av_E_o/k, x , Av_E_n/k);
title('Average Energy of of Hydrogen vs. T')
xlabel('Dimensionless Temperature, kT/\epsilon')
ylabel('Average Energy, E/k')
legend('parahydrogen', 'orthohydrogen','normal');
xlim([0.1, 7])

figure(3)
plot(x_adj, Cp_p/k, x_adj, Cp_o/k, x_adj, Cp_n/k);
title('Heat capacity of Hydrogen vs. T')
xlabel('Dimensionless Temperature, kT/\epsilon')
ylabel('Heat capacity, Cp/k')
legend('parahydrogen', 'orthohydrogen','normal');
xlim([0.1, 7])
ylim([0, 1.6])
%Heat capacity of all types of hydrogen