%% Cleanup
close all
clear all
clc

%% Create initial conditions
% Generate seed for consistency
rng(100)
% Generate an all to all graph for a 3 robot system represented by the
% graphs laplacian L_0
% L_0 = [1 -1 0;
%     -1 2 -1;
%     0 -1 1];
% adjacency = [0 1 0; 1 0 1; 0 1 0];
L_0 = [2 -1 -1;
    -1 2 -1;
    -1 -1 2];
adjacency = 30*[0 1 1; 1 0 1; 1 1 0];

% Use constants and scaling from Shang Li
L_1 = 6*L_0;
L_2 = L_0;
c_0 = 20;
c_1 = 7;
c_2 = 7;
gamma = 1;
% Set desired formation to be a triangle
n = 3;
k = 2;
x_d = 0.3*[0 0;
    0 1;
    1 0]';
% Establish initial conditions for x:
% e.g. robots starting in a vertical line at edge of map
x(:,1) = [-4; -5];
x(:,2) = [-4; -4];
x(:,3) = [-4; -3];
% Establish initial conditions for v:
% e.g. robots not moving
v = zeros(size(x));
% Initialize Z1-Z5 (Use a slight random element to make inverse non
% singular)
for ii = 1:n
    Z1(:,:,ii) = gamma*(x(:,ii)*x(:,ii)'+rand(2,2));
    z2(:,ii) = gamma*(x(:,ii)+rand(2,1));
    z3(:,ii) = gamma*(x(:,ii)*scalar_field_fnc(x(:,ii)));
    z4(:,ii) = gamma*(scalar_field_fnc(x(:,ii)));
    z5(:,ii) = gamma*(v(:,ii));
end

g_ce(:,:,1) = distributed_center_gradient_estimate(Z1,z2,z3,z4);
u(:,:,1) = distributed_control(x,x_d,c_0,g_ce(:,:,1),v,z5,c_1,c_2,L_1,L_2);
%% Step through simulation
h = 0.01;
t = 0:h:10;
for ii=2:length(t)
%ii = 2;
%while(norm(g_ce(:,:,ii-1))>0.06)
   v(:,:,ii) = RK4_velocity(v(:,:,ii-1),u(:,:,ii-1),h);
   x(:,:,ii) = RK4_position(x(:,:,ii-1),v(:,:,ii-1),h);
   Z1(:,:,:,ii) = RK4_Z1(x(:,:,ii-1),Z1(:,:,:,ii-1),gamma,adjacency,h);
   z2(:,:,ii) = RK4_Z2(x(:,:,ii-1),z2(:,:,ii-1),gamma,adjacency,h);
   z3(:,:,ii) = RK4_Z3(x(:,:,ii-1),z3(:,:,ii-1),gamma,adjacency,h);
   z4(:,:,ii) = RK4_Z4(x(:,:,ii-1),z4(:,:,ii-1),gamma,adjacency,h);
   z5(:,:,ii) = RK4_Z5(v(:,:,ii-1),z5(:,:,ii-1),gamma,adjacency,h);
   g_ce(:,:,ii) = distributed_center_gradient_estimate(Z1(:,:,:,ii),z2(:,:,ii),z3(:,:,ii),z4(:,:,ii));
   u(:,:,ii) = distributed_control(x(:,:,ii),x_d,c_0,g_ce(:,:,ii),v(:,:,ii),z5(:,:,ii),c_1,c_2,L_1,L_2);
 %  ii = ii+1;
 %  norm_stuff_for_debugging(:,ii) = norm(g_ce(:,:,ii-1))
%end
end

hold on
plot(squeeze(x(1,1,:)),squeeze(x(2,1,:)))
plot(squeeze(x(1,2,:)),squeeze(x(2,2,:)))
plot(squeeze(x(1,3,:)),squeeze(x(2,3,:)))
%plot(1/3*(squeeze(x(1,1,:))+squeeze(x(2,1,:))+squeeze(X(3,1,:))),...
%    1/3*(squeeze(X(1,2,:))+squeeze(X(2,2,:))+squeeze(X(3,2,:))),'.')

% Map a 10x10 room for the agents to navigate in
x_min = -5;
x_max = 5;
y_min = -5;
y_max = 5;
step_size = 0.01;

[x_contour,y_contour] = meshgrid(x_min:step_size:x_max,y_min:step_size:y_max);
z = 100-x_contour.^2-y_contour.^2;
contour(x_contour,y_contour,z,10)

xlabel('x (m)')
ylabel('y (m)')
title('Path or robots over time: (All-to-All)')
legend('Bot 1', 'Bot 2', 'Bot 3', 'Bot 4', 'Formation Center', 'Countour')

