%% Cleanup
close all
clear all
clc

%% Create initial conditions
% Generate an all to all graph for a 3 robot system represented by the
% graphs laplacian L_0
L_0 = [1 -1 0;
    -1 2 -1;
    0 -1 1];
% Use constants and scaling from Shang Li
L_1 = 6*L_0;
L_2 = L_0;
c_0 = 20;
c_1 = 7;
c_2 = 7;
% Set desired formation to be an equilateral triangle
x_d = 0.3*[0 0;
    0 1;
    1 0];
% Establish initial conditions for x:
% e.g. robots starting in a vertical line at edge of map
x(:,1) = [-4; -5];
x(:,2) = [-4; -4];
x(:,3) = [-4; -3];
% Establish initial conditions for v:
% e.g. robots not moving
v = zeros(size(x));
for ii = 1:size(x,2)
    p(ii,:) = scalar_field_fnc(x(:,ii));
end


g_c(:,1) = center_gradient_estimate(X,1);
u(:,:,1) = distributed_control(X(:,:,1),x_d,c_0,g_c(:,1),V(:,:,1),c_1,c_2,L_1,L_2);
%% Step through simulation
h = 0.01;
t = 0:h:10;
%for ii=2:length(t)
ii = 2;
while(norm(g_c(:,ii-1))>0.05)
   V(:,:,ii) = RK4_velocity(V(:,:,ii-1),u(:,:,ii-1),h);
   X(:,:,ii) = RK4_position(X(:,:,ii-1),V(:,:,ii-1),h);
   g_c(:,ii) = center_gradient_estimate(X,ii);
   u(:,:,ii) = distributed_control(X(:,:,ii),x_d,c_0,g_c(:,ii),V(:,:,ii),c_1,c_2,L_1,L_2);
   ii = ii+1;
end
%end

hold on
plot(squeeze(X(1,1,:)),squeeze(X(1,2,:)))
plot(squeeze(X(2,1,:)),squeeze(X(2,2,:)))
plot(squeeze(X(3,1,:)),squeeze(X(3,2,:)))
plot(squeeze(X(4,1,:)),squeeze(X(4,2,:)))
plot(1/4*(squeeze(X(1,1,:))+squeeze(X(2,1,:))+squeeze(X(3,1,:))+squeeze(X(4,1,:))),...
    1/4*(squeeze(X(1,2,:))+squeeze(X(2,2,:))+squeeze(X(3,2,:))+squeeze(X(4,2,:))),'.')

% Map a 10x10 room for the agents to navigate in
x_min = -5;
x_max = 5;
y_min = -5;
y_max = 5;
step_size = 0.01;

[x,y] = meshgrid(x_min:step_size:x_max,y_min:step_size:y_max);
z = 100-x.^2-y.^2;
contour(x,y,z,10)

xlabel('x (m)')
ylabel('y (m)')
title('Path or robots over time: (All-to-All)')
legend('Bot 1', 'Bot 2', 'Bot 3', 'Bot 4', 'Formation Center', 'Countour')

