function [counter,optimal_K]= opmization(K0, sigma1, sigma2, lamda)

optimal_K = K0;
counter = 0;
wanted_accurance = 0.000000001;
accurance = 1;
while accurance > wanted_accurance
    counter =+1;
    new_direct = solve_sdp(optimal_K,sigma1,sigma2,lamda);
    fprintf("new de = %f\n",new_direct);
    new_step_size = line_search(new_direct, optimal_K, sigma1, sigma2, lamda);
    tmp_K = optimal_K;
    optimal_K = optimal_K + new_direct*new_step_size;
    accurance = f(optimal_K, sigma1, sigma2, lamda)-f(tmp_K, sigma1, sigma2, lamda);

end
end

function dire = solve_sdp(K, sigma1, sigma2, lamda)
used_K = -inv(K+sigma1)+lamda*inv(K+sigma2);
cvx_begin sdp
    variable X(2,2) semidefinite 
    minimize( trace(used_K*X) )
    
cvx_end
dire = X;
end

function step_size = line_search(dire, K, sigma1, sigma2, lamda)
step_size = 100000    

end

function f_value = f(K,sigma1, sigma2, lamda)
f_value = log(det(K+sigma1))-lamda*log(det(K+sigma2));
end