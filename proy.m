clear;
clc;
dt=1E-11;
t=0:dt:1E-7;
r1=[0;0;0];
v1=[0;1E6;1E5];
bfun=@(x,y,z) [0.*x,0.*y,0.*z+3.2]; %en este caso un campo cte B=3E-4k
m=1.6726E-26;
q=1.6E-19;
[R,V,A,B]=VBVerlet(r1,v1,bfun,q,m,t);

figure(1);
plot3(R(1,:),R(2,:),R(3,:),'b',LineWidth=1.5);
axis('equal');
xlabel('X','FontSize',16);
ylabel('Y','FontSize',16);
zlabel('Z','FontSize',16);

% plot(R(1,:),R(2,:),'b',LineWidth=1.5)
% axis([-0.4,1.4,-0.6,1.2])
% axis('equal')


% figure(2)
% axis('equal')
% hold on
% for i=1:numel(t)
%     cla
%     plot(R(1,1:i),R(2,1:i),'b --',LineWidth=1.1)
%     plot(R(1,i),R(2,i),'r.',MarkerSize=15)
%     axis([-0.4,1.4,-0.6,1.2])
%     
%     title(['t = ',num2str(t(i),'%.3f'),' s'])
%     drawnow
% end



