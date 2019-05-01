%% Cleanup
close all
clear all
clc
%% Create initial conditions
% Generate an all to all graph for a 3 robot system represented by the
% graphs laplacian L_0
% L_0 = [2 -1 -1;
%     -1 2 -1;
%     -1 -1 2];
L_0 = [3 -2 -2 -2;
    -2 3 -2 -2;
    -2 -2 3 -2;
    -2 -2 -2 3];
% Use constants and scaling from Shang Li
L_1 = 6*L_0;
L_2 = L_0;
c_0 = 20;
c_1 = 7;
c_2 = 7;
% Set desired formation to be an equilateral triangle
x_d = 0.3*[0 0;
    0 1;
    1 0;
    1 1];
% Establish initial conditions for x:
% e.g. robots starting in a vertical line at edge of map
x_1 = [-4; -5];
x_2 = [-4; -4];
x_3 = [-4; -3];
x_4 = [-4; -2];
X(:,:,1) = [x_1';x_2';x_3';x_4'];
% Establish initial conditions for v:
% e.g. robots not moving
V(:,:,1) = [0 0; 0 0; 0 0;0 0];
g_c(:,1) = center_gradient_estimate(X,1);
u(:,:,1) = all_to_all_control(X(:,:,1),x_d,c_0,g_c(:,1),V(:,:,1),c_1,c_2,L_1,L_2);
%% Step through simulation
h = 0.01;
t = 0:h:10;
%for ii=2:length(t)
ii = 2;
while(norm(g_c(:,ii-1))>0.03)
   V(:,:,ii) = RK4_velocity(V(:,:,ii-1),u(:,:,ii-1),h);
   X(:,:,ii) = RK4_position(X(:,:,ii-1),V(:,:,ii-1),h);
   g_c(:,ii) = center_gradient_estimate(X,ii);
   u(:,:,ii) = all_to_all_control(X(:,:,ii),x_d,c_0,g_c(:,ii),V(:,:,ii),c_1,c_2,L_1,L_2);
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

hold off
figure
subplot(2,1,1)
hold on
plot(squeeze(V(1,1,:)))
plot(squeeze(V(2,1,:)))
plot(squeeze(V(3,1,:)))
plot(squeeze(V(4,1,:)))
legend('Robot 1', 'Robot 2', 'Robot 3', 'Robot 4')
xlabel('Timestep')
ylabel('X Velocity')
subplot(2,1,2)
hold on
plot(squeeze(V(1,2,:)))
plot(squeeze(V(2,2,:)))
plot(squeeze(V(3,2,:)))
plot(squeeze(V(4,2,:)))
legend('Robot 1', 'Robot 2', 'Robot 3', 'Robot 4')
xlabel('Timestep')
ylabel('Y Velocity')
title('Velocity of robots')
