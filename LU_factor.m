function [L,U] = LU_factor(A)
%  LU factorization of matrix A using Gaussian elimination without pivoting
% Input: A n-by-n matrix
% Output L,U ( lower and upper triangular
[n,m]=size(A);
L=eye(n);
U=A;
for j=1:n
   for i=j+1:n
      L(i,j)=U(i,j)/U(j,j);
      U(i,:)=U(i,:)-L(i,j)*U(j,:);
   end
end
% display L and U
L
U
% verify results
B=L*U
A
