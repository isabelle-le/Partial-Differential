function[y]=analytical_solution(N,T)
time=linspace(0,T,N+1)
for n=1:N+1 %time loop
    y(n) = 3*exp(-2*time(n))
end
plot(time,y,'b','LineWidth',2)
hold on
title('Analytical solution')
legend ('y(n) = 3*exp(-2*time(n))')
xlabel('time')
ylabel('y(n)')
end
