function [R,V,A,B]=VBVerlet(r1,v1,bfun,q,m,t)
%VBVerlet, modificacion para resolver problemas concampos magneticos, 
%los inputs son la posicion, velocidad y campo magnetico iniciales,
%asi como la funcion campo magnetico, la carga y masa (de la particula) 
%y el vector fila t con los valores discretizados del tiempo

fB=@(v,B) q.*cross(v,B); %funcion fuerza magnetica
ac=@(v,B) (fB(v,B))./m; %función aceleracion

R(:,1)=r1; % posicion inicial r1=R(1:3,1) (hay tres componentes de Rt)
V(:,1)=v1;
b1=bfun(r1(1),r1(2),r1(3));
B(:,1)=b1;
A(:,1)=ac(v1,b1); % aceleracion inicial

for k=1:numel(t)-1
    dt=t(k+1)-t(k);
    R(:,k+1)=R(:,k)+V(:,k).*dt+A(:,k).*(dt.^2)./2;
    B(:,k+1)=bfun(R(1,k+1),R(2,k+1),R(3,k+1));
    A(:,k+1)=ac(V(:,k)+A(:,k).*dt,B(:,k+1)); %provisional
    V(:,k+1)=V(:,k)+(A(:,k)+A(:,k+1)).*dt/.2;
    A(:,k+1)=ac(V(:,k+1),B(:,k+1)); %definitiva
end
end