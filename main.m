States_Size = 2;
p = rand;
States = [p, 1-p];
Channels = [];
for i = 1:States_Size
    [channel1 channel2] = gene_rnd_channel;
    [channel3 channel4] = gene_rnd_channel;

    Channels = [Channels; [channel1 channel2]; [channel3 channel4]];
end
[U_var, V_var, cov] = rnd_UV_dis();
result = sum_rate_UV(U_var, V_var, cov, Channels, States);

K0 = [1 1 0];
A = [1,1,2];
b = 100*rand;
Aeq = [];
beq = [];
ub = [];
lb = [0, 0, -inf];
obj = @(K) -sum_rate_UV(K(1), K(2), K(3), Channels, States);
nonlcon = @(K) nlcon_UV(K);
tmp = nonlcon(K0);
K_final = fmincon(obj, K0, A, b, Aeq, beq,lb, ub, nonlcon);
optimal = sum_rate_UV(K_final(1), K_final(2), K_final(3), Channels, States);
disp(optimal);
result2 = 0;
for i = 1:1000000
    [U_var, V_var, cov] = rnd_UV_dis();
    result3 = sum_rate_UV(U_var, V_var, cov, Channels, States);
    if result3 > optimal
        disp(result3);
    end
    if result3>result2
        result2 = result3;
    end
end
disp(result3);

