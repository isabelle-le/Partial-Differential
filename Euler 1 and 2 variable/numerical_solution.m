 function[y]= numerical_solution(N,T)
delta=T/N;
time=linspace(0,T,N+1);
time(1)=0;
%y=zeros(N+1);
y(1)=3;
for n=1:N
    time(n+1)=time(n)+ delta;
    y(n+1)= y(n)+delta*(-2*y(n));
end
    plot(time,y,'r','LineWidth',2);
    hold on;
    title('Numerical solution');
legend ('y(n+1) = y(n)+DeltaT(-2y(n))');
xlabel('time');
ylabel('y(t)');
end 



