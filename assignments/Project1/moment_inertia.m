% 3. 
% %moment of inertia 
% %off diagonal should be zero 

%just the visual 
clear

a = -pi : pi/2 : pi;                                % Define Corners
ph = pi/4;                                          % Define Angular Orientation (‘Phase’)
x = [cos(a+ph); cos(a+ph)]/cos(ph);
y = [sin(a+ph); sin(a+ph)]/sin(ph);
z = [-ones(size(a)); ones(size(a))];
figure
s1 = surf(x, y, z, 'FaceColor','g');                      % Plot Cube
hold on
s2 = patch(x', y', z', 'g');                              % Make Cube Appear Solid
hold off
axis([ -1  1    -1  1    -1  1]*3)
grid on

direc=[0 0 1];
orig=2*[0 0 0];

xline=orig(1)+direc(1)*[4 -4];
yline=orig(2)+direc(2)*[4 -4];
zline=orig(3)+direc(3)*[4 -4];

hold on
p1=plot3(xline,yline,zline,'r','LineWidth',3);
hold off

theta=10;
for i=1:720/theta
    pause(0.1)
rotate(s1,direc,theta,orig)
rotate(s2,direc,theta,orig)
end 

%when the box is at the origin 
a=1;
dx=0.01;
dy=0.01;
dz=0.01;

mass=1;
V=a^3;
rho=mass/V; 

dm=0.01;

x=-1:dx:1; 
y=-1:dy:1;
z=-1:dz:1;

[X,Y,Z]=meshgrid(x,y,z);


Ixx=sum((Y.^2+Z.^2)*dm,"all");
Iyy=sum((X.^2+Z.^2)*dm,"all");
Izz=sum((X.^2+Y.^2)*dm,"all");
Iyx=-sum(X.*Y.*dm,"all");, Ixy=Iyx;
Iyz=-sum(Y.*Z.*dm,"all");, Iyz=Iyz;
Izx=-sum(Z.*X.*dm,"all");, Izx=Izx;
I_origin = [Ixx, Ixy, Izx; Ixy, Iyy, Iyz; Izx, Iyz, Izz]


%at the corner
x_1=0:dx:1;
y_1=0:dy:1;
z_1=0:dz:1; 

[X1,Y1,Z1]=meshgrid(x_1,y_1,z_1); 

Ixx1=sum((Y1.^2+Z1.^2)*dm,"all");
Iyy1=sum((X1.^2+Z1.^2)*dm,"all");
Izz1=sum((X1.^2+Y1.^2)*dm,"all");
Iyx1=sum(X1.*Y1.*dm,"all");, Ixy1=Iyx1;
Iyz1=sum(Y1.*Z1.*dm,"all");, Iyz1=Iyz1;
Izx1=sum(Z1.*X1.*dm,"all");, Izx1=Izx1;
I_corner = [Ixx1, -Ixy1, -Izx1; -Ixy1, Iyy1, -Iyz1; -Izx1, -Iyz1, Izz1]

a = -pi : pi/2 : pi;                                % Define Corners
ph = pi/4;                                          % Define Angular Orientation (‘Phase’)
x = [cos(a+ph); cos(a+ph)]/cos(ph);
y = [sin(a+ph); sin(a+ph)]/sin(ph);
z = [-ones(size(a)); ones(size(a))];
figure
s1 = surf(x, y, z, 'FaceColor','b');                      % Plot Cube
hold on
s2 = patch(x', y', z', 'b');                              % Make Cube Appear Solid
hold off
axis([ -1  1    -1  1    -1  1]*4)
grid on

direc=[0 0 1];
orig=[1 1 1];

xline=orig(1)+direc(1)*[4 -4];
yline=orig(2)+direc(2)*[4 -4];
zline=orig(3)+direc(3)*[4 -4];

hold on
p1=plot3(xline,yline,zline,'r','LineWidth',3);
hold off

theta=10;
for i=1:720/theta
    pause(0.1)
rotate(s1,direc,theta,orig)
rotate(s2,direc,theta,orig)
end 