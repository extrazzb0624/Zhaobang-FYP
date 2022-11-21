function [outputArg1] = MI_by_cov(var1, var2, cov)
% return I(X; Y) by (X, Y) ~ N(0, sigma) is given.
corr_square = cov.^2 / (var1*var2);
outputArg1 =  - 0.5*log(1-corr_square);
end

