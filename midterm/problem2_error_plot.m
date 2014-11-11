I0 = log(6)- log(5);
I_n = I0;
n = 0;
F = @(x) (x.^n)./(x+5);
recur_y = [I_n];
real_y = [integral(F,0,1)];
for n = 1:7
I_N = (1/n - 5*I_n);
F = @(x) (x.^n)./(x+5);
disp(I_N);
real_y = [real_y,integral(F,0,1)];
recur_y = [recur_y,I_N];
I_n = I_N;
end
disp(I_N);
diff = abs(real_y - recur_y);
plot([0:7],diff);