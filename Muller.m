function Muller(fun,x1,x2,tol,max)
% Find zero using Muller's method.
% Input:
% fun string containing name of function
% x1,x2  first two starting estimates
%         3rd estimate is (x1+x2)/2
% tol allowable change in successive iterates
% max     maximum number of iterations
% Output:
% x row vector of approximations to zero
% y row vector function fun(x)
tic
x(1)= x1; y(1)= feval( fun, x(1));
x(2)= x2; y(2)= feval( fun, x(2));
x(3)=(x(1)+x(2))/2;y(3)=feval(fun,x(3));
c(1)= ( y(2) - y(1))/(x(2) - x(1));
for i = 3 : max
  c(i-1) = (y(i)-y(i-1))/(x(i)-x(i-1));
  d(i-2) =(c(i-1)-c(i-2))/(x(i)-x(i-2));
  s= c(i-1)+(x(i)-x(i-1))*d(i-2);
  x(i+1)= x(i) - 2*y(i)/...
  (s+sign(s)*sqrt(s^2 - 4*y(i)*d(i-2)));
  y(i+1) = feval(fun, x(i+1));
  if abs(x(i+1) - x(i))< tol
   disp('Muller method has converged');    
   break;  end 
  iter=i; end 
if(iter >= max)
 disp('zero not found to desired tolerance'); end
n = length(x); k= 1:n; out= [k' x' y'];
disp('   step     x       y'), disp (out);
fprintf('\n zero = %3.15f \n',x(n));
toc

