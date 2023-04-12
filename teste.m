c=input('digite um número:  ');
x_new=1;x_old=10; k=0
while (abs(x_new-x_old)>0.0001 & (k<10))
k=k+1, x_old=x_new
x_new= 0.5*(x_old+c/x_old)
end

