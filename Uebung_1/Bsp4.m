%%
%     close all;
%     clc;
%     
    initpos=5;    
    initvel=0;     
    r_ball=0.25;      
    gravity=9.81;     
    coeff=0.90;    
    dt=0.0125;      %timestep

    line([-5*r_ball,5*r_ball],...
         [0,0]);

    pos=initpos-r_ball;          
    vel=initvel;                

    axis([-5*r_ball,5*r_ball,0,initpos+2*r_ball]);
        axis('equal');
        axis('off');
    while 1
        t_loopstart=tic();
        pos=pos+(vel*dt) - 1/2 * gravity * (dt^2);           
        vel=vel-(gravity*dt);      
        if pos<0
            vel=-vel*coeff;      %current vertical velocity
            disp('now at loc 0');
        end

        ball=rectangle('Position',[-r_ball,pos,r_ball,r_ball],...
                  'Curvature',[1,1],...
                  'FaceColor','b');
              
        %Pause
        el_time=toc(t_loopstart);

        pause(dt-el_time);

        delete(ball)
    end
%%

v = 30;
alpha = pi/4;
g=9.81;  

x = 0:0.001:2000;

z = -(1/2)*g.*(x./(v*cos(alpha))).^2 + v*sin(alpha).*(x./(v*cos(alpha)));

plot(x,z)
ylim([0,max(z)]);
t = 0:0.1:5;

x_t = v*cos(alpha).*t;
z_t = v*sin(alpha).*t - (1/2)*g.*t.^2;

PlotAxisAtOrigin(t,z_t)

%figure;
%plot3(t,x_t,z_t)
%% 
% animated plot
v = 30;
alpha = pi/4;
g=9.81;  
% Reibungsverlust
coeff = 0.80;

figure;
h = animatedline;
%axis([0,1000,0,25])

x = 0:0.5:1000;
vy = v*sin(alpha);
vx = v*cos(alpha);
tt = 0;
for k = 1:length(x)
    y = -(1/2)*g.*((x(k)-tt)/(vx)).^2 + vy.*((x(k)-tt)/(vx));
    if (y < 0)
        % save x(k) to set back x coordinate
        tt = x(k);
        % slow down
        vy = vy*coeff;
    end
    % add current location point to the plot
    addpoints(h,x(k),y);
    drawnow
end







%%