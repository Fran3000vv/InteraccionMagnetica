clear;
close all;
clc;
dt=1E-9;
t=0:dt:1E-5;
r1=[0;0;0];
v1=[0;1E6;1E5];
bfun=@(x,y,z) [0.*x,0.*y,0.*z+0.4]; %en este caso un campo cte B=3E-4k
m=1.6726E-26;
q=1.6E-19;
[R,V,A,B]=VBVerlet(r1,v1,bfun,q,m,t);

figure(1);
plot3(R(1,:),R(2,:),R(3,:),'b',LineWidth=1.5);
axis('equal');
xlabel('X','FontSize',16);
ylabel('Y','FontSize',16);
zlabel('Z','FontSize',16);


dx=min([max(R(1,:))-min(R(1,:)),max(R(2,:))-min(R(2,:)),max(R(3,:))-min(R(3,:))])/5;
xg = min(R(1,:)):dx:max(R(1,:)) ; % Crea un vector de  componentes para las is
yg = min(R(2,:)):dx:max(R(2,:)) ; % Crea un vector de  componentes para las 2s
zg = min(R(3,:)):dx:max(R(3,:)) ; % Crea un vector de  componentes para las 3s
[X,Y,Z] = meshgrid(xg,yg,zg) ; % Construye el mallado 3D
hold on;
quiver3(X,Y,Z,X*0,Y*0,Z*0+0.4);