format long;
clear vars;

% Startwerte für t = 0
startValues = [1, -1, 1, 1/3];
h = 0.1;
hEuler = 0.1;
orbitalPeriod = 38;
numPeriods = 10;
tFinal=orbitalPeriod * numPeriods;
numIterations=tFinal/h;

W=startValues;

pointsX=zeros(numIterations+1);
pointsY=zeros(numIterations+1);

pointsX(1) = startValues(1);
pointsY(1) = startValues(3);

axis([-3, 7, -12, 2]);       %values of x/y-axis
orbit=animatedline('Color','b');

for tn=1:numIterations
    W = explicitEuler(W, h, hEuler);
    
    pointsX(tn+1)=W(1);
    pointsY(tn+1)=W(3);
    
    addpoints(orbit, pointsX(tn), pointsY(tn));
    drawnow update;
    pause(0.01);
end

%figure;
%plot(pointsX, pointsY, 'LineWidth', 2);