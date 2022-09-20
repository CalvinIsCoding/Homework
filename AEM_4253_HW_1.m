%% main script

ts = 0.5;

%% Explicit Euler
% ODE

rhs = @(t,y) -2*y;


% Boundary Condition. When t = 0?

y0 = 4;


% time step


time = 0:ts:15;
y = ExpEuler(rhs,time,ts,y0);

plot(time,y,'r')
hold on;

%% Implicit Euler

% ODE
rhs = @(t,y) -2*y;

% Derivative


drhs = @(t,y) -2;
% Boundary Condition. When t = 0?

y0 = 4;


% time step


time = 0:ts:15;
y = ImpEuler(rhs, drhs, time,ts,y0);

plot(time,y,'b')

%% Second Order Runge-Kutta

% ODE
rhs = @(t,y) -2*y;

% Boundary Condition. When t = 0?

y0 = 4;


% time step


time = 0:ts:15;
y = RK2(rhs, time,ts,y0);

plot(time,y,'y')

%% Fourth Order Runge-Kutta

% ODE
rhs = @(t,y) -2*y;

% Boundary Condition. When t = 0
y0 = 4;


% time step

time = 0:ts:15;

% solving
y = RK4(rhs, time,ts,y0);

% plotting
plot(time,y,'g')