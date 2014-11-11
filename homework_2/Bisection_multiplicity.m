function  [list_of_zeros] = Bisection_multiplicity(tol,P,interval_to_check,init_bound,final_bound)
% take an interval and evaluate which intervals should contain zeros

x0 = init_bound;
x1 = final_bound;

intervals = [];

for i = x0:interval_to_check:(x1-interval_to_check)
    if P(i)*P(i+interval_to_check) < 0;
        intervals(end + 1) = (i);
        intervals(end + 1) = (i + interval_to_check);
    end
end

%make a list of zeros    
list_of_zeros = [];
%run bisection_method on each interval to find the zeros
for i = 1:2:(length(intervals)-1)
    list_of_zeros(end +1) = Bisection_Method(tol,25,P,intervals(i),intervals(i+1),false);
end
    