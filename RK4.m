function [xOut] = RK4(rhs,time,dT, y0)


p = length(time);
n = length(y0);

f = @(time,xsym) rhs(time, xsym);

state = y0;
stateRecord = zeros(n,p);
stateRecord(:,1) = y0;


for i = 1:p-1
    state = stateRecord(:,i);
    
    K0 = f(time(i), state);
    K1 = f(time(i) + dT/2, state + dT/2 * K0);
    K2 = f(time(i) + dT/2, state + dT/2 * K1);
    K3 = f(time(i) + dT, state + dT/2 * K2);
   
    
   
    
    stateRecord(:,i + 1) = state + (1/6)*dT*(K0 + (2*K1) + (2*K2) + K3);
end

xOut = stateRecord;
    