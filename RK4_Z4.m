function [Z4] = RK4_Z4(x,Z4,gamma,adjacency,h)
%UNTITLED17 Summary of this function goes here
%   Detailed explanation goes here
    %k_1 = h*robot_position(v);
    k_1 = h*Z4_consensus(x,Z4,gamma,adjacency)
    k_2 = h*Z4_consensus(x,Z4+(1/2)*k_1,gamma,adjacency);
    k_3 = h*Z4_consensus(x,Z4+(1/2)*k_2,gamma,adjacency);
    k_4 = h*Z4_consensus(x,Z4+k_3*1,gamma,adjacency);
    Z4 = Z4+1/6*(k_1+2*k_2+2*k_3+k_4);
end