F = @(x) (x^2)*sin(x);
x0 = 1;
x1 = pi();
err_tol = 10^-8
[area,interval_points] =Adaptive_Trapazoid(F,err_tol,x0,x1,[x0,x1]);
fprintf('area under the curve is %d \n',area);
fprintf('number of intervals taken is %d \n',length(interval_points)-1);