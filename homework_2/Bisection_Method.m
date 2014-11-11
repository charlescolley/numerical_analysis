function [zeros] = Bisection_Method(tol,iter,P,x0,x1,show)
%bisection method that takes in tolerence, total number of iterations,
%a polynomial P, and the initial and final bounds to test upon
%show is a bool for whether or not the bounds and each iteration count is
%shown

%establish an iteration count 
k = 0;
while abs((1/2)*(x1- x0)) > (tol*10^-1)
    if k >= iter
        break
    end
    %get midpoint of the points
    midpoint = (x0 + x1)/2;
    %evaluate at each point
    p0 = P(x0);
    pm = P(midpoint);
    p1 = P(x1);

    %check for existance of root in interval
    if p0*pm < 0
        x1 = midpoint;
    elseif pm*p1 < 0
        x0 = midpoint;
    end
    if show == true
        fprintf('iteration %d \n',k);
        fprintf('first bound is %d \n',x0);
        fprintf('last bound is %d \n',x1);
    end
    k = k+1;
end
zeros = (x0+x1)/2;

