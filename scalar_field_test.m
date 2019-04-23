%% Cleanup
close all
clear all
clc

%% Generate 2D Room Space
% Map a 10x10 room for the agents to navigate in
x_min = -5;
x_max = 5;
y_min = -5;
y_max = 5;
step_size = 0.1;

[x,y] = meshgrid(x_min:step_size:x_max,y_min:step_size:y_max);

z = 50-x.^2-y.^2

contour(x,y,z)
%view(3)
xlabel('x')
ylabel('y')
