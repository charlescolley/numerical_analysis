function [L,U] = LU_decomposition(matrix)
%{
Charlie Colley
11-5-14
LU decomposition implementation
stores each the ratios used for the gaussian elimination in the L matrix
stores row echelon reduced form of matrix in the U matrix
%}
row_count = size(matrix,2);
column_count =size(matrix,1);

U = matrix;
L = eye(row_count);
for j = 1:column_count %iterate through columns
    for i = j+1:row_count %iterate through rows
        ratio = U(i,j)/U(j,j);
        L(i,j)= ratio;
        for k = j:column_count; %update rest of columns 
            U(i,k) = U(i,k)-ratio*U(j,k);
        end
    end
end

end
