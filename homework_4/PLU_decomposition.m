function [L,U,P] = PLU_decomposition(matrix)
%this function produces an LU decomposition of a matrix along with the 
%permuation matrix for the partial pivoting

row_count = size(matrix,1);
column_count = size(matrix,2);
L = eye(row_count); 
P = eye(row_count);
U = matrix;
for j = 1:column_count %iterate through column
    for i = j:row_count %iterate through rows for elimination
        largest_entry = 0;
        largest_entry_index = -1;
        
        for k = j:row_count % look for largest element in column
            if(abs(U(k,j))>largest_entry)
                largest_entry = U(k,j);
                largest_entry_index = k;
            end
        end
        
        
    end
end

end

