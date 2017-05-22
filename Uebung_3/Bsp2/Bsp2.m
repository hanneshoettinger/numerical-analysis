% Übungsblatt 3, Beispiel 2

clearvars;
format long;

phi = 1;            %
t_max = 1;          % Integrationsweite
y_start = [1; 1];   % Anfangsbedingung y1(t=0), y2(t=0)

result = zeros(15, 9);

% Exakte Lösung
y1_exact = exp(-t_max);
y2_exact = exp(-t_max) + phi * t_max * exp(-t_max);
fprintf('Exakte Lösungen:\n y1(%d) = %.10f\n y2(%d) = %.10f\n', t_max, y1_exact, t_max, y2_exact);


% Explizites Euler Verfahren
for n=1:16          % Anzahl der Schritte
	%h = 1 / n;     % Schrittweite  1, 1/2, 1/3, 1/4, ...
    h = 2^(-n);     % Schrittweite  1, 1/2, 1/4, 1/8, ...
	
	y1_approx = y_start(1);
	y2_approx = y_start(2);
    
	for i=h:h:t_max        
        y1_abl = -y1_approx;
        y2_abl = phi * y1_approx - y2_approx;
        
        % Nächster Funktionswert = Alter Wert + h * Ableitung
        y1_approx = y1_approx + h * y1_abl;
        y2_approx = y2_approx + h * y2_abl;
	end
	% Durchschnittlicher Fehler
	error = y1_exact - y1_approx;
	error = error + y2_exact - y2_approx;
	error = error / 2;
	
    result(n, 1) = h;
    result(n, 2) = y1_approx;
	result(n, 3) = y2_approx;
	result(n, 4) = error;
	
	% Fehlerreduktion
	if n > 1
        last_error =  result(n - 1, 4);
		result(n, 5) = error / last_error;
	end	
end

% Klassisches Runge-Kutta Verfahren
for n=1:16          % Anzahl der Schritte
	%h = 1 / n;     % Schrittweite  1, 1/2, 1/3, 1/4, ...
    h = 2^(-n);     % Schrittweite  1, 1/2, 1/4, 1/8, ...
    
    y1_approx = y_start(1);
	y2_approx = y_start(2);
    
    for i=h:h:t_max
        % y1
        k1 = -y1_approx;
        k2 = -(y1_approx + h/2 * k1);
        k3 = -(y1_approx + h/2 * k2);
        k4 = -(y1_approx + h * k3);
        
        y1_approx_new = y1_approx + h * (1/6) * (k1 + (2*k2) + (2*k3) + k4);
        
        % y2
        k1 = phi * y1_approx - y2_approx;
        k2 = phi * -k2 - (y2_approx + h/2 * k1);
        k3 = phi * -k3 - (y2_approx + h/2 * k2);
        k4 = phi * -k4 - (y2_approx + h * k3);
        
        y2_approx = y2_approx + h * (1/6) * (k1 + (2*k2) + (2*k3) + k4);
        y1_approx = y1_approx_new;
    end
	% Durchschnittlicher Fehler
	error = y1_exact - y1_approx;
	error = error + y2_exact - y2_approx;
	error = error / 2;
	
    result(n, 6) = y1_approx;
	result(n, 7) = y2_approx;
	result(n, 8) = error;
    
    % Fehlerreduktion
	if n > 1
        last_error =  result(n - 1, 8);
		result(n, 9) = error / last_error;
	end	
end

disp('Done');
disp('                                  Euler Verfahren                                                              Runge-Kutta Verfahren');
disp('           h                   y1                  y2                Fehler         Fehlerreduktion            y1                  y2                Fehler         Fehlerreduktion');
disp(result);
