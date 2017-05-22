function [ r, phi ] = karth2polar( x,y )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

r = sqrt(x^2 + y^2);

if (x > 0)
    phi = atan(y/x);
elseif (y >= 0 && x < 0)
    phi = pi + atan(y/x);
elseif (y < 0 && x < 0)
    phi = -pi + atan(y/x);
elseif (y > 0 && x == 0)
    phi = pi/2;
elseif (y < 0 && x == 0)
    phi = -pi/2;
else
    phi = 0;
    
end

