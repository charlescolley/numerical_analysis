function [ Reduced,Reduced_RHS ] = Gaussian_Elim(matrix,RHS)
%{
Charlie Colley
11-5-14
Gaussian Elimination implementation
Takes in a Matrix,returns it in row echelon form,
also takes in a Right Hand Side RHS to solve a matrix system
%}
row_count = size(matrix,2);
column_count =size(matrix,1);
Reduced_RHS = zeros(row_count,1);
disp(Reduced_RHS);
Reduced = matrix;
for j = 1:column_count %iterate through columns
    for i = j+1:row_count %iterate through rows
        ratio = Reduced(i,j)/Reduced(j,j);
        for k = j:column_count; %update rest of columns 
            Reduced(i,k) = Reduced(i,k)-ratio*Reduced(j,k);
        end
        Reduced_RHS(i,1) = RHS(i) - ratio*RHS(j);
    end
end

end

