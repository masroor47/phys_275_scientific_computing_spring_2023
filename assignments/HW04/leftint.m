


function A = leftint(f, left, right, intervals)

    x = linspace(left, right, intervals + 1)';

    delx = x(2:end) - x(1:end-1);

    areas = f(x(1:end - 1))' * delx;

    A = sum(areas);

end