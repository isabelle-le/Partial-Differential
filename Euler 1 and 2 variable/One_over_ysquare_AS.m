function[y]= One_over_ysquare_AS(N,T)
 N=100;
 T=5;
time = linspace(0,T,N+1);
for n=1:N+1
    y(n)=(3*time(n) + 3^3)^(1/3);
end
plot(y,time,'b');
hold on
title('Analytical solution');
legend('y(n)=(3*time(n) + 3^3)^1/3');
xlabel('time');
ylabel('y(n)');
end