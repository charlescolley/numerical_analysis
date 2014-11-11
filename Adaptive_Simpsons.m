function [ Area ] = Adaptive_Simpsons(Function,error_tol,x0,x1)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
midpoint = (x0+x1)/2;
%calculate the appropriate simpsons approximations
Area_x0_midpoint = ((midpoint-x0)/6)*(Function(x0)+4*Function((midpoint+x0)/2)+Function(midpoint));
Area_midpoint_x1 = ((x1-midpoint)/6)*(Function(midpoint)+4*Function((midpoint+x1)/2)+Function(x1));
Area_x0_x1 = ((x1-x0)/6)*(Function(x0)+4*Function((x1+x0)/2)+Function(x1));

eta = abs(Area_x0_midpoint + Area_midpoint_x1 - Area_x0_x1);
check = 16*error_tol*(x1-x0);
if eta <= check
    Area = Area_x0_midpoint +Area_midpoint_x1;
else
    Area = Adaptive_Simpsons(Function,error_tol,x0,midpoint) + Adaptive_Simpsons(Function,error_tol,midpoint,x1);
end

