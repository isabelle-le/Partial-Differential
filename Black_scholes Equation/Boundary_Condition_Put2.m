
function [f]= Boundary_Condition_Put2(t,r,T,K)
f= K* exp(-r*(T-t));
end