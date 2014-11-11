error = [];
F = @(x) 4/(1+x^2);
for i = 1:11
    E = pi()-Romberg_integration(F,0,1,i);
    error = [error,E];
end

plot([0:10],error)


