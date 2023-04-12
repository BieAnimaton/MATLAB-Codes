function x= Jacobi(A,b,x0,tol,max)
% Solve a system of linear equations Ax=b
%       using iterative Jacobi algorithm
% Inputs:A  coefficient matrix n-by-n
%			   b  rigth-hand side n-by-1
%        x0 initial solution n-by-1
%        tol stop if norm of change in x < tol
%        max  maximum number of iterations
% Output: x   solution vectorn-by-1
[n m] = size(A); xold = x0; C= -A;
for i = 1:n, C(i,i)=0, end
for i = 1:n
   C(i,:)=C(i,:)/A(i,i);
   d(i,:)=b(i)/A(i,i);
end
i=1
disp('    i    x1    x2    x3  ....');
while(i<=max)
   xnew = C*xold+d;
   disp([i  xnew']);
   if (norm(xnew-xold)<=tol)
      x=xnew;
      disp('Jacobi method converged');
      return;
   else  xold=xnew;
   end
   i=i+1;
end
disp('Jacobi method did not converge ');
disp('results after maximum number of iterations');
x=xnew;
      
