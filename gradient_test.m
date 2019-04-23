%% Cleanup
close all
clear all
clc
%% Generate and arbitrary path
steps = 100;
type = 1;
path = path_generation(type, steps);
x_1 = path(:,1:2)';
x_2 = path(:,1:2)'+ones(size(path(:,1:2)))';
x_3 = path(:,1:2)'+2*ones(size(path(:,1:2)))';
for time = 1:steps
    x_1_temp = x_1(:,time);
    x_2_temp = x_2(:,time);
    x_3_temp = x_3(:,time);
    X(:,:,time) = [x_1_temp'; x_2_temp';x_3_temp'];
end
%% Calculate Gradient
for time = 1:steps
   gc(:,time) = center_gradient_estimate(X,time);
end

