
clearvars;

% Quadrant 1, 45°:
[~, phi] = karth2polar(1,1);
disp(radtodeg( phi ));

% Quadrant 2, 135°:
[~, phi] = karth2polar(-1,1);
disp(radtodeg( phi ));

% Quadrant 3, -135°:
[~, phi] = karth2polar(-1,-1);
disp(radtodeg( phi ));

% Quadrant 4, -45°:
[~, phi] = karth2polar(1,-1);
disp(radtodeg( phi ));


% right, 0°:
[~, phi] = karth2polar(1,0);
disp(radtodeg( phi ));

% up, 90°:
[~, phi] = karth2polar(0,1);
disp(radtodeg( phi ));

% left, 180°:
[~, phi] = karth2polar(-1,0);
disp(radtodeg( phi ));

% down, -90°:
[~, phi] = karth2polar(0,-1);
disp(radtodeg( phi ));

% error (every angle possible):
[~, phi] = karth2polar(0,0);
disp(radtodeg( phi ));
