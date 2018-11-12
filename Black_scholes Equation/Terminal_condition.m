function [g]= Terminal_condition(S,K)
g=max(S-K,0);
end