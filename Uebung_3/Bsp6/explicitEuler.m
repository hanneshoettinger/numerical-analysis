function result = explicitEuler( startValues, h, hEuler)
%EXPLICITEULER Summary of this function goes here. And some magic from
%unicorns
%   Detailed explanation goes here with even more magic

format long;

Wk = startValues;
eulerStep = h * hEuler;

for k=eulerStep:eulerStep:h;
    yDerived = [Wk(2), -Wk(1)/(Wk(1)^2 + Wk(3)^2)^(3/2), Wk(4), -Wk(3)/(Wk(1)^2+Wk(3)^2)^(3/2)];
    Wk = Wk + eulerStep.*yDerived;
end

result = Wk;