
%% draw sphere
[th,phi] = meshgrid(linspace(0, 2*pi, 50), linspace(-pi/2, pi/2, 50));

a = 16;
b = 40;
c = 2;

x = a + 5 .* cos(phi) .* sin(th);
y = b + 5 .* sin(phi) .* sin(th);
z = c + 5 .* cos(th);
surf(x,y,z)

hold on

x = a + 5 .* cos(-pi/2) .* sin(0);
y = b + 5 .* sin(-pi/2) .* sin(0);
z = c + 5 .* cos(0);

plot3(x,y,z,'o')

%% draw sphere with 

[phi,th] = meshgrid(linspace(0, 2*pi, 50), linspace(-pi/2, pi/2, 50));

a = 16;
b = 40;
c = 2;
r = 5;

x = a + r .* cos(phi) .* cos(th);
y = b + r .* sin(phi) .* cos(th);
z = c + r .* sin(th);
surf(x,y,z)

hold on

xt = a + r .* cos(0) .* cos(-pi/2);
yt = b + r .* sin(0) .* cos(-pi/2);
zt = c + r .* sin(-pi/2);

plot3(xt,yt,zt,'o')

[phic,thc] = meshgrid(linspace(pi, pi, 50), linspace(pi, pi, 50));

%dxtth = -r .* sin(th);
%dytth = zeros(50,50);                                                                             
%dztth = r .* cos(th);
dxtth = -r .* cos(phic).*sin(th);
dytth = -r .* sin(phic).*sin(th);                                                                             
dztth = r .* cos(th);

plot3(dxtth,dytth,dztth,'o');

%dxtphi = -r .* sin(phi);
%dytphi = r .* cos(phi);                    
%dztphi = zeros(50,50);

dxtphi = -r .* sin(phi).*cos(thc);
dytphi = r .* cos(phi).*cos(thc);                    
dztphi = zeros(50,50);

plot3(dxtphi,dytphi,dztphi,'o');


hold on

T=[0;1;0]; 
N=[1;0;0];


%Parametric expressions for plane spanned by T and N
funx=@(s,t) xt + T(1)*s +N(1)*t;
funy=@(s,t) yt + T(2)*s +N(2)*t;
funz=@(s,t) zt + T(3)*s +N(3)*t;

ezsurf(funx,funy,funz) %plot


% cross product...







