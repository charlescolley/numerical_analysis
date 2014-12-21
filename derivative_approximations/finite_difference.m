function [ Function_D_value ] = finite_difference(Function,h,x)
%finite_difference implementation of Newton's finite difference method of
%derivatives

%the form chosen to help reduce floating point error
Function_D_value = ((Function(x+h)^2)-(Function(x))^2)/(h*(Function(x+h)+Function(x)));



end

