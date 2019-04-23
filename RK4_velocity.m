function [y] = RK4_velocity(y,u,h)
%RK4 Summary of this function goes here
%   Detailed explanation goes here
    k_1 = h*robot_velocity(u);
    k_2 = h*robot_velocity(u+(1/2)*k_1);
    k_3 = h*robot_velocity(u+(1/2)*k_2);
    k_4 = h*robot_velocity(u+k_3*1);
    y = y+1/6*(k_1+2*k_2+2*k_3+k_4);
end

