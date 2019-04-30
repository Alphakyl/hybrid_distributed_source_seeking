function [z4_dot] = z4_consensus(x, z4, gamma, adjacency)
%UNTITLED11 Summary of this function goes here
%   Detailed explanation goes here
k = size(x,1);
n = size(x,2);
z4_dot = zeros(1,n);

for ii = 1:n
    for jj=1:n
        if(adjacency(ii,jj))
            z4_dot(ii) = z4_dot(ii)+adjacency(ii,jj)*(z4(jj)-z4(ii));
        end
    end
    p = scalar_field_fnc(x(:,ii));
    z4_dot(:,ii) = z4_dot(:,ii)+gamma*(p-z4(:,ii));
end
end

