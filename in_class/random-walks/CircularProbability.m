clear


numPoints = 1000000;
x = rand([numPoints, 1]);
y = rand([numPoints, 1]);

buckets = zeros([158, 1]);

angles = round(100 * atan(y./x)) + 1;

for i = 1:numPoints
    angle = angles(i);
    buckets(angle) = buckets(angle) + 1;
end


plot(buckets);