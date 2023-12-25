


function A = rightint(f, left, right, intervals)

    x = linspace(left, right, intervals + 1)';

    delx = x(2:end) - x(1:end-1);

    areas = f(x(2:end ))' * delx;

    A = sum(areas);

end