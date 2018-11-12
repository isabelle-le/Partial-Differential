function[]=Wave_Guitar()
a = 1;
M = 4999;
N = 99;
L = 1;
T = 1;
x = linspace(0,L,N+2);
t= linspace(0,T,M+2);
deltat = T/(M+1);
deltax = L/(N+1);

for i= 1:N+2
    u(1,i) = Initial_Condition_Guitar(x(i));
    u(2,i) = u(1,i);
end
figure;
plot (x,u(1,:));
xlabel('x value');
ylabel('U(t,x=0)');
hold on;

for n = 3 : M+2;
    u(n,1) = 0;
    u(n,N+2) = 0;
end

for n = 2:M+1;
    for i = 2:N+1;
        u(n+1,i) = -u(n-1,i) + 2*u(n,i) + (a^2)*((deltat^2)/(deltax^2))*...
            (u(n,i+1) + u(n,i-1) - 2*u(n,i));
    end
end
figure;
plot (x,u(M+2,:));

%animation
for n = 1:50:M+1
    plot(x,u(n,:));
    axis([0 L -1 1]);
    Gauss(n) = getframe
end 
movie(Gauss);
end





