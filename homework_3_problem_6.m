B = 100;
A = (3-2*sqrt(2))/B;
K = B*(1-A*B)^(1/2);
G = @(x) (4*pi()*sqrt(A))*(1-K*(x.^2)).^(1/2);
x0 = 0;
x1 = (sqrt(B))^(-1);
[Area,interval_points] = Adaptive_Trapazoid(G,10^-5,x0,x1,[x0,x1]);
xplot = [0:.01:x1];
yplot = G(xplot);
hold on
PLOT = plot(xplot,yplot);
yplot = G(interval_points);
PLOT = plot(interval_points,yplot,'->r');
hold off
