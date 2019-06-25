function tabell = diffsolver_with_lambda(y,a,b,n)

%intial values for th eradius, x and mass, z
x= 1e-5; z=1e-10;
h=0.0025 %step length
% the 4th order runge-kutta routine
kk=0;kl=0;km=0;kn=0;lk=0;ll=0;lm=0;ln=0;

for i=1:n
    kk=h*FF(x,y,z,a);
    lk=h*G(x,y,z,b);
    kl=h*FF(x+h/2,y+kk/2,z+lk/2,a);
    ll=h*G(x+h/2,y+kk/2,z+lk/2,b);
    km=h*FF(x+h/2,y+kl/2,z+ll/2,a);
    lm=h*G(x+h/2,y+kl/2,z+ll/2,b);
    kn=h*FF(x+h,y+km,z+lm,a);
    ln=h*G(x+h,y+km,z+lm,b);
    
    y=y+(kk/6)+(kl/3)+(km/3)+(kn/6);
    z=z+(lk/6)+(ll/3)+(lm/3)+(ln/6);
    tabell(1,i)=x;
    tabell(2,i)=y;
    tabell(3,i)=z;
    x = x+h;
end 

%plotting
d=size(tabell);
e=zeros(d(2)/100);
f=zeros(d(2)/100);
g=zeros(d(2)/100);

for i=1:d(2)/100
    e(i)=tabell(1,100*i);
    f(i)=tabell(2,100*i);
    g(i)=tabell(3,100*i);
end
subplot(2,1,1), plot(e,f);
subplot(2,1,2), plot(e,g);

% %zeros
% [dimj,dimi]=size(tabell);
% posverdi1=0;
% negverdi1=0;
% posverdi2=0;
% negverdi2=0;
% svar=zeros(2);
% i=1;
% 
% while tabell(2,i) > 0
%     posverdi1=tabell(1,i);
%     posverdi2=tabell(3,i);
%     if i<(dimi-1)
%         negverdi1=tabell(1,i+1);
%         negverdi2=tabell(3,i+1);
%     else
%         disp('This function does not have a zero point.')
%     end
%     
%     i=i+1;
% end
% svar(1,1)=(posverdi1 + negverdi1)/2;
% svar(1,2)=(posverdi2 + negverdi2)/2;
% for n=1:dimi
%     if tabell(2,n)==0
%         svar(1,1)=tabell(1,n);
%         svar(1,2)=tabell(3,n);
%     end
% end
% format long
% disp(svar)