clear

N = 1000;

x = NaN([N + 1, 1]);
y = NaN([N + 1, 1]);

x(1) = 0;
y(1) = 0;

p1 = plot(x, y, '-o');

hold on

p2 = plot(x(1), x(2), 'o');
p2.MarkerFaceColor = p2.Color;

hold off

for i = 1:N

    step = rand;

    if step < 1/4
        x(i+1) = x(i) + 1;
        y(i+1) = y(i);

    elseif step < 2/4
        x(i+1) = x(i) - 1;
        y(i+1) = y(i);

    elseif step < 3/4
        x(i+1) = x(i);
        y(i+1) = y(i) + 1;
    else
        x(i+1) = x(i);
        y(i+1) = y(i) - 1;
    end

    p1.XData(i+1) = x(i+1);
    p1.YData(i+1) = y(i+1);

    p2.XData(1) = x(i+1);
    p2.YData(1) = y(i+1);

    pause(0.1)

end

hold off
