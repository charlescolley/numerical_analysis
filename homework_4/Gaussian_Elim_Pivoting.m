function [ Pivot_matrix,Reduced,Reduced_RHS ] = Gaussian_Elim_Pivoting(matrix,RHS)
%{
Charlie Colley
11-5-14
Gaussian Elimination implementation with pivoting
Takes in a Matrix,returns it in nearly row echelon form (1,1) entry isn't 1,
also takes in a Right Hand Side RHS to solve a matrix system
RHS is in the form of a row vector
also returns a permuation matrix of the pivots
%}
row_count = size(matrix,2);
column_count =size(matrix,1);
Reduced = matrix;
Reduced_RHS = RHS;
Pivot_matrix = eye(row_count);
for j = 1:column_count %iterate through columns
    for i = j+1:row_count %iterate through rows
        
        largest_entry = 0;
        largest_entry_index = -1; %negative to alert if bugs occur
        
        for k = j:row_count % look for the largest magnitude elem to reduce F.P.E.
           if(abs(Reduced(k,j)) > largest_entry)
              largest_entry_index = k;
              largest_entry = Reduced(k,j);
           end
        end
        %rearrange the rows in the matrix
        Temp_Row_Holder = Reduced(largest_entry_index,:);
        Reduced(largest_entry_index,:) = Reduced(j,:);
        Reduced(j,:) = Temp_Row_Holder;
        
        %rearrange the rows in the pivot matrix
        Pivot_Temp_Row_Holder = Pivot_matrix(largest_entry_index,:);
        Pivot_matrix(largest_entry_index,:) = Pivot_matrix(j,:);
        Pivot_matrix(j,:) = Pivot_Temp_Row_Holder;
        
        %rearrange the entries in the RHS vector
        Temp_Number = Reduced_RHS(largest_entry_index);
        Reduced_RHS(largest_entry_index) = Reduced_RHS(j);
        Reduced_RHS(j) = Temp_Number;
        

        ratio = Reduced(i,j)/Reduced(j,j);        
        for k = j:column_count; %update rest of columns 
            Reduced(i,k) = Reduced(i,k)-ratio*Reduced(j,k);
        end
        Reduced_RHS(i,1) = RHS(i) - ratio*RHS(j);
    end
end

%Backwards Substitution 
%{
for i = row_count:-1:1
    for j = i:-1:1
        ratio = 1/Reduced(i,j);
        Reduced_RHS(j) = ratio*Reduced_RHS(j);
    end
en
%}

