function[]=Solution_EQ11()
L=1;
T=1;
M=5000;
N=19;
x=linspace(0,L,N+2);%space
t=linspace(0,T,M+2);%time
delt=T/(M+1);
delx=L/(N+1);

for i=1:N+2 
    u(1,i)=Inital_Condition(x(i));
end
figure;
plot(x,u(1,:),'*');
xlabel('x');
ylabel('U(t,x=0)');
hold on;

for n=1:M+1
    for i=2:N+1
        u(n+1,i)=u(n,i)+ delt/(delx)^2 * (u(n,i+1)+u(n,i-1)-2*u(n,i))-2*(delt);
    end
    u(n+1,1)=u(n+1,2)+delx;
    u(n+1,N+2)=u(n+1,N+1);
end
figure;
plot(x,u(M+2,:));%hai chieu, n=M+2 va t=T
figure;
surf(x,t,u);
xlabel('variable x');
ylabel('variable t');
zlabel('function u(t,x)');
title('solution ut=uxx-2');
for j=1:101
    W(j,:)=u((j-1)*50+1,:);
end
%figure;
%surf(W);
tnew=(0:100)*T/(101);
figure
surf(x,tnew,W);
end