function x= Seidel(A,b,x0,tol,max)
% Solve a system of linear equations Ax=b
% using iterative Gauss-Seidel algorithm
% Inputs: A  coefficient matrix n-by-n
%			 b  rigth-hand side n-by-1
%       x0 initial solution n-by-1
%       tol stop if norm of change in x < tol
%       max  maximum number of iterations
% Output: x   solution vectorn-by-1
[n m] = size(A); x = x0; C= -A;
for i = 1:n,  C(i,i)=0; end
for i = 1:n
   C(i,1:n)=C(i,1:n)/A(i,i);
   r(i,1)=b(i)/A(i,i);
end
i=1;
disp('    i    x1    x2    x3  ....');
while(i<=max)
   xold=x; % save solution from previus step
   for j=1:n
      x(j)=C(j,:)*x+r(j);
   end
   disp([i  x']);
   if (norm(xold-x)<=tol)
      disp('Gauss-Seidel method converged'); 
      return;
   end
   i=i+1;
end
disp('Gauss-Seidel method did not converge ');
disp('results after maximum number of iterations');
x
