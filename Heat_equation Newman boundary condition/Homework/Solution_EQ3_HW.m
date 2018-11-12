function[]=Solution_EQ3_HW()
L=1;
T=2;
M=1999;
N=19;
x=linspace(0,L,N+2);%space
t=linspace(0,T,M+2);%time
delt=T/(M+1);
delx=L/(N+1);

for i=1:N+2 
    u(1,i)=Inital_Condition3(x(i));
end
figure;
plot(x,u(1,:),'*');
xlabel('x');
ylabel('U(t,x=0)');
hold on;
for n=2:M+2
    u(n,1)= Boundary_Condition31(t(n));
    u(n,N+2)= Boundary_Condition32(t(n));
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
            ((delt*x(i))/2*delx)*(u(n,i+1)-u(n,i-1))-...
            (delt)*(1+t(n)*u(n,i)+((x(i))^2)/2);
    end
end
figure;
plot(x,u(M+2,:));
figure;
surf(x,t,u);
xlabel('variable x');
ylabel('variable t');
zlabel('function u(t,x)');
title('solution u(t)=u(xx)-1-tu + xu(x)-(x^2)/2');
for j=1:101
    w(j,:)=u((j-1)*20+1,:);
end
%figure;
%surf(W);
tnew=(0:100)*T/(101);
figure
surf(x,tnew,w);
xlabel('variable x');
ylabel('variable t');
zlabel('function u(t,x)');
title('solution u(t)=u(xx)-1-tu + xu(x)-(x^2)/2');
end