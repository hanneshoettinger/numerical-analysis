% bsp 7

% a)

% (1+x)^(1/2)-1 == x/(1+(1+x)^(1/2))

% b)

% set precision to 15 decimal places
format long e

% element-wise calculation of test values
min = 1;
max = 20;
k = min:max;
x = 10.^-k;
o = ones(min, max);

result = zeros(3, max);

% comparison of the results from both functions
result(2,:) = (1+x).^(1/2)-1;
result(3,:) = x./(1+(1+x).^(1/2));

% c)
terms = [1/2, -1/8, 1/16, -5/128, 7/256, -21/1024, 33/2048, -429/32768, 715/65536, -2431/262144];
rank = 10;

% taylor
for n=1:length(x)
	% inner most term
	sum = terms(rank);
	for i=1:(rank - 1)
		sum = (sum * x(n)) + terms(rank - i);
	end
	result(1, n) = sum * x(n);
end
result = result';

% why is the taylor approx. considered stable?
% for every polynom
% Warum ist die Taylor Approximation stabil?
% Für jedes Polynomglied wird x um einen weiteren Grad exponiert,
% somit wird der Unterschied zwischen den x Werten erhöht
% und die Auslöschung durch Substraktion ähnlich großer Werte verhindert.

% coefficient*e^exponent

% d)

% Die erste Funktion ist numerisch instabil:
% Durch das mehrfache Runden und Subtrahieren wird das Endergebnis verfälscht.

% Da x sich 0 annaehert naehetr sich die Wurzel von 1+x 1 and und wenn ich dann 1 abziehe
% reduziert sich das Ergebnis auf die letzten Stellen und der relative Fehler waechst ser stark an.
% Die zweite Variante ist stabiler weil diese Subtraktion wegfaellt. Damit naehert sich der Term unter
% dem Bruch 2 an und oben haben wir das x noch ohne fehler und deswegen ist das Ergebnis besser, im Sinne davon
% , dass das Ergebnis nicht so schnell 0 wird wie bei der ersten.

% Bei der Taylorreihe gibt es diesen Fehler nicht weil nur immer kleiner werdende Terme addiert oder subtrahiert werden.
% Allerdings werden nie ein nahezu gleich grosser term abgezogen und so ist die Taylor reihe stabil bis der term der n-then
% Ordnund 0 wird. 

% Konkret:
% Das Ergebnis der Rechnung 1+x^(1/2), mit einer sehr kleinen Zahl x, wird aufgrund der double Arithmetik
% auf die 15. Nachkommastelle gerundet und samt Rundungsfehler temporär gespeichert.
% Danach wird mit dem gerundeten Wert subtrahiert (tmp-1) und das Ergebnis erneut gerundet.
% Je kleiner das x desto näher ist das Ergebnis tmp zu 1 und desto stärker wirkt sich der Auslöschungseffekt aus.
% Subtrahiert man nun die zwei annähernd gleichen Zahlen tmp und 1,
% so löschen sich die korrekten höherwertigen gleichen Stellen aus.
% Sofern keine korrekten Ziffern mehr übrig bleiben besteht das Ergebnis rein aus
% Rundungsfehlern und ist zur weiteren Berechnung unbrauchbar.
% Rechnet man mit Zahlen kleiner als 10^-16 werden diese auf 0 gerundet.
