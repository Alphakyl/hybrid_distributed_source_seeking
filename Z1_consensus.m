function [Z1_dot] = Z1_consensus(x, Z1, gamma, adjacency)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
k = size(x,1);
n = size(x,2);
Z1_dot = zeros(k,k,n);
for ii = 1:n
    for jj=1:n
        if(adjacency(ii,jj))
            Z1_dot(:,:,ii) = Z1_dot(:,:,ii)+adjacency(ii,jj)*(Z1(:,:,jj)-Z1(:,:,ii));
        end
    end
    Z1_dot(:,:,ii) = Z1_dot(:,:,ii)+gamma(x(:,ii)*x(:,ii)'-Z1(:,:,ii));
end
end

