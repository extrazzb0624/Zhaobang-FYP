function [sum] = sum_rate_UV(U_var, V_var, cov, channels, states)
% R1 + R2 
% channel expects: [[k11, sigma11],...,[k22, sigma22]]
sum = 0;

for i = 1:2
    sum = sum + states(1)*(MI_by_channel(U_var, V_var, cov, channels(2*i-1,:))+ ...
        MI_by_channel(V_var, U_var, cov, channels(2*i,:)));
end
sum = sum - MI_by_cov(U_var, V_var, cov);
end

