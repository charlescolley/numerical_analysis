function [ ] = SIR_model(initial_S,initial_R,initial_I,b,Y,h,Domain)
%This is an implementation of a a Susceptible, Infectious, Recovered (SIR) 

%INITIAL_S -> the initial susceptible population
%INITIAL_R -> the initial recovered population, typically 0
%INITIAL_I -> the initial infectious population
%b -> number of contacts an infected person meets
%Y -> the recovery rate exist in (0,1]
%h -> grid size
%Domain -> an array that holds the initial and final value of the time
%          domain
%there are different sections of the code for each of the different methods
%used, i would recommend commenting out the method not desired.
N = initial_I+initial_R+initial_S;
grid = Domain(1):h:Domain(end); % make the grid
S_pop = zeros(1,size(grid,2)); 
R_pop = zeros(1,size(grid,2));
I_pop = zeros(1,size(grid,2));

%initialize the first values
S_pop(1) = initial_S;
R_pop(1) = initial_R;
I_pop(1) = initial_I;

%build the model's ode's
Susceptible_ode = @(t,I,S) (-1)*(b*I*S)/N; 
Recovered_ode = @(t,I) Y*I;
Infectious_ode = @(t,I,S) (-I)*(Y+(-1)*(b*S)/N);

%build derivatives of ode's (needed for backward Euler and Crank_nicolson(newton's method is used))
S_der = @(t,I,S) (-b/N)*(I*Susceptible_ode(t,I,S) +S*Infectious_ode(t,I,S));
R_der = @(t,I) Y*I;
I_der = @(t,I,S) (-1)*((-b/N)*(I*Susceptible_ode(t,I,S) +S*Infectious_ode(t,I,S))+Y*I);

%forward Euler Method

for i = 2:size(grid,2)
   I_pop(i) = h*Infectious_ode((i-1),I_pop(i-1),S_pop(i-1))+I_pop(i-1);
   R_pop(i) = R_pop(i-1)+h*Recovered_ode((i-1),I_pop(i-1));
   S_pop(i) = S_pop(i-1)+h*Susceptible_ode(i-1,I_pop(i-1),S_pop(i-1));
   pop = I_pop(i)+R_pop(i)+S_pop(i);
end



% %Backward Euler Method
% for i = 2:size(grid,2)
%     %update susceptible population
%     S_Function = @(t) S_pop(i-1)+h*Susceptible_ode(t,I_pop(i-1),S_pop(i-1))*t/S_pop(i-1)-t;
%     S_Derivative = @(t) h*S_der(t,I_pop(i-1),S_pop(i-1))/S_pop(i-1) - 1;
%     S_pop(i) = Newtons_Method(S_Function,S_Derivative,S_pop(i-1),10^(-4),200);
%     
%     %update Infectious population
%     I_Function = @(t) I_pop(i-1)+h*Infectious_ode(t,I_pop(i-1),S_pop(i-1))*t/I_pop(i-1)-t;
%     I_Derivative = @(t) h*I_der(t,I_pop(i-1),S_pop(i-1))/I_pop(i-1) - 1;
%     I_pop(i) = Newtons_Method(I_Function,I_Derivative,I_pop(i-1),10^(-4),200);
%     
%     %update Recovered population
%     R_pop(i) = N -I_pop(i)-S_pop(i);
% end

%Crank Nicolson Method
% for i = 2:size(grid,2)
%     %update susceptible population
%     S_Function = @(t) S_pop(i-1)+(h/2)*(Susceptible_ode((i-1),I_pop(i-1),S_pop(i-1))+Susceptible_ode(t,I_pop(i-1),S_pop(i-1))*t/S_pop(i-1))-t;
%     S_Derivative = @(t) (h/2)*S_der(t,I_pop(i-1),S_pop(i-1))/S_pop(i-1) - 1;
%     S_pop(i) = Newtons_Method(S_Function,S_Derivative,S_pop(i-1),10^(-4),200);
%     
%     %update Infectious population
%     I_Function = @(t) I_pop(i-1)+(h/2)*(Infectious_ode(t,I_pop(i-1),S_pop(i-1))+ Infectious_ode(t,I_pop(i-1),S_pop(i-1))*t/I_pop(i-1))-t;
%     I_Derivative = @(t) (h/2)*I_der(t,I_pop(i-1),S_pop(i-1))/I_pop(i-1) - 1;
%     I_pop(i) = Newtons_Method(I_Function,I_Derivative,I_pop(i-1),10^(-4),200);
%     
%     %update Recovered population
%     R_pop(i) = N -I_pop(i)-S_pop(i);
% end

plot(grid,N,'-m');
hold on
plot(grid,I_pop,'-b');
plot(grid,R_pop,'-r');
plot(grid,S_pop,'-g');
xlabel('time');
ylabel('population')
hold off

end

