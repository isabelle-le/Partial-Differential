function[f]=Initial_Condition_Guitar(x)
if (x>0 && x<1/2)
    f = 2*x; 
else
f = 2-2*x;
end
