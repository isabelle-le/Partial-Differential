 function[]= Euler(N,T,Myfun)
 %mot bien time
delta=T/N;
time=linspace(0,T,N+1);
time(1)=0;
%y=zeros(N+1);
y(1)=3;
for n=1:N
    time(n+1)=time(n)+ delta;
    y(n+1)= y(n)+delta*Myfun(y(n));
end
    plot(y,time,'r','LineWidth',2);
    hold on 
    title('Euler');
xlabel('time');
ylabel('y(t)');
end 