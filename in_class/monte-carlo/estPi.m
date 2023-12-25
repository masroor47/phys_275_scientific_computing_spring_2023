

function y = estPi(numPoints)

    pointsIn = 0;
%     x1 = 2 * (rand([numPoints, 1]) - 0.5);
%     y1 = 2 * (rand([numPoints, 1]) - 0.5);

    for i = 1:numPoints
        if isInCirc()
            pointsIn = pointsIn + 1;
        end
    end

    y = 4 * pointsIn / numPoints;

end



function bool = isInCirc()

    x = 2 * rand() - 1;
    y = 2 * rand() - 1;

    if x ^ 2 + y ^ 2 < 1
        bool = true;
    else
        bool = false;
    end

end