function [Z3] = RK4_Z3(x,Z3,gamma,adjacency)
%UNTITLED17 Summary of this function goes here
%   Detailed explanation goes here
    %k_1 = h*robot_position(v);
    k_1 = h*Z3_consensus(x,Z3,gamma,adjacency)
    k_2 = h*Z3_consensus(x,Z3+(1/2)*k_1,gamma,adjacency);
    k_3 = h*Z3_consensus(x,Z3+(1/2)*k_2,gamma,adjacency);
    k_4 = h*Z3_consensus(x,Z3+k_3*1,gamma,adjacency);
    Z3 = Z3+1/6*(k_1+2*k_2+2*k_3+k_4);
end