function [ final_value ] = Romberg_integration(F,x0,x1,iterations)
%Romberd_integration implementation
%this function uses the Trapazoidal_integration function in it's code
%the function takes in a function to be evaluated, and a initial point and
%a final point


distance = (x1-x0);
TI = zeros(iterations,iterations);

for i = 1:iterations
    TI(i,1) = Trapazoidal_integration(F,x0,x1,distance/(2^(i-1)));
end

%got the romberg recursive evaluation function from
%http://www.mathstat.dal.ca/~tkolokol/classes/1500/romberg.pdf

for j = 2:iterations % iterate through all the columns but the first
    for i = j:iterations %iterate through diagonal and down
        TI(i,j) = ((4^(j-1))*TI(i,j-1)-TI(i-1,j-1))/((4^(j-1))-1);
    end
end

final_value = TI(iterations,iterations);



