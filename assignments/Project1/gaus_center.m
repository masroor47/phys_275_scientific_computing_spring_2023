% 2. 
% %Gauss's Law 
clear
a = -pi : pi/2 : pi;                                % Define Corners
ph = pi/4;                                          % Define Angular Orientation (‘Phase’)
x = [cos(a+ph); cos(a+ph)]/cos(ph);
y = [sin(a+ph); sin(a+ph)]/sin(ph);
z = [-ones(size(a)); ones(size(a))];
figure
surf(x, y, z, 'FaceColor','w')                      % Plot Cube
hold on
patch(x', y', z', 'w')                              % Make Cube Appear Solid
hold off
axis([ -1  1    -1  1    -1  1]*1.5)
grid on

hold on
[X,Y,Z] = sphere(10);
[U,V,W] = surfnorm(X,Y,Z);
quiver3(X,Y,Z,U,V,W,0)
axis equal
hold off

%compute the flux 

% Define the position of the point charge and the dimensions of the square

r = [0, 0, 0]; % Position of the point charge

%compute the flux on the xy plane

dx=0.0001;
dy=0.0001;


X=0:dx:0.5;
Y=0:dy:0.5; 
[X,Y]=meshgrid(X,Y);

dist=sqrt((X.^2)+(Y.^2)+0.5^2);
Q=1;

%Gauss's law
epsilon_0 = 8.8541878128e-12; % Vacuum permittivity
E_mag = Q./ (4. * pi.* epsilon_0.* dist.^2);


cosine=0.5./dist;
flux=sum((dx*dy).*E_mag.*cosine,"all");

fluxforcube=24*flux
theoreticalvalue=1/epsilon_0 



