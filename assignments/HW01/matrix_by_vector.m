

function result = matrix_by_vector(mat1, vect)
%   dimensions of the entry matrix
    mat1_dim = size(mat1);

%   dimensions of the resulting matrix
    result_dim = [mat1_dim(1), 1];

%   create empty result matrix
    result = zeros(result_dim);
    
%   iterate over rows of first matrix
    for row_idx = 1:result_dim(1)
        
%       corresponding vector
        row_vector = mat1(row_idx, :);
        
        curr_result = 0;
        for i = 1:size(vect)
            curr_result = curr_result + row_vector(i) * vect(i);
        end
        result(row_idx, 1) = curr_result;
    end

end