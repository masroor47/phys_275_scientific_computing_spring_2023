clear

T = 40;
dt = 0.001;
t = (0:dt:T)';

theta = zeros([length(t), 1]);
theta(1) = pi;

vel = zeros([length(t), 1]);
vel(1) = 0.05;


w2 = 1;

for i =1:length(t)-1

    vel(i+1) = vel(i) - w2*sin(theta(i)) * dt;
    theta(i+1) = theta(i) + vel(i+1) * dt;

end

KE = 0.5.*vel.^2;

PE = w2.*(1 - cos(theta));

Energy = KE + PE;

plot(t, [KE, PE, Energy]);



theta1 = linspace(0,2*pi);
x1 = cos(theta1);
y1 = sin(theta1);
figure;
p = plot(x1,y1,[0 sin(theta(1))],[0 -cos(theta(1))],'-o');
axis square;

i = 1;
while i < length(t)
    p(2).XData(end) = sin(theta(i));
    p(2).YData(end) = -cos(theta(i));

    i = i + 10;
    pause(0.001);
end




