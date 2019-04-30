function [gce] = distributed_center_gradient_estimate(Z1, z2, z3, z4)
%UNTITLED15 Summary of this function goes here
%   Detailed explanation goes here
n = size(Z1,3);
k = size(Z1,1);
for ii = 1:n
    Theta = inv([Z1(:,:,ii), z2(:,ii); z2(:,ii)', 1])*[z3;z4];
    gce(:,ii) = [eye(k) zeros(k,1)]*Theta
end
end

