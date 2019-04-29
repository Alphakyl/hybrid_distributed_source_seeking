function [g_c] = center_gradient_estimate(x, time)
%center_gradient_estimate Estimate the gradient at the center of a robot
%formation
%   Detailed explanation goes here
    k = size(x,2);
    n = size(x,1)/2;
    for ii = 1:n
        x_temp = x(2*ii-1,time);
        y_temp = x(2*ii,time)
        y(ii,1) = scalar_field_fnc(x_temp,y_temp);
    end
    theta(:,:,time) = pinv([x(:,time),ones(2*n,1)])*[y;y];
    g_c = [eye(k),zeros(k,1)]*theta(:,:,time);
end

