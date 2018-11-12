function[]=Solution_BS()
K=10;
L=2*K;
T=1;
M=4999; 
N=99;
S=linspace(0,L,N+2);%space
t=linspace(0,T,M+2);%time
delt=T/(M+1);
dels=L/(N+1);
r=0.1;
sigma=0.5;
for i=1:N+2 
    V(M+2,i)= Terminal_condition(S(i),K);
end
figure;
plot(S,V(M+2,:),'*');
xlabel('variable s');
ylabel('funtion V(M+2,i)');
hold on;
for n=1:M+1
    V(n,1)= Boundary_Condition1(t(n));
    V(n,N+2)=Boundary_Condition2(t(n),L,r,T,K);
end
figure;
plot(t,V(:,1),'*');
hold on;
plot(t,V(:,N+2),'*');
xlabel('variable t');
ylabel('funtion V(t,S=L),V(t,S=0)');
for n=M+2:-1:2
    for i=2:N+1
        V(n-1,i)= V(n,i)+ delt*r*S(i)*(V(n,i+1)-V(n,i-1))/(2*dels)+...
            delt*sigma^2 * S(i)^2 *(V(n,i+1)+V(n,i-1)-...
            2*V(n,i))/(2*dels^2)- r*delt* V(n,i);
    end
end
figure;
plot(S,V(1,:));
xlabel('price of stock');
ylabel('price of option V(t,S)');
figure;
surf(S,t,V);
xlabel('price of stock');
ylabel('time t to maturity');
zlabel('price of option V(t,S)');
title('solution Black Scholes');
for j=1:101
    w(j,:)=V((j-1)*50+1,:);
end
%figure;
%surf(w);
tnew=(0:100)*T/(101);
figure
surf(S,tnew,w);
xlabel('price of stock');
ylabel('time t to maturity');
zlabel('price of option V(t,s)');
title('Solution Black Scholes ');
end