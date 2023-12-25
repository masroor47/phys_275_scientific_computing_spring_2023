
function result = dot_product(vector_1,vector_2)
%   initialize result integer
    result = 0;

%   iterate over each entry
    for i = 1:length(vector_1)
%       add product of entries of the two vectors to result
        result = result + vector_1(i) * vector_2(i);
    end
end