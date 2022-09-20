%% main script

ts = 0.5;
time = 0:ts:15;
y0 = 4;
%% Exact Solution

exactTime = 0:0.01:15;
y = y0*exp(-2*exactTime);

plot(exactTime,y,'c')
hold on;
%% Explicit Euler
% ODE

rhs = @(t,y) -2*y;

y = ExpEuler(rhs,time,ts,y0);

plot(time,y,'r')
hold on;

%% Implicit Euler

% ODE
rhs = @(t,y) -2*y;

% Derivative


drhs = @(t,y) -2;



% time step


y = ImpEuler(rhs, drhs, time,ts,y0);

plot(time,y,'b')

%% Second Order Runge-Kutta
plot=figure()
% ODE
rhs = @(t,y) -2*y;


% time step
y = RK2(rhs, time,ts,y0);

plot(time,y,'k')

print(plot,'-depsc')
%% Fourth Order Runge-Kutta

% ODE
rhs = @(t,y) -2*y;



% solving
y = RK4(rhs, time,ts,y0);

% plotting
plot(time,y,'g')