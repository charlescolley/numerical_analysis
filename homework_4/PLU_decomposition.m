function [L.U,P] = PLU_Decomposition(matrix)
%this function produces an LU decomposition of a matrix along with the 
%permuation matrix for the partial pivoting

row_count = size(matrix,1);
column_count = size(matrix,2);
L = eye(row_count); 
P = eye(row_count);
U = matrix;
for j = 1:column_count %iterate through column
    for i = j:row_count %iterate through rows for elimination
        
    end
end

end

