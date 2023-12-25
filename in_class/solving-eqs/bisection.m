clear

format long

f = @(x) -1 * (x.^3 + x - 1);
f1 = @(x) cos(2 * x * pi);

% disp(bisect(f, [0, 1]));

disp(bisect(f1, [0, 0.6]));

function root = bisect(varargin)
    f = varargin{1};
    range = varargin{2};
    a = range(1);
    b = range(2);
    
    fa = f(a);
    fb = f(b);

    x = linspace(a, b);
    plot(x, f(x), x, zeros(size(x)));

    
    if fa * fb >= 0
        error('Bisection method does not work. Endpoints have the same sign');
    end

    if fa < fb
        direction = 1;
    else
        direction = -1;
    end

    i = 0;

    c = (a + b) / 2;
    fc = f(c);


    
    while abs(fc) - 0.0000000001 > 0
  
        disp([a, b]);
        disp(fc);

        fc = fc * direction;

        if fc < 0
            a = c;
        elseif fc > 0
            b = c;
        end

        c = (a + b) / 2;
        fc = f(c);
    
        i = i + 1;
        
%         xline(c);
        pause(0.2);
        

    end
    root = a;
    disp(['Finished, ', num2str(i), ' iterations']);
%     disp([a, b])

end

% function result = root(varargin)
%     
% 
% end