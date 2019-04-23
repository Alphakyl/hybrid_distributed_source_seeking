function [val] = scalar_field_fnc(position)
%SCALAR_FIELD_FNC Summary of this function goes here
%   Detailed explanation goes here
     x = position(1);
     y = position(2);
     val = 100-x^2-y^2;
end

