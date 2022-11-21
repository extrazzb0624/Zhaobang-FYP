function [outputArg1,outputArg2] = gene_rnd_channel()

%output = [channel multiplyer, channel noise variance]
%   此处显示详细说明
outputArg1 = randi(10);
outputArg2 = abs(normrnd(1,1));
end

