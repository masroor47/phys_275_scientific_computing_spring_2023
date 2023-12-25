%Off center

clear

%six sides
%1st surface
Q=1;
dx=0.001;
dy=0.001;
dz=0.001;
r_charge=[0.2,0.3,0.5];

x=-1:dx:1;
y=-1:dy:1; 
z=-1:dz:1; 

%S1
[X1,Y1]=meshgrid(x,y);
Z1=ones(size(X1));
d1=sqrt((X1-r_charge(1)).^2+(Y1-r_charge(2)).^2+(Z1-r_charge(3)).^2);
epsilon_0 = 8.8541878128e-12;
E1 = Q./ (4. * pi.* epsilon_0.* d1.^2);
cosine1=abs((r_charge(3)-Z1)./d1);
flux1=sum((dx*dy).*E1.*cosine1,"all");

%S2
[X2,Y2]=meshgrid(x,y);
Z2=-1*ones(size(X1));
d2=sqrt((X2-r_charge(1)).^2+(Y2-r_charge(2)).^2+(Z2-r_charge(3)).^2);
epsilon_0 = 8.8541878128e-12;
E2 = Q./ (4. * pi.* epsilon_0.* d2.^2);
cosine2=abs((r_charge(3)-Z2)./d2);
flux2=sum((dx*dy).*E2.*cosine2,"all");

%S3
[X3,Z3]=meshgrid(x,z);
Y3=1*ones(size(X1));
d3=sqrt((X3-r_charge(1)).^2+(Y3-r_charge(2)).^2+(Z3-r_charge(3)).^2);
epsilon_0 = 8.8541878128e-12;
E3 = Q./ (4. * pi.* epsilon_0.* d3.^2);
cosine3=abs((r_charge(2)-Y3)./d3);
flux3=sum((dx*dz).*E3.*cosine3,"all");
%
%S4
[X4,Z4]=meshgrid(x,z);
Y4=-1*ones(size(X1));
d4=sqrt((X4-r_charge(1)).^2+(Y4-r_charge(2)).^2+(Z4-r_charge(3)).^2);
epsilon_0 = 8.8541878128e-12;
E4 = Q./ (4. * pi.* epsilon_0.* d4.^2);
cosine4=abs((r_charge(2)-Y4)./d4);
flux4=sum((dx*dz).*E4.*cosine4,"all");

%S5
[Y5,Z5]=meshgrid(y,z);
X5=1*ones(size(X1));
d5=sqrt((X5-r_charge(1)).^2+(Y5-r_charge(2)).^2+(Z5-r_charge(3)).^2);
epsilon_0 = 8.8541878128e-12;
E5 = Q./ (4. * pi.* epsilon_0.* d5.^2);
cosine5=abs((r_charge(1)-X5)./d5);
flux5=sum((dy*dz).*E5.*cosine5,"all");

%S6
[Y6,Z6]=meshgrid(y,z);
X6=-1*ones(size(X1));
d6=sqrt((X6-r_charge(1)).^2+(Y6-r_charge(2)).^2+(Z6-r_charge(3)).^2);
epsilon_0 = 8.8541878128e-12;
E6 = Q./ (4. * pi.* epsilon_0.* d6.^2);
cosine6=abs((r_charge(1)-X6)./d6);
flux6=sum((dy*dz).*E6.*cosine6,"all");

%total flux
fluxoffcenter=flux1+flux2+flux3+flux4+flux5+flux6
theoreticalvalue=1/epsilon_0