function x= LU_Solve(L,U,b)
% function to solve the equation LUx=b
% L lower triangular matrix (unity diagonal)
% U  upper triangular matrix
% b rigth-hand side vector
[n m]= size(L); z= zeros(n,1); x=zeros(n,1);
% solve Lz = b
z(1)=b(1)
for i = 2:n
   z(i)=b(i)-L(i,1:i-1)*z(1:i-1)
end
% solve Ux = z
x(n) = z(n)/U(n,n);
for i = n-1:-1:1
   x(i) = (z(i) -U(i,i+1:n)*x(i+1:n))/U(i,i);
end
