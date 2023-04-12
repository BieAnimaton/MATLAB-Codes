function  Newton (fun, fun_pr, x1, tol, max)
% Find zero near x1 using Newton's method.
% Input:
%    fun     string containing name of function
%    fun_pr  name of derivative of function
%    x1      starting estimate
%    tol     allowable tolerance in computed zero
%    max     maximum number of iterations
% Output:
%    x      (row) vector of approximations to zero
%    y      (row) vector function fun(x)
tic
x(1)= x1;
y(1)= feval( fun, x(1));
y_pr(1) = feval( fun_pr, x(1));
for i = 2 : max
   x(i) = x(i-1) - y(i-1)/y_pr(i-1);
   y(i) = feval( fun, x(i));
   if abs((x(i) - x(i-1))./x(i))< tol
      fprintf('\n\n');
      disp('Newton method has converged '); break;
   end
   y_pr(i)= feval(fun_pr, x(i));
   iter=i;
end
if(iter >= max)
   disp( 'zero not found to desired tolerance');
end
n = length(x);
k= 1:n;
out= [k' x' y'];
disp ('     step       x         y  '), disp (out);
fprintf('\n zero = %3.15f \n',x(n));
toc


