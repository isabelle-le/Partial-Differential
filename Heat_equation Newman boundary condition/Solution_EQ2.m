function[]=Solution_EQ2()
L=1;
T=1;
M=999;
N=19;
x=linspace(0,L,N+2);%space
t=linspace(0,T,M+2);%time
delt=T/(M+1);
delx=L/(N+1);

for i=1:N+2 
    u(1,i)=Inital_Condition2(x(i));
end
figure;
plot(x,u(1,:),'*');
xlabel('x');
ylabel('U(t,x=0)');
hold on;
for n=2:M+2
    u(n,N+2)= Boundary_Condition22(t(n));
end
figure;
plot(t,u(:,1),'*');
hold on;
plot(t,u(:,N+2),'*');
xlabel('t');
ylabel('U(t,x=1),U(t,x=0)');
for n=1:M+1
    for i=2:N+1
        u(n+1,i)=u(n,i)+ delt/(delx)^2 * (u(n,i+1)+u(n,i-1)-2*u(n,i))+...
        2*(delt/delx)*x(i)*(u(n,i+1)-u(n,i-1))+4*(x(i))^2*delt*u(n,i);
    end
    u(n+1,1)= u(n+1,2);
end
figure;
plot(x,u(M+2,:));%hai chieu, n=M+2 va t=T
figure;
surf(x,t,u);
xlabel('variable x');
ylabel('variable t');
zlabel('function u(t,x)');
title('solution ut=uxx+4ux+4x^2u');
for j=1:101
    W(j,:)=u((j-1)*10+1,:);
end
%figure;
%surf(W);
tnew=(0:100)*T/(101);
figure
surf(x,tnew,W);
end