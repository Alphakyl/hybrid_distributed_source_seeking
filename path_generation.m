function [ path ] = path_generation( type, steps )
%path_generation generates an arbitrary path type for the robot simulation
%   1 = circle
%   2 = square
%   3 = straigh line
%   Steps = # of steps in path
if type == 1
    radius = 5; % m
    x = radius*cos(0:2*pi/steps:2*pi)-radius;
    y = radius*sin(0:2*pi/steps:2*pi);
    heading = linspace(0,-2*pi,steps+1)+pi/2;
    heading(heading<-pi) = heading((heading<-pi))+2*pi;
    heading = wrapToPi(heading);
    path = [-x;y;heading]';
elseif type == 2
    side = 5;
    x = [0:side/(steps/4):side, 5*ones(1,steps/4),      side:-side/(steps/4):0,  zeros(1,steps/4)];
    y = [zeros(1,steps/4),      0:side/(steps/4):side,  5*ones(1,steps/4),      side:-side/(steps/4):0];
    heading = [zeros(1,steps/4),pi/2*ones(1,steps/4),   pi*ones(1,steps/4),     3*pi/2*ones(1,steps/4)];
    heading = wrapToPi(heading);
    path = [x;y;heading]';
elseif type == 3
    length = 5;
    x = 0:1/steps:5;
    y = zeros(1,steps);
    heading = zeros(1,steps);
    heading = wrapToPi(heading);
    path = [x;y;heading]';
%elseif type == 4
%     radius = 5 % m
%     a = 1;
%     b = 2;
%     x = radius*cos(a*(0:2*pi/steps:2*pi))-radius;
%     y = radius*sin(b*(0:2*pi/steps:2*pi));
%     heading = atan2(y,-x);
%     heading(1) = pi/2;
%     path = [-x;y;heading]';
end
end

