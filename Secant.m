function  Secant (fun, a, b, tol, max)
%   find a zero using secant method.
%   fun       string containing name of function
%   a, b      first two estimates of the zero
%   tol       tolerance for change in computed zero
%   max       maximum number of iterations
%   x         vector of approximations to zero
%   y         vector of function values fun(x)
tic
x(1) = a;  			  x(2) = b;
y(1) = feval ( fun, x(1));  y(2) = feval (fun, x(2));
for i = 2 : max
    x(i+1) = x(i) - y(i) * (x(i) - x(i-1))/(y(i) - y(i-1));
    y(i+1) = feval(fun, x(i+1));
    if (abs((x(i+1)-x(i))/x(i+1)) < tol)
           disp(' method has converged '); break;
    end
    if  y(i) == 0.0
          disp (' exact zero found '); break;
    end
    iter = i;
end
if (iter >= max)
     disp (' zero not found to desired tolerance ');
end
n = length(x);
k = 1 : n;
out = [ k'     x'     y' ];
disp ('     step       x         y  '), disp (out)
fprintf('\n zero = %3.15f \n',x(n));
toc
