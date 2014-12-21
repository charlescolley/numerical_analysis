function [ fixed_point1 ] = Fixed_Point(P,domain,initial_guess,tol,iterations)
%UNTITLED Summary of this function goes here
%   this function implements fixed point iterations to find the roots of a
%   polynomial P
%   DOMAIN is a two element array that holds the left and right bound
%   INITIAL_GUESS is the starting point for the fixed point iteration
%   TOL is the tolerance that the iterations will stop at
%   ITERATIONS is a limit on how many tims the while loop will run
%   -->some fprintf functions have been commented out to <--

%checks on an inputted interval at the value of the Central difference
%formula for h = .01, some functions may require a finer mesh
%Central_Difference method is stored in Derivative_approximations folder
for i = domain(1):.01:domain(end)
    if abs(Central_Difference(P,.01,i)) > 1 %numerical method of calculating derivative
        fprintf('warning fixed point not garenteed at %d \n',i);
    end
end

z = 0;
r0 = initial_guess;

while z < iterations %bounds total number of iterations
    fixed_point1 = P(r0);
    %fprintf('rate of convergence is = %d \n',finite_difference(P,.01,fixed_point1))
    if abs(r0 - fixed_point1) < tol
        %fprintf('fixed point is %d \n',fixed_point1);
        break
    end
    r0 = fixed_point1;
    z = z +1;
end

