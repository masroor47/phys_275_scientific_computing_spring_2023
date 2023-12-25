
function mag = vector_magnitude(vector)
    mag = 0;
%   iterate over each entry of the vector
    for a = vector
%       add entry squared to the running sum
        mag = mag + a * a;
    end
%   square root of the sum to get magnitude
    mag = sqrt(mag);
end

