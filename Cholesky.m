function [L,U]=Cholesky(A)
% A is assumed to be symmetric
% L is computed, and U=L'
[n,m]=size(A); % The dimension of A  
L = zeros(n,n); % Initialize L
for k = 1:n
   L(k,k)=sqrt(A(k,k)-L(k,1:k-1)*L(k,1:k-1)')
   for i= k+1:n
      L(i,k)=(A(i,k)-L(i,1:k-1)*L(k,1:k-1)')/L(k,k)
   end
end
U=L'
L*U
