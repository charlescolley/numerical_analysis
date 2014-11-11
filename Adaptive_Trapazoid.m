function [ Area,interval_points ] = Adaptive_Trapazoid(Function,error_tol,x0,x1,interval_points)
%adaptive Trapazoid composition
%recursively finds the area under an integral

midpoint = (x0+x1)/2;
interval_points = [interval_points,midpoint];
interval_points = sort(interval_points);
%calculate the appropriate trapazoids
Area_x0_midpoint = (midpoint-x0)*(Function(x0)+Function(midpoint))/2;
Area_midpoint_x1 = (x1-midpoint)*(Function(midpoint)+Function(x1))/2;
Area_x0_x1 = (x1-x0)*(Function(x1)+Function(x0))/2;

%calculate the error estimates
eta = abs((Area_x0_midpoint + Area_midpoint_x1 -Area_x0_x1));
check = 3*error_tol*(x1-x0);
if eta <= check %if acceptable return area
    Area = Area_x0_midpoint + Area_midpoint_x1;    
else %if unacceptable call function on the two subintervals
    [Area1,interval_points] = Adaptive_Trapazoid(Function,error_tol,x0,midpoint,interval_points);
    [Area2,interval_points] = Adaptive_Trapazoid(Function,error_tol,midpoint,x1,interval_points);
    Area = Area1+Area2;
end



