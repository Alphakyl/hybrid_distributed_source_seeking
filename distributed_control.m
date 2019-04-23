function [u] = distributed_control(x,x_d,c_0,g_c,v,c_1,c_2, L_1, L_2)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
k = size(x,2);
n = size(x,1);

for ii = 1:n
    temp1 = 0;
    temp3 = 0;
    for jj = 1:n
        if (ii~=jj)
            % sum_j\in F(i) w1ij(x_i-x_j-x_di+x_dj)
            temp1 = -L_1(ii,jj)*(x(ii,:)-x(jj,:)-x_d(ii,:)+x_d(jj,:));
            % sum_j\in F(i) w2ij(vi-vj)
            temp3 = -L_2(ii,jj)*(v(ii,:)-x(jj,:));
        end
    end
    % c_0 gc
    temp2 = c_0*g_c';
    % c_1/n*sum(vi)
    temp4 = c_1/n*sum(v);
    % c2sign(sum(v_i))
    temp5 = c_2*sign(sum(v));
    u(ii,:) = -temp1+temp2-temp3-temp4-temp5;
end


% u = -kron(L_1,eye(1))*(x-x_d)...
%     -kron(L_2,eye(1))*v...
%     +c_0*kron(ones(n,1),g_c)...
%     -c_1/n*kron(ones(n,1),kron(ones(n,1)',eye(1))*v)...
%     -c_2/n*kron(ones(n,1),sign(ones(n,1)',eye(1))*v);
end

