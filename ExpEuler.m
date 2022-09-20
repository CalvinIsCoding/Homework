 function [xOut] = ExpEuler(rhs,time,dT, y0)


p = length(time);
n = length(y0);

f = @(time,xsym) rhs(time, xsym);

state = y0;
stateRecord = zeros(n,p);
stateRecord(:,1) = y0;


for i = 1:p-1                                                            
    state = stateRecord(:,i);
    
    K1 = f(time(i),state);
   
    
    stateRecord(:,i+1) = state + dT * K1;
end

xOut = stateRecord;
end