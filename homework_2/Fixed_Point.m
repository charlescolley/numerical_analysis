function [ fixed_point1 ] = Fixed_Point(P,left_bound,right_bound,tol,iterations)
%UNTITLED Summary of this function goes here
%   this function implements fixed point iterations to find the roots of a
%   polynomial

%checks on an inputted interval at the value of the finite difference
%formula for h = .01, some functions may require a finer mesh
for i = left_bound:.01:right_bound
    if finite_difference(P,.01,i) > 1
        fprintf('warning fixed point not garenteed at %d \n',i);
    end
end

z = 0;
r0 = (left_bound+right_bound)/2 ;
% calculates the 
while z < iterations
    fixed_point1 = P(r0);
    fprintf('rate of convergence is = %d \n',finite_difference(P,.01,fixed_point1))
    if abs(r0 - fixed_point1) < tol
        fprintf('fixed point is %d \n',fixed_point1);
        break
    end
    r0 = fixed_point1;
    z = z +1;
end

