format long;

clearvars;

BelloStart=[-5, 0];
MrXStart=[0, 0];
b = 1; % Bello velocity
s = 2; % Mr. X Velocity

simulationSteps = 100;
tmax = 10;
deltaT = tmax / simulationSteps; % Represents h
tk = 0;

belloX = zeros(simulationSteps+1, 1);
belloY = zeros(simulationSteps+1, 1);
belloX(1)=BelloStart(1);
belloY(1)=BelloStart(2);
belloPos = BelloStart;

mrXX = zeros(simulationSteps+1, 1);
mrXY = zeros(simulationSteps+1, 1);
mrXX(1)=MrXStart(1);
mrXY(1)=MrXStart(2);
mrXPos = MrXStart;

for i=2:(simulationSteps+1)
    % Calculate bello
    velocityLength = sqrt(belloPos(1)^2 + (mrXPos(2) - belloPos(2))^2);
    belloPos(1)=belloPos(1)+(-belloPos(1)/velocityLength)*b*deltaT;
    belloPos(2)=belloPos(2)+((mrXPos(2)-belloPos(2))/velocityLength)*b*deltaT;
    belloX(i)=belloPos(1);
    belloY(i)=belloPos(2);
    
    
    % Calculate Mr. X
    mrXPos(1) = 0;
    mrXPos(2) = mrXPos(2) + s*deltaT;
    mrXX(i) = mrXPos(1);
    mrXY(i) = mrXPos(2);
end

figure;
plot(belloX, belloY, 'LineWidth', 2);

hold on;
plot(mrXX, mrXY, 'Color', 'Red', 'LineWidth', 2);
