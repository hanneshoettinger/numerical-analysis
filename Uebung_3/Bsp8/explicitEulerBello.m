function result = explicitEulerBello( b, s, yk, tk, dt, n )
%EXPLICITEULER Bello woof woof
% b Bello velocity
% s velocity of Mister X
% yk Initial Bello position
% tk The new value of t
% dt the time interval to advance
% The number of simulation steps. Will be used as 2^n
%   Bello says Woof!

format long;

steps = 2^n;
h = dt / steps;



for k=1:steps
    velocityLength = sqrt(yk(1)^2 + (s*tk - yk(2))^2);
    yDerived = [-yk(1)/velocityLength, s*tk-yk(2)];
    yDerived = yDerived.*b;
    
    yk = yk + h.*yDerived;
end

result = yk;