F1 = @(x) sin(x) - 6*x -5;
F1D = @(x) cos(x) -6;
x = -1.2;
Newtons_Method(F1,F1D,x,10^-6,20);

F2 = @(x) (1-(3/4*x))^(1/3);
F2D = @(x) (1/3)*((1-(3/(4*x)))^(-2/3))*(3/(4*x^2));
x = 1.2;
Newtons_Method(F2,F2D,x,10^-6,20);