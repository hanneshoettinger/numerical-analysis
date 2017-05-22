a = 1;
b = 1;

M=[0,0,0];
u=[1,2,5];
v=[2,-1,0];

t=0:pi/50:2*pi;
xt = ellipse3d(t, a, b, M(1), u(1), v(1));
yt = ellipse3d(t, a, b, M(2), u(2), v(2));
zt = ellipse3d(t, a, b, M(3), u(3), v(3));

figure
rotate3d on;
plot3(xt, yt, zt);

hold on
grid on

quiver3(0,0,0,u(1),u(2),u(3));
quiver3(0,0,0,v(1),v(2),v(3));

hold off

