
function [f]= Boundary_Condition2(t,L,r,T,K)
f= L - exp(-r*(T-t))*K;
end