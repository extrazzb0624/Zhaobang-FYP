function [U_var, V_var, cov] = rnd_UV_dis()
%RND_UV_DIS 此处显示有关此函数的摘要
%   此处显示详细说明
cor = 2*(rand-0.5);
U_var = abs(normrnd(1, 1));
V_var = abs(normrnd(1, 1));
cov = cor*sqrt(U_var*V_var);
end

