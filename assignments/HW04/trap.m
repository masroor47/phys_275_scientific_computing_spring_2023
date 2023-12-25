


function A = trap(f, left, right, intervals)

    x = linspace(left, right, intervals + 1)';

    delx = x(2:end) - x(1:end-1);
    fVals = f(x);

    double_areas = (fVals(1:end - 1) + fVals(2:end))' * delx;

    A = sum(double_areas) / 2;

end