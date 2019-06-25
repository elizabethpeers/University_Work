function svar = snurreplotnuclear(p)
%%nuclear matter model
%a=0.95264796447526;
%b=0.0249020576772661;

%%fermi gas model
a=1.476;
b=0.03778;
n=size(p)

for i=1:n(2)
    svar(1,i)=splittingtablex(plotradiusmassnuclear(p(i),a,b,100));
    svar(2,i)=splittingtabley(plotradiusmassnuclear(p(i),a,b,100));
end 