function [z5_dot] = z5_consensus(v, z5, gamma, adjacency)
%UNTITLED13 Summary of this function goes here
%   Detailed explanation goes here
k = size(x,1);
n = size(x,2);
z5_dot = zeros(k,n);

for ii = 1:n
    for jj=1:n
        if(adjacency(ii,jj))
            z5_dot(:,ii) = z5_dot(:,ii)+adjacency(ii,jj)*(z5(:,jj)-z5(:,ii));
        end
    end
    z5_dot(:,ii) = z5_dot(:,ii)+gamma*(v(:,ii)-z5(:,ii));
end
end

