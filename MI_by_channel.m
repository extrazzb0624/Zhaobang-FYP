function [result] = MI_by_channel(U_var, V_var, cov, channel_setting)
% return I(U; Y)
UV_cov = cov;
Z_var = channel_setting(2);
scalar = channel_setting(1);
% for H(Y)
result = entropByVar((scalar.^ 2) * (U_var + V_var + 2 * UV_cov) + Z_var);
V_depe_U_var = V_var - (UV_cov.^ 2) / U_var;

% for H(Y|U)
result = result - entropByVar((scalar.^ 2) * V_depe_U_var + Z_var);
end

