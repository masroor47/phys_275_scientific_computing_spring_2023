
function A = int(varargin)
    f = varargin{1};
    left = varargin{2};
    right = varargin{3};
    intervals = varargin{4};

    method = @trap;
    disp(nargin)
    if nargin > 4
        method_string = varargin{5};
        disp("in if statement")
        switch method_string
            case "left"
                method = @leftint;
            case "right"
                method = @rightint;
            case "midpoint"
                method = @midpoint;
            case "trapezoid"
                method = @trap;
            otherwise
                error(strcat("unsupported integral method string '", method_string, "'"));
        end
    end
    
    
    


    A = method(f, left, right, intervals);


end