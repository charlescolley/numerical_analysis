a = 3.592;
b = .04267;
R = .082057;
T = 300;
p = [1;10;100];

volumes = [];
VW1 = @(v) v^3 -(b+R*T)*v^2 +a*v - a*b;
VW2 = @(v) 10*v^3 -(10*b+R*T)*v^2 +a*v - a*b;
VW3 = @(v) 100*v^3 -(100*b+R*T)*v^2 +a*v - a*b;


volumes(end +1) = Bisection_multiplicity(10^-4,VW1,.1,R*T - 5,R*T+5);
volumes(end +1) = Bisection_multiplicity(10^-4,VW2,.1,R*T/10 - 5,R*T/10+5);
volumes(end +1) = Bisection_multiplicity(10^-4,VW3,.1,R*T/100 - 5,R*T/100+5);

volumes