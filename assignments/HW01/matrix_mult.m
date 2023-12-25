

function result = matrix_mult(mat1, mat2)
%   dimensions of the entry matricies
    mat1_dim = size(mat1);
    mat2_dim = size(mat2);

%   dimensions of the resulting matrix
    result_dim = [mat1_dim(1), mat2_dim(2)];

%   create empty result matrix
    result = zeros(result_dim);
    
%   iterate over rows of first matrix
    for row_idx = 1:result_dim(1)

%       iterate over columns of second matrix
        for col_idx = 1:result_dim(2)

%           corresponding vectors
            row_vector = mat1(row_idx, :);
            col_vector = mat2(:, col_idx);
%             disp(row_vector);
%             disp(col_vector);
%           dot product, or scalar product of the two vectors goes to
%           result's corresponding cell
            result(row_idx, col_idx) = dot_product(row_vector, col_vector);
        end
    end

end