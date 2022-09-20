function [xOut] = ODENumIntRK4(rhs, time, x0)

dT = 0.01;
p = length(time);
n = length(x0);

f = @(xsym) rhs(time, xsym);

state = x0;
stateRecord = zeros(n,p);
stateRecord(:,1) = x0;


for i = 1:p-1
    state = stateRecord(:,i);
    
    K1 = f(state); % current slope
    K2 = f(state + dT/2 * K1);
    K3 = f(state + K2 * dT/2);
    K4 = f(state + K3 * dT);
    
    slopeWeightedAverage = (1/6 * K1) + (1/3 * K2) + (1/3 * K3) + (1/6 * K4);
    
    stateRecord(:,i + 1) = state + dT * slopeWeightedAverage;
end

xOut = stateRecord;
    