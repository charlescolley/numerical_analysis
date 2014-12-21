function [ root ] = Speed_Newton(Polynomial,x0,tol,iter)
%this function caluculates the roots of a polynomial using the Quick_Poly
%and Quick_Poly_Derivative functions. Polynomial must be a list of the
%coefficients of the Polynomial. x0 is the starting guess, tol is the
%tolerence of the error, and iter is an upper bounds of how many iterations
%to perform.
k = 0;
while k < iter
    derivative_coefficients = Quick_Poly_Derivative(Polynomial,x0);
    x1 = x0 -Quick_Poly(Polynomial,x0)/Quick_Poly(derivative_coefficients,x0);
    if abs(x1-x0) < tol
        root = x1;
        fprintf('zero is %d \n',x1);
        break
    end
    x0 = x1;
    k = k+1;
    if k >= iter
        fprintf('surpassed iteration limit \n');
    end
end

