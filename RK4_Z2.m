function [Z2] = RK4_Z2(x,Z2,gamma,adjacency,h)
%UNTITLED17 Summary of this function goes here
%   Detailed explanation goes here
    %k_1 = h*robot_position(v);
    k_1 = h*z2_consensus(x,Z2,gamma,adjacency);
    k_2 = h*z2_consensus(x,Z2+(1/2)*k_1,gamma,adjacency);
    k_3 = h*z2_consensus(x,Z2+(1/2)*k_2,gamma,adjacency);
    k_4 = h*z2_consensus(x,Z2+k_3*1,gamma,adjacency);
    Z2 = Z2+1/6*(k_1+2*k_2+2*k_3+k_4);
end