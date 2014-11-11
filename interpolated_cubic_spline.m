function [ ] = interpolated_cubic_spline(X,Y)
%creates a plot of a natural interpolated cubic spline
%X and Y are vectors with the coordinates being interpolated
%   NOTE: THERE IS AN IF STATEMENT FOR x == 1.75, there will be an error is
% if 1.75 doesn't exist in X, remove when neccessary

length = size(Y,1); %length of the vector
array_size = length-2;
intervals = [];
for i = 1:(length-1)
    intervals = [intervals,(X(i+1)-X(i))];    %makes the intervals 
end                                           %X must be sorted
A = zeros(array_size,array_size); 
%build the interval triagonal matrix
for i = 1:array_size
    for j = i-1:i+1
        if j < 1 || j > array_size %makes sure not out of bounds
            continue
        end
        if i == j %diagonal case
            A(i,j) = 2*(intervals(i)+intervals(i+1));
        elseif i< j %upper diagonal case
            A(i,j) = intervals(j);
           
        elseif i> j %lower diagonal
           A(i,j) = intervals(i);
            
        end
    end
end
B=zeros(array_size,1);
%create the right hand side
for i = 1:array_size
    B(i) = -6*((-1/intervals(i))*Y(i)+((1/intervals(i))+...
        (1/intervals(i+1)))*Y(i+1)+(-1/intervals(i+1))*Y(i+2));
end
z =A\B;
%since spline is nature add z(1) = 0, z(4)= 0
z = [0;z;0];
%evaluate all the respective polynomials
i = 1;
x = X(1);
ploty = [];
while x < X(end)
    if x > X(i+1)
        i=i+1;
    end
    F = @(x) (z(i)/(6*intervals(i)))*(X(i+1)-x)^3 +...
        (z(i+1)/(6*intervals(i)))*(x-X(i))^3 +...
        ((Y(i+1)-z(i+1)*(intervals(i)^2)/6)/intervals(i))*(x-X(i))+...
        (Y(i)-z(i)*(intervals(i)^2)/6)/(intervals(i))*(X(i+1)-x);
    ploty = [ploty,F(x)];
    if abs(x - 1.75) < 10^-8
        fprintf('p = 1.75, V = %d',F(x));
    end
    x = x+.01;
end

plot([X(1):.01:X(end)],ploty);

