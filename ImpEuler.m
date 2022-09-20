function [xOut] = ImpEuler(rhs, drhs, time,dT, y0)


p = length(time);
n = length(y0);

g = @(time, xsym) rhs(time, xsym);
gp = @(time, xsym2) drhs(time, xsym2);

state = y0;
stateRecord = zeros(n,p);
stateRecord(:,1) = y0;


for i = 1:p-1                                                            
    state = stateRecord(:,i);
    
  
   
    
    stateRecord(:,i+1) = (((-gp(time(i),state) * dT * state) + (dT * g(time(i),state))) + state) / (1-( gp(time(i),state) * dT));
   % stateRecord(:,i+1) = state / (1 - (gp(state)* dT));
end

xOut = stateRecord;
end