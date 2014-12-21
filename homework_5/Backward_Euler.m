function [ solution ] = Backward_Euler(Input_Function,Input_Derivative,initial_value,h,domain)
%	Charlie Colley
%   Backward Euler ode solver
%   12/3/2014
%   This function solves and plots a discretized solution to ode's
%   INPUT_FUNCTION is the differential equation to be solved
%   INPUT_DERIVATIVE is the dirivative of the differential equation (used in newtons method)
%   INITIAL_VALUE is the boundary value
%   DOMAIN is an array that holds the start and end point of the domain

grid = domain(1):h:domain(end); % build the grid
length = size(grid,2);

solution = zeros(1,length); %allocate memory for solution
solution(1) = initial_value; %insert boundary condition

for i = 2:length
Function = @(t) solution(i-1)+h*Input_Function(t) - t;
Derivative =@(t) h*Input_Derivative(t) - 1;
solution(i) = Newtons_Method(Function,Derivative,solution(i-1),10^(-3),25);
end

plot(grid,solution);

