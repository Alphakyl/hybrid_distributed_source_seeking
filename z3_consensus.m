function [z3_dot] = z3_consensus(x, z3, gamma, adjacency)
%UNTITLED9 Summary of this function goes here
%   Detailed explanation goes here
k = size(x,1);
n = size(x,2);
z3_dot = zeros(k,n);

for ii = 1:n
    for jj=1:n
        if(adjacency(ii,jj))
            z3_dot(:,ii) = z3_dot(:,ii)+adjacency(ii,jj)*(z3(:,jj)-z3(:,ii));
        end
    end
    p = scalar_field_fnc(x(:,ii));
    z3_dot(:,ii) = z3_dot(:,ii)+gamma*(x(:,ii)*p-z3(:,ii));
end
end