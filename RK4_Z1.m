function [Z1] = RK4_Z1(x,Z1,gamma,adjacency)
%UNTITLED17 Summary of this function goes here
%   Detailed explanation goes here
    %k_1 = h*robot_position(v);
    k_1 = h*Z1_consensus(x,Z1,gamma,adjacency)
    k_2 = h*Z1_consensus(x,Z1+(1/2)*k_1,gamma,adjacency);
    k_3 = h*Z1_consensus(x,Z1+(1/2)*k_2,gamma,adjacency);
    k_4 = h*Z1_consensus(x,Z1+k_3*1,gamma,adjacency);
    Z1 = Z1+1/6*(k_1+2*k_2+2*k_3+k_4);
end

