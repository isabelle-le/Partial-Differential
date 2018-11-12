function[]=Solution_EQ4_HW()
L=1;
T=2;
M=1999;
N=19;
x=linspace(0,L,N+2);%space
t=linspace(0,T,M+2);%time
delt=T/(M+1);
delx=L/(N+1);

for i=1:N+2 
    u(1,i)=Inital_Condition3(x(i));% it is the same as No.3
end
figure;
plot(x,u(1,:),'*');
xlabel('x');
ylabel('U(t,x=0)');
hold on;
for n=1:M+1
    for i=2:N+1
        u(n+1,i)=u(n,i)+ delt/(delx)^2 * (u(n,i+1)+u(n,i-1)-2*u(n,i))+...
            (delt/2*(delx))*x(i)*(u(n,i+1)-u(n,i-1))-(delt)*(1+t(n)*u(n,i)+((x(i))^2)/2);
    end
    u(n+1,1)= u(n+1,2)-(delx)*t(n+1);
    u(n+1,N+2)= u(n+1,N+1)+(delx)*(3/2+(t(n+1))^2);
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