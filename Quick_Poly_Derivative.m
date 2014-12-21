function [ coefficients ] = Quick_Poly_Derivative(Polynomial,z)
%this function takes in a polynomial in the form of a list of coefficients
%the function builds an array of the coffiecients of a polynomial to
%use with the Quick_Poly function to evaluate the derivative at point of
%the polynomial's first derivative at a point z
B_n = Polynomial(end);
n = length(Polynomial); 
coefficients = [B_n];
for i = n-1:-1:2
    B_N = Polynomial(i) + z*B_n;
    coefficients = [coefficients,B_N];
    B_n = B_N;
end




end

