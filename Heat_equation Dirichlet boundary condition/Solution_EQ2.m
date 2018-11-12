function[]=Solution_EQ2()
L=1;
T=1;
M=5000;
N=19;
x=linspace(0,L,N+2);%space
t=linspace(0,T,M+2);%time
delt=T/(M+1);
delx=L/(N+1);
for i=1:N+2 
    U(1,i)=Inital_Condition2(x(i));
end
figure;
plot(x,U(1,:),'*');
xlabel('x');
ylabel('U(t,x=0)');
hold on;
for n=2:M+2
    U(n,1)=Boundary_Cond21(t(n));
    U(n,N+2)=Boundary_Cond22(t(n));
    (t(n));
end
figure;
plot(t,U(:,1),'*');
hold on;
plot(t,U(:,N+2),'*');
xlabel('t');
ylabel('U(t,x=1),U(t,x=0)');
for n=1:M+1
    for i=2:N+1
        U(n+1,i)=U(n,i)+ delt/(delx)^2 * (U(n,i+1)+U(n,i-1)-2*U(n,i))+(2*(x(i)+t(n))*delt);
    end
end
figure;
plot(x,U(M+2,:));%hai chieu, n=M+2 va t=T
figure;
surf(x,t,U);
xlabel('variable x');
ylabel('variable t');
zlabel('function u(t,x)');
title('solution Ut=Uxx+2(x+t)');
for j=1:101
    W(j,:)=U((j-1)*50+1,:);
end
%figure;
%surf(W);
tnew=(0:100)*T/(101);
figure
surf(x,tnew,W);
end