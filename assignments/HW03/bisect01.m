
function x = bisect01(varargin)
    f = varargin{1};
    a = varargin{2};
    b = varargin{3};
    tol = 10^(-10);

    if nargin > 3
        tol = varargin{4};
    end

%     disp(['a = ', num2str(a), ', b = ', num2str(b), ', tol = ', num2str(tol)]);
    
    fa = f(a);
    fb = f(b);

    if fa * fb >= 0
        erroro('Bisection method does not work. Endpoints have the same sign')
    end


    direction = 1;
    if fa > fb
        direction = -1;
    end

    c = (a + b) / 2;
    fc = f(c);

    i = 0;

    while abs(fc) > tol

        fc = fc * direction;
        
        if fc < 0
            a = c;
        elseif fc > 0
            b = c;
        else
            break
        end

        c = (a + b) / 2;
        fc = f(c);

        i = i + 1;
    end
    x = c;
end