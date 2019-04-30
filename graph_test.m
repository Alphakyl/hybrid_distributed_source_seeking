%% Cleanup
clear all
close all
clc
%% Adjacency Matrices for all connected 3 node graphs
A3(:,:,1) = [0 1 1; 1 0 1; 1 1 0];
A3(:,:,2) = [0 1 0; 1 0 1; 0 1 0];
A3(:,:,3) = [0 1 1; 1 0 0; 1 0 0];
A3(:,:,4) = [0 0 1; 0 0 1; 1 1 0];

for ii = 1:size(A3,3)
    graph3{ii} = graph(A3(:,:,ii));
end

figure
plot(graph3{1})
title('All-to-All Graph/Graph 1')
figure
plot(graph3{2})
title('Limited Communication/Graph 2')
figure
plot(graph3{3})
title('Limited Communication/Graph 3')
figure
plot(graph3{4})
title('Limited Communication/Graph 4')

%% Adjacency Matrices for all spanning trees of 4 node all-to-all
A4(:,:,1) = [0 1 1 1; 1 0 1 1; 1 1 0 1; 1 1 1 0];
A4(:,:,2) = [0 1 1 0; 1 0 0 0; 1 0 0 1; 0 0 1 0];
A4(:,:,3) = [0 1 1 0; 1 0 0 1; 1 0 0 0; 0 1 0 0];
A4(:,:,4) = [0 1 1 1; 1 0 0 0; 1 0 0 0; 1 0 0 0];
A4(:,:,5) = [0 0 1 0; 0 0 0 1; 1 0 0 1; 0 1 1 0];
A4(:,:,6) = [0 0 1 0; 0 0 1 0; 1 1 0 1; 0 0 1 0];
A4(:,:,7) = [0 0 1 1; 0 0 0 1; 1 0 0 0; 1 1 0 0];
A4(:,:,8) = [0 0 1 0; 0 0 1 1; 1 1 0 0; 0 1 0 0];
A4(:,:,9) = [0 0 1 1; 0 0 1 0; 1 1 0 0; 1 0 0 0];
A4(:,:,10)= [0 1 0 0; 1 0 0 1; 0 0 0 1; 0 1 1 0];
A4(:,:,11)= [0 1 0 1; 1 0 0 0; 0 0 0 1; 1 0 1 0];
A4(:,:,12)= [0 1 0 0; 1 0 1 0; 0 1 0 1; 0 0 1 0];
A4(:,:,13)= [0 1 0 0; 1 0 1 1; 0 1 0 0; 0 1 0 0];
A4(:,:,14)= [0 1 0 1; 1 0 1 0; 0 1 0 0; 1 0 0 0];
A4(:,:,15)= [0 0 0 1; 0 0 0 1; 0 0 0 1; 1 1 1 0];
A4(:,:,16)= [0 0 0 1; 0 0 1 0; 0 1 0 1; 1 0 1 0];
A4(:,:,17)= [0 0 0 1; 0 0 1 1; 0 1 0 0; 1 1 0 0];
for ii = 1:size(A4,3)
    graph4{ii} = graph(A4(:,:,ii));
%    figure
%    plot(graph4{ii})
end