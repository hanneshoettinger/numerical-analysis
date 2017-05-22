format long;

clearvars;

BelloStart=[-5, 0];
b = 1; % Bello velocity
s = 2; % Mr. X Velocity

simulationSteps = 10000;
tmax = 10;
deltaT = tmax / simulationSteps;
tk = 0;

belloX = zeros(simulationSteps+1, 1);
belloY = zeros(simulationSteps+1, 1);
belloX(1)=BelloStart(1);
belloY(1)=BelloStart(2);
belloPos = BelloStart;

mrXX = zeros(simulationSteps+1, 1);
mrXY = zeros(simulationSteps+1, 1);
mrXX(1)=0;
mrXY(1)=0;

axis([-6, 0, 0, 20]);       %values of x/y-axis
mrx=animatedline('Color','r');
bello=animatedline('Color','b');

for i=2:(simulationSteps+1)
    % Calculate bello
    tk = tk + deltaT;
    belloPos = explicitEulerBello(b, s, belloPos, tk, deltaT, 10);
    belloX(i)=belloPos(1);
    belloY(i)=belloPos(2);
    
    % Calculate Mr. X
    mrXX(i) = 0;
    mrXY(i) = tk * s;
    
    addpoints(mrx, mrXX(i), mrXY(i));
    addpoints(bello, belloX(i), belloY(i));
    drawnow update;
end

