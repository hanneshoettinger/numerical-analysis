%% Bsp7 ersten 4 Fälle
e1 = [1 0];
e2 = [0 1];

% x = [0 1];
% y = [0 0];
% plot(x,y)
% hold on
% x = [0 0];
% y = [0 1];
% plot(x,y)

figure
rectangle('Position',[0 0 1 1],'EdgeColor','r')
axis([0 3 0 3])

c = 7; d = 3;

A = [1 0; ...
     0 d];
 
hold on
rectangle('Position',[0 0 1 d],'EdgeColor','b')
axis([0 3 0 3])
 
det(A)


A = [c 0; ...
     0 1];
 
hold on
rectangle('Position',[0 0 c 1],'EdgeColor','g')
axis([0 7 0 7])
 
det(A)

A = [c 0; ...
     0 d];
 
hold on
rectangle('Position',[0 0 c d],'EdgeColor','m')
axis([0 7 0 7])
 
det(A)

A = [0 1; ...
     1 0];
 
det(A)

%% Rotation

A = [1/sqrt(2) -1/sqrt(2); ...
     1/sqrt(2) 1/sqrt(2)];
 
det(A)

A = [1/sqrt(2) 1/sqrt(2); ...
     -1/sqrt(2) 1/sqrt(2)];
 
det(A)

x = [0 1/sqrt(2)];
y = [0 1/sqrt(2)];
plot(x,y)
hold on
x = [0 -1/sqrt(2)];
y = [0 1/sqrt(2)];
plot(x,y)

figure
x = [0 1/sqrt(2)];
y = [0 -1/sqrt(2)];
plot(x,y)
hold on
x = [0 1/sqrt(2)];
y = [0 1/sqrt(2)];
plot(x,y)

%% Spiegelung an beliebiger Geraden
alpha = atan(pi);

A = [cos(2*alpha) sin(2*alpha); ...
     sin(2*alpha) -cos(2*alpha)];
 
det(A)

x = [0 -0.82];
y = [0 0.58];
plot(x,y)
hold on
x = [0 0.58];
y = [0 0.82];
plot(x,y)

x = [0 1];
y = [0 0];
plot(x,y)
hold on
x = [0 0];
y = [0 1];
plot(x,y)

xx = 0:0.1:1;
yy = pi.*xx;

plot(xx,yy)

%% paralle Projektion

x = [0 1];
y = [0 0];
plot(x,y)
hold on
x = [0 0];
y = [0 1];
plot(x,y)

x = [0 1];
y = [0 2];
plot(x,y)
xlim([0 3])
ylim([0 3])

x = [1 1/3];
y = [0 2/3];
plot(x,y)

x = [0 1/3];
y = [1 2/3];
plot(x,y)
























 
