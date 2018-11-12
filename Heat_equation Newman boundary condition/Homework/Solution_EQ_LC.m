function[]=Solution_EQ_LC()
L=1;
T=1;
M=999;
N=19;
x=linspace(0,L,N+2);%space
t=linspace(0,T,M+2);%time
delt=T/(M+1);
delx=L/(N+1);

for i=1:N+2 
    u(1,i)=Inital_Condition_LC(x(i));
end
figure;
plot(x,u(1,:),'*');
xlabel('x');
ylabel('U(t,x=0)');
hold on;
for n=1:M+1
    for i=2:N+1
        u(n+1,i)=u(n,i)+ delt/(delx)^2 * (u(n,i+1)+u(n,i-1)-2*u(n,i))+...
            3*sin(6*pi*t(n))*x(i)*delt*(u(n,i+1)-u(n,i-1))/(2*delx)-...
            (delt)*(1+t(n)*u(n,i)+((x(i))^2)/2);
    end
    u(n+1,1)= u(n+1,2)- delx*sin(2*pi*t(n+1));
    u(n+1,N+2)= u(n+1,N+1)+ delx*(3 -(t(n+1))^2);
end
figure;
plot(x,u(M+2,:));
figure;
surf(x,t,u);
xlabel('variable x');
ylabel('variable t');
zlabel('function u(t,x)');
title('solution u(t)=u(xx)-1-tu +3sin(6pit)*xu(x)-(x^2)/2');
for j=1:101
    w(j,:)=u((j-1)*10+1,:);
end
%figure;
%surf(W);
tnew=(0:100)*T/(101);
figure
surf(x,tnew,w);
xlabel('variable x');
ylabel('variable t');
zlabel('function u(t,x)');
title('solution u(t)=u(xx)-1-tu +3sin(6pit)*xu(x)-(x^2)/2');
end