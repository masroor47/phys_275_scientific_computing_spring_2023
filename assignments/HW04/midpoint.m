


function A = midpoint(f, left, right, intervals)

    x = linspace(left, right, intervals + 1)';

    delx = x(2:end) - x(1:end-1);

    xmids = (x(1:end - 1) + x(2:end)) / 2;

    areas = f(xmids)' * delx;

    A = sum(areas);

end