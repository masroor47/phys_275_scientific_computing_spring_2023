clear

dx = pi/100;
x = 0:dx:2*pi;
amplitude = sin(x);

p1 = plot(x, amplitude);

for i = 1:1000
    p1.YData = sin(x - i/100);
    pause(0.01);
end
