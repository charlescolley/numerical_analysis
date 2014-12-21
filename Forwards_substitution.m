function [RHS] = Forwards_substitution(matrix,RHS)
%this is an implementation of a foward substitution
%this code needs an upper triangular matrix

row_count = size(matrix,1);
column_count = size(matrix,2);
for i = 1:row_count
    for j = i:column_count
        if(i ~= j) %subtract solved variables from equation
            RHS(i) = RHS(i)-matrix(i,j)*RHS(j);
            matrix(i,j) = 0;
        else
            denominator = matrix(i,j);
            matrix(i,j) = matrix(i,j)/denominator; %turn entry to a 1
            RHS(i) = RHS(i)/denominator;
        end
    end
end

