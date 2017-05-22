
function [rA, rB] = bsp6(x, y)

if length(x) ~= length(y)
    return
end

sumA = 0;
sumB = 0;
syms a;
syms b;
for index = 1:length(x)
    [~, phi] = karth2polar(x(index), y(index));
    
    fA = -2*cos(phi)*(x(index)-a*cos(phi));
    fB = -2*sin(phi)*(y(index)-b*sin(phi));    
    sumA = sumA + fA;
    sumB = sumB + fB;
end

rA = solve(sumA, 'a'); 
rB = solve(sumB, 'b');

t = -pi:0.01:pi;
plotX = rA * cos(t);
plotY = rB * sin(t);
hold on;
plot(plotX, plotY);
plot(x, y, '+');
hold off;