%==========================================================================
clear  % Clears command history
clc   % Clears command window
clf  % Clears figure window
close force all

%========= Sets initial parameters for pendulum ===========================
l = 4;  % pendulum length
initialangle1 = pi/2;  % Initial angle 1
initialangle2 = 0;   % Initial angle 2

%====== Sets x and y coordinates of pendulum top  =========================
pendulumtopx = 0;
pendulumtopy = l;

iterations = 1; % Sets initial iteration count to 1
pausetime = 0.1;  % Pauses animation for this time
runtime = 50;  % Runs simulations for this time
tx = 0;  % Ensures time series plot remains in the figure window

%============== Solves pendulum differential equations =============
deq1=@(t,x) [x(2); l * sin(x(1))]; % Pendulum equations uncoupled
[t,sol] = ode45(deq1,[0:0.01:runtime],[initialangle1 initialangle2]);  % ode solver
sol1 = sol(:,1)'; % takes the transpose for plots
sol2 = sol(:,2)';

arraysize = size(t);  % Defines array size of time intervals
timestep = t(runtime) - t(runtime-1);  % Calculates the time step of these intervals
cartesianx = l*sin(sol1);  % Converts angles into cartesian coordinates
cartesiany = l*cos(sol2);  

initialangle1 = pi/2;  % Initial angle 1
initialangle2 = 0;   % Initial angle 2

deq2=@(t,x) [x(2); l * (x(1))]; % Pendulum equations uncoupled
[t2,sollin] = ode45(deq2,[0:0.01:runtime],[initialangle1 initialangle2]);  % ode solver
sol11 = sollin(:,1)'; % takes the transpose for plots
sol22 = sollin(:,2)';

cartesianx2 = l*sin(sol11);  % Converts angles into cartesian coordinates
cartesiany2 = l*cos(sol22);  
    
%============== plots results at each time interval =======================
for i = 1 : max(arraysize)
    subplot(2,1,1)
    plotarrayx = [pendulumtopx cartesianx(iterations)];
    plotarrayy = [pendulumtopy cartesiany(iterations)];
    plot(cartesianx(iterations),cartesiany(iterations),'ko',plotarrayx,plotarrayy,'r-')
   
    xlabel('x [m]','fontsize',12)
    ylabel('y [m]','fontsize',12)
    axis([min(cartesianx) max(cartesianx) min(cartesiany) max(cartesiany)])
    hold on
    plotarrayx = [pendulumtopx cartesianx2(iterations)];
    plotarrayy = [pendulumtopy cartesiany2(iterations)];
    plot(cartesianx2(iterations),cartesiany2(iterations),'ko',plotarrayx,plotarrayy,'b--')
    
    xlabel('x [m]','fontsize',12)
    ylabel('y [m]','fontsize',12)
    axis([min(cartesianx2) max(cartesianx2) min(cartesiany2) max(cartesiany2)])
    hold off
    
    subplot(2,1,2)
    
    plot(t(iterations),sol1(iterations),'bo')
    title(['Bsp5 \theta1 t = ' num2str(t(iterations))],'fontsize',12)
    xlabel('t [seconds]','fontsize',12)
    ylabel('\theta1','fontsize',12)
    hold on  % Holds previous values
    axis([0 t(iterations)+(t(2)-t(1)) min(sol1) max(sol1)])
    tx = tx + timestep;  % Aligns results with the figure window
    pause(pausetime)  % Shows results at each time interval
    iterations = iterations + 1;  % increases iteration count by 1
end
%=========================== End of program ===============================

