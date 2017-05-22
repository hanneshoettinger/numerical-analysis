
clearvars;

X0 = [0;0];     % Startposition Mr. X (Herrchen)
B0 = [-5;0];    % Startposition Bello (Hund)

e = 2;          % Geschwindigkeit Herrchen
s = 1;          % Geschwindigkeit Bello

h = 0.0001;       % Zeitintervall
tmax = 20;       % Simulationsende

% Simulation:
X = X0;
B = B0;

axis([-20, 0, 0, 20]);       %values of x/y-axis
mrx=animatedline('Color','r');
bello=animatedline('Color','b');
for t=0:h:tmax
    % Bello läuft richtung Herrchen:
    v2 = X - B;
    v2 = v2 / norm(v2) * s * h;     % Geschwindigkeitsvektor
    B = B + v2;
    
    % Herrchen läuft weiter nur in y-Richtung:
    X(2) = X(2) + e * h;
    
    addpoints(mrx, X(1), X(2));
    addpoints(bello, B(1), B(2));
    drawnow update;
end





