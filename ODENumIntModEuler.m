function [xOut] = ODENumIntModEuler(rhs, time, x0)

%% Help Header



%% Function

dT = 0.01;
p = length(time);
n = length(x0);

f = @(xsym) rhs(time, xsym);

state = x0;
stateRecord = zeros(n,p);
stateRecord(:,1) = x0;


for i = 1:p-1
    state = stateRecord(:,i);
    
    K1 = f(state);
    K2 = f(state + dT .* K1);
    
    stateRecord(:,i+1) = state + dT .* (K1 + K2) ./ 2;
end

xOut = stateRecord;
end