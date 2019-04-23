function [g_c] = center_gradient_estimate(x, time)
%center_gradient_estimate Estimate the gradient at the center of a robot
%formation
%   Detailed explanation goes here
    k = size(x,2);
    n = size(x,1);
    for ii = 1:n
        y(ii,1) = scalar_field_fnc(x(ii,:,time));
    end
    theta(:,:,time) = pinv([x(:,:,time),ones(n,1)])*y;
    g_c = [eye(k),zeros(k,1)]*theta(:,:,time);
end

