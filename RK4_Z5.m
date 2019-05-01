function [Z5] = RK4_Z5(v,Z5,gamma,adjacency,h)
%UNTITLED17 Summary of this function goes here
%   Detailed explanation goes here
    %k_1 = h*robot_position(v);
    k_1 = h*Z5_consensus(v,Z5,gamma,adjacency)
    k_2 = h*Z5_consensus(v,Z5+(1/2)*k_1,gamma,adjacency);
    k_3 = h*Z5_consensus(v,Z5+(1/2)*k_2,gamma,adjacency);
    k_4 = h*Z5_consensus(v,Z5+k_3*1,gamma,adjacency);
    Z5 = Z5+1/6*(k_1+2*k_2+2*k_3+k_4);
end