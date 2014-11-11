function [Area] = Trapazoidal_integration(F,x0,x1,step_size)
%Trapazoidal_integration, by taking trapazoids who's bases are evaluated at
%intervals of the function, an estimate of the area under the curve is
%found. F is the function, x0 is the inital point, x1 is the endpoint, and
%n is the number of intervals.

Area = 0;
interval_count = (x1-x0)/(step_size);
int8(interval_count);
intervals = x0:step_size:x1;

for i = 1:interval_count
    Area = Area + ((step_size/2)*(F(intervals(i))+F(intervals(i+1))));
end





