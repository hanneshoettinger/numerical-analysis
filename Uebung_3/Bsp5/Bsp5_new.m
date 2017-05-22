% Übungsblatt 3, Beispiel 5

clearvars;  % Clear variables
clear       % Clear command history
clc         % Clear command window
clf         % Clear figure window
close force all

% Anfangsbedingungen
l = 4;                      % Pendellänge
g = 9.81;
initialAngle = pi/2;        % Anfganswinkel
initialVelocity = 0;       	% Anfangsgeschwindigkeit


origin = [0; l];    % Position des Pendelursprungs
runtime = 8;        % Simulationsdauer
tx = 0;             % Hilfsvariable für Winkel-Figure

% Pendelgleichungen als System 1. Ordnung:
linear   = @(t,y) [y(2); -g/l * y(1)     ];
unlinear = @(t,y) [y(2); -g/l * sin(y(1))];

% ode solver: 
[~,linSolution]   = ode45(  linear,[0:0.01:runtime],[initialAngle initialVelocity]);
[t,unlinSolution] = ode45(unlinear,[0:0.01:runtime],[initialAngle initialVelocity]);

% Lösung als transponierten Vektor interpretieren (=Zeile von Lösungswerten):
lSol1 =   linSolution(:,1)';      % Winkel phi
lSol2 =   linSolution(:,2)';
uSol1 = unlinSolution(:,1)';
uSol2 = unlinSolution(:,2)';

arraysize = size(t);                    % Defines array size of time intervals
timestep = t(runtime) - t(runtime-1); 	% Calculates the time step of these intervals

% Pendelkoordinaten in kartesischem Koordinatensystem:
% (sin, cos vertauscht, da 0° unten ist)
linearPos   = [l*sin(lSol1); l*cos(lSol2)];   
unlinearPos = [l*sin(uSol1); l*cos(uSol2)];


for i = 1 : max(arraysize)
    subplot(2,1,1)  % 2x1 figures im Fenster, Figure 1 = aktiv
    plotarrayx = [origin(1) linearPos(1, i)];
    plotarrayy = [origin(2) linearPos(2, i)];
    plot(linearPos(1, i), linearPos(2, i),'ko',plotarrayx,plotarrayy,'b-') 
   
    hold on
    plotarrayx = [origin(1) unlinearPos(1, i)];
    plotarrayy = [origin(2) unlinearPos(2, i)];
    plot(unlinearPos(1,i),unlinearPos(2, i),'ko',plotarrayx,plotarrayy,'r-')
    
    xlabel('x','fontsize',12)
    ylabel('y','fontsize',12)
    axis([min(l*sin(lSol1)) max(l*sin(lSol1)) min(l*cos(lSol2)) max(l*cos(lSol2))])
    hold off
    
    subplot(2,1,2)    
    plot(t(i),lSol1(i),'bo')
    plot(t(i),uSol1(i),'ro')
   
    xlabel('t','fontsize',12)
    ylabel('\phi','fontsize',12)
    
    hold on
    axis([0 t(i)+(t(2)-t(1)) min(uSol1) max(uSol1)])
    tx = tx + timestep;             % Aligns results with the figure window
    pause(0.01)
end
