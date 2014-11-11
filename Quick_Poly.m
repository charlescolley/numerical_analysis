function [ value ] = Quick_Poly(coefficient_vector,z)

%Quick_Poly is a function that computes the value of a polynomial at a 
%point in linear time. the first input is the coefficients of the
%polynomial in an array, the second input is the point the polynomial is 
%being evaluated at/
B_n = coefficient_vector(end); 
n = length(coefficient_vector);
if n == 1
    B_N = B_n;
end
for i = n-1:-1:1 
    B_N = coefficient_vector(i)+B_n*z;
    B_n = B_N;
end
 value = B_N;
