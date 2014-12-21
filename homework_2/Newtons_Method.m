function [ x1 ] = Newtons_Method(Function,Der_Function,x0,tol,iter)
%UNTITLED3 Summary of this function goes here
%   Detailed explanation goes here
k = 0;
while k < iter
    x1 = x0 -(Function(x0)/Der_Function(x0));
    if abs(x1-x0) < tol
        %fprintf('zero is %d \n',x1);
        break
    end
    %fprintf('xk = %d  k = %d \n',x1,k);
    x0 = x1;
    k = k+1;
    if k >= iter
        fprintf('surpassed iteration limit \n');
    end
end

