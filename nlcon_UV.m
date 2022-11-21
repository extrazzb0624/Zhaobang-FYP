function [c, ceq] = nlcon_UV(x)
%NLCON_UV 此处显示有关此函数的摘要
%   此处显示详细说明
c = x(3)*x(3)/(x(1)*x(2))-1;
ceq = [];
end

