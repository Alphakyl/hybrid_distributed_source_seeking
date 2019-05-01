function [u] = distributed_control(x,x_d,c_0,g_ce,v,z5,c_1,c_2, L_1, L_2)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
k = size(x,2);
n = size(x,1);

for ii = 1:n
    temp1 = 0;
    temp3 = 0;
    for jj = 1:n
        if (L1(ii,jj)~=0 && (ii~=jj))
            % sum_j\in F(i) w1ij(x_i-x_j-x_di+x_dj)
            temp1 = temp1+-L_1(ii,jj)*(x(:,ii)-x(:,jj)-x_d(:,ii)+x_d(:,jj));
            % sum_j\in F(i) w2ij(vi-vj)
            temp3 = temp3+-L_2(ii,jj)*(v(:,ii)-v(:,jj));
        end
    end
    % c_0 gc
    temp2 = c_0*g_ce';
    % c_1/n*sum(vi)
    temp4 = c_1*z5(:,ii);
    % c2sign(sum(v_i))
    temp5 = c_2*sign(z5(:,ii));
    u(:,ii) = -temp1+temp2-temp3-temp4-temp5;
end

end

