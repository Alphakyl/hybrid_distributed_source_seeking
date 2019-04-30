function [z2_dot] = z2_consensus(x, z2, gamma, adjacency)
%UNTITLED8 Summary of this function goes here
%   Detailed explanation goes here
k = size(x,1);
n = size(x,2);
z2_dot = zeros(k,n);

for ii = 1:n
    for jj=1:n
        if(adjacency(ii,jj))
            z2_dot(:,ii) = z2_dot(:,ii)+adjacency(ii,jj)*(z2(:,jj)-z2(:,ii));
        end
    end
    z2_dot(:,ii) = z2_dot(:,ii)+gamma*(x(:,ii)-z2(:,ii));
end
end

