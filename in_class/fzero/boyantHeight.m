

% Returns height if you give it densities of liquid and object 
% as well as radius

function h = boyantHeight(rhoO, rhoW, radius)
    if rhoO > rhoW
        error("It's gonna sink man!");
    end
    if radius < 0
        error("Invaild argument. Radius must be > 0");
    end

    h = justRho(rhoO / rhoW) * radius;
end


% returns ratio of height to radius and takes ratio of densities
% as input
function result = justRho(rhoRatio)
    full = @(x, rho) x^2 * (3 - x) - 4 * (rho);

    single = @(x) full(x, rhoRatio);
    
    x0 = [0, 2];
    result = fzero(single, x0);
end