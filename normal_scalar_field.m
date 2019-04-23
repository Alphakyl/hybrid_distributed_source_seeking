%% Cleanup
close all
clear all
clc

%% Generate 2D Room Space
% Map a 10x10 room for the agents to navigate in
x_min = 0;
x_max = 10;
y_min = -5;
y_max = 5;
step_size = 0.1;

[x,y] = meshgrid(x_min:step_size:x_max,y_min:step_size:y_max);

%% Standard Deviation and Average
sigma_x = 3;
sigma_y = 4;

mu_x = 7;
mu_y = 0;
mu = [mu_x; mu_y];

Sigma = [sigma_x^2 0; 0 sigma_y^2];
z = 1/(sqrt(2*pi)^2*det(Sigma))*exp(-(x-mu_x).^2/sigma_x^2-(y-mu_y).^2/sigma_y^2);
surface(x,y,(log(z)))
view(3)

%z = 1/(2*pi*sigma_x*sigma_y)*exp(-1/2*(x-