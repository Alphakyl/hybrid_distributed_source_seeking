function [val] = scalar_field_fnc(x, y)
%SCALAR_FIELD_FNC Calculates the value of the scalar field at point (x,y)
%   In a given environment while the field may not be known, for
%   simulations a field can be created arbitrarily, and this function will
%   act as the "sensor"
     val = 100-x^2-y^2;
end

