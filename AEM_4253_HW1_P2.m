%% ODE

rhs = @(t,y) -(2 + 0.01 * t^2) * y;
time = 0:ts:15;

%% Exact Solution

exactTime = 0:0.01:15;
 y = 4 * exp(-2 .* exactTime) .* exp((-exactTime.^3) ./ 300);
plot(exactTime, y,'c')
hold on;

%% Explicit Euler 

% for explicit euler to be stable, mag(1+c*dT)less than or equal to 1
% for problem 2, c is simply -(2 + 0.01*t^2) yes? since c =-2 at t=0 and
% c = -4.25 when t = 15, and since c is purely real in this case
% dT <= 2/4.25

% maximum stable timestep
ts = 0.1;
y = ExpEuler(rhs,time,ts,y0);
plot(time,y,'r')

ts = 0.5;
y = ExpEuler(rhs,time,ts,y0);
plot(time,y,'b')


ts = 1;
y = ExpEuler(rhs,time,ts,y0);
plot(time,y,'g')
%% Implicit Euler

%maximum stable timestep

ts = 0.1;
y = ImpEuler(rhs,time,ts,y0);
plot(time,y,'r')

ts = 0.5;
y = ImpEuler(rhs,time,ts,y0);
plot(time,y,'b')


ts = 1;
y = ImpEuler(rhs,time,ts,y0);
plot(time,y,'g')

%% RK2


%maximum stable timestep

ts = 0.1;
y = RK2(rhs,time,ts,y0);
plot(time,y,'r')

ts = 0.5;
y = RK2(rhs,time,ts,y0);
plot(time,y,'b')


ts = 1;
y = RK2(rhs,time,ts,y0);
plot(time,y,'g')
%% RK4

%maximum stable timestep

ts = 0.1;
y = RK4(rhs,time,ts,y0);
plot(time,y,'r')

ts = 0.5;
y = RK4(rhs,time,ts,y0);
plot(time,y,'b')


ts = 1;
y = RK4(rhs,time,ts,y0);
plot(time,y,'g')                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               