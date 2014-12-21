function [ solution ] = Forward_Euler(derivative,initial_guess,h,start_time,end_time)
%This is an implementation of the Forward Euler method of solving ode's
%
%   DERIVATIVE the is the derivative function of the ode 
%   INITIAL_GUESS is the value of y(0)
%   H is the grid size
%   the start and end times are the initial and final values of time the
%   ode is being solved over

%make an array with all the time values being generated
grid = start_time:h:end_time;
%pre allocates the memory for the solution
solution = zeros(1,size(grid,2));
solution(1) = initial_guess;

for i = 2:size(grid,2)
    solution(i) = solution(i-1) +h*derivative(solution((i-1)));
end

plot(grid,solution);
