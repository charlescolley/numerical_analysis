function [ Approx ] = Central_Difference(FUNC,h,x)
%Charlie Colley
%Central Difference Dirivative Approximation
%12/1/2014

%this is an implementation of the Central difference method
%FUNC the function who's derivative is being approximated
%H is the mesh size
%X is the value of the domain to be approximated at

Approx = (FUNC(x+h)-FUNC(x-h))/(2*h); 

end

