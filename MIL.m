function [x,y] = MIL(F,fun,x1,tol,max)
% Finds zero, of function fun, near x1 using MIL.
% Input:
%    F     string containing name of iteration function
%    x1      starting estimate
%    tol     allowable tolerance in computed zero
%    max     maximum number of iterations
% Output:
%    x      (row) vector of approximations to zero
%    y      (row) vector function fun(x)
tic
x(1)= x1; y(1) = feval(fun,x1);
for i = 2 : max
   x(i) = feval(F,x(i-1));
   y(i) = feval(fun,x(i-1));
   if abs((x(i) - x(i-1))./x(i))< tol
      fprintf('\n\n');
      disp('MIL method has converged '); break;
   end
   iter=i;
end
toc
if(iter >= max)
   disp( 'zero not found to desired tolerance');
end
n = length(x);
k= 1:n;
out= [k' x' y'];
disp ('     step       x         y  '), disp (out);
fprintf('\n zero = %3.15f \n',x(n));
