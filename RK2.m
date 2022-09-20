function [xOut] = RK2(rhs,time,dT, y0)


p = length(time);
n = length(y0);

f = @(time, xsym) rhs(time, xsym);

state = y0;
stateRecord = zeros(n,p);
stateRecord(:,1) = y0;


for i = 1:p-1
    state = stateRecord(:,i);
    
    K0 = f(time(i),state); % current slope
    K1 = f(time(i) + dT/2, state + dT/2 * K0);
   
    
   
    
    stateRecord(:,i + 1) = state + (dT * K1);
end

xOut = stateRecord;
    