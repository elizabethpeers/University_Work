%% Lab 3
% Ph3008

%% Part A
% Unbiased &fixed step length 1D random walks

clear; clc; close all;

n=100;
steps=1:n
drunks=20;

%% a)
for k = 1:4
    x= round(rand);
    for i = 2:n
        x=x+round(rand);
    end
    final_position = x;
end

%% b)
swarms =zeros(n,drunks);
figure

for j = 1:drunks
    x=zeros(1,n);
    x(1) = round(rand);
    for i = 2:n
        x(i) = x(i-1) + round(rand);
    end
    swarms(:,j)= x;
    
 
    hold on
    plot(steps,x)
end
plot(steps,-sqrt(steps),steps,sqrt(steps),steps,-2*sqrt(steps), steps,2*sqrt(steps))
title('Swarm walk')
xlabel('n steps')
ylabel('position')
hold off

figure 
subplot(2,2,1), plot(steps,-sqrt(steps), 'r-')
title('Swarm walk (-sqrt)')
xlabel('n steps')
ylabel('position')
subplot(2,2,2),plot(steps,sqrt(steps), 'b-')
title('Swarm walk (sqrt)')
xlabel('n steps')
ylabel('position')
subplot(2,2,3),plot(steps,-2*sqrt(steps), 'c-')
title('Swarm walk (-2xsqrt)')
xlabel('n steps')
ylabel('position')
subplot(2,2,4),plot(steps,2*sqrt(steps), 'y-')
title('Swarm walk (2xsqrt)')
xlabel('n steps')
ylabel('position')
hold off

%% Part B
% Biased and continous

clear; clc; close all;

delta=2; m=1; T=1;
k=1; %1.38064852e-23 %m^2kg/s^2K boltzmann constant
E= @(v) 0.5*m.*v.^2;
vdist(1)=10;

% a)

for n=1:1e4
    vdist;
    change_v=(2*rand-1)*delta;
    V_b=vdist(end) +change_v;
    -(E(V_b)-E(vdist(end)));
    if V_b > 0
        if V_b < vdist(end)
            vdist(end+1) =V_b;
        elseif rand < exp(-(E(V_b)-E(vdist(end)))/(k*T));
            vdist(end+1) = V_b;
        end 
    end
end

subplot(2,1,1), histogram(vdist)
xlim([0 4])
title('Velocity Distribution')
xlabel('Velocity')
ylabel('Frequency')

energy=E(vdist);

subplot(2,1,2), histogram(energy)
xlim ([0 6])
title('Energy distribution') 


%% 