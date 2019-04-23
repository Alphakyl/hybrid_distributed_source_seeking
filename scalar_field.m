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

%% Generate random scalar fields for temperature and gas concentration

z = 100-sqrt(x.^2-y.^2)
% rng(100)
% range = 10;
% c = -range+(range-(-range))*rand(16,1);
% a = -rand(4,1);
% z_temperature = a(1)*x.^4+c(1)*x.^3+c(2)*x.^2+c(3)*x+c(4);
% z_temperature = exp(z_temperature);
%                %%+a(2)*y.^4+c(5)*y.^3+c(6)*y.^2+c(7)*y+c(8);
% %z_temperature = sin(x^2+y^2);
% z_gas = a(3)*y.^4+c(9)*y.^3+c(10)*y.^2+c(11)*y+c(12);
% z_gas = exp(z_gas);
       %+a(4)*y.^4+c(13)*y.^3+c(14)*y.^2+c(15)*y+c(16);
%z_gas = cos(y);

%% Plot scalar fields
% figure
% surface(x,y,z_temperature)
% view(3)
% xlabel('x')
% ylabel('y')
% zlabel('Temperature')
% 
% figure
% surface(x,y,z_gas)
% view(3)
% xlabel('x')
% ylabel('z')
% zlabel('Gas Concentration')
% 
% figure
% z = z_temperature+z_gas;
surface(x,y,z)
view(3)
xlabel('x')
ylabel('z')
zlabel('Fire Origin')
[z_max,subindex] = max(z);
[val, index] = max(z_max);
%scatter3(x,y,z_gas)